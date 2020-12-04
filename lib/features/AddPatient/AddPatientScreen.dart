import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/common/IDScanModel.dart';
import 'package:umedmiscanner/features/AddPatient/HusbandEnglish.dart';
import 'package:umedmiscanner/features/AddPatient/model/Item.dart';
import 'package:umedmiscanner/features/SingleScan/SingleScan.dart';
import 'package:umedmiscanner/features/home/drawer/circular_image.dart';
import 'package:umedmiscanner/features/SingleScan/models/IDScan_Model.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:numberpicker/numberpicker.dart';

import 'PatientInformation.dart';
import 'SavePatientBloc.dart';

bool husbandenglish_showwidget = false;

String profileImagePath;

String husbandName;
LoadingDialog loadingDialog;
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
TextEditingController arabicNameController,englishNameController,emailController,homeController,phoneController,
    emergencyPhoneController,professionalEngController,professionalArabicController,regionEngController,regionArabicController,genderController,birthdateController,ageController,
    cityController,maritalStatusController,husbandNameController,husbandNameEngController,nationalIDController,ethnicGroupController,
    countryController,countryEngController,nationalityController,currentCityController;






class AddPatientScreen extends StatefulWidget {

//  final IDScan_Model idScan_Model;

  const AddPatientScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _AddPatientScreenState();
  }
}





class _AddPatientScreenState extends State<AddPatientScreen> {

  ScrollController _scrollController;
  bool _isOnTop = true;


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();


  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
    setState(() => _isOnTop = true);
  }

  _scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeOut);
    setState(() => _isOnTop = false);
  }




  @override
  Widget build(BuildContext context) {
    return savePatientWidgets(context,(){
      showLoadingDialog();


      SavePatientBloc().savePatient(homeController.text.toString(), birthdateController.text.toString(),countryController.text.toString(),
          countryEngController.text.toString(),IDScanModel.idScanModel.encryption,arabicNameController.text.toString(),englishNameController.text.toString(),
      IDScanModel.idScanModel.genderArabic,  IDScanModel.idScanModel.genderEnglish,nationalIDController.text.toString(),IDScanModel.idScanModel.idCardExpiration,IDScanModel.idScanModel.idValidity,professionalArabicController.text.toString(), professionalEngController.text.toString(),
      IDScanModel.idScanModel.mainBirthPlaceArabic, IDScanModel.idScanModel.mainBirthPlaceEnglish, IDScanModel.idScanModel.maritalStatusArabic, IDScanModel.idScanModel.maritalStatusEnglish,
          nationalityController.text.toString(), IDScanModel.idScanModel.profileImage,regionArabicController.text.toString(),regionEngController.text.toString(),
          "",_handleLoginSuccess, _handleLoginError);
      //encryption,gender arabic,gender eng,idCardExpiration,idValidity,profileImage,ssn

    });



  }
  _handleLoginSuccess(String data) {
    hideDialog();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => PatientInformation(phoneNumber:phoneController.text.toString(),email:emailController.text.toString())),
    );

  }
  void showLoadingDialog() async {
    loadingDialog = LoadingDialog();
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => loadingDialog);
  }

  Future<void> hideDialog() async {
    if (loadingDialog != null && loadingDialog.isShowing()) {
      Navigator.of(context).pop();
      loadingDialog = null;
    }
  }

  void showSnack(String msg) async {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(msg)));
  }
  _handleLoginError(FormatException e) {
    print("e: ${e.message}");
    hideDialog();

  }

  savePatientWidgets(BuildContext context,Function onSubmit){
    return Scaffold(
        body:
        ListView(
          controller: _scrollController,
          padding: EdgeInsets.all(10.0),
          children: [
            AddPatientWidgets(onSubmit: onSubmit),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: _isOnTop ? _scrollToBottom : _scrollToTop,
          child: Icon(_isOnTop ? Icons.arrow_downward : Icons.arrow_upward),
          backgroundColor:primaryColor,
        ));
  }
}

class AddPatientWidgets extends StatefulWidget{

//  final IDScan_Model idScan_Model;
  final Function onSubmit;

  const AddPatientWidgets({Key key,  this.onSubmit}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _AddPatientWidgetsState();
  }
}
class _AddPatientWidgetsState extends State<AddPatientWidgets> {


  bool dropDownButton=false;
  Item selectedUser;


  File profileImageFile;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1980, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        birthdateController.text="${selectedDate.toLocal()}".split(' ')[0];
        ageController.text=(DateTime.now().year- picked.year).toString();
        print("age : ${ageController.text}");

      });
  }

  Future<String> translateDataToEng(String arabicText)async {
    var dio = Dio();
    try {
      FormData formData = FormData.fromMap({
        "Text": arabicText,
      });
      var response = await dio.post("http://3.139.34.137:8080/Translatetoeng", data: formData);
      print(response.data["textInEnglish"]);
      print(response.data);
      return response.data["textInEnglish"];
    } catch (e) {
      print(e);
      return "";
    }
  }
  Future<String> translateDataToArabic(String engText)async{
    var dio = Dio();
    try {
      FormData formData = FormData.fromMap({
        "Text": engText,
      });
      var response = await dio.post("http://3.139.34.137:8080/Translatetoara", data: formData);
      print(response.data["textInArabic"]);
      print(response.data);
      return response.data["textInArabic"];
    } catch (e) {
      print(e);
      return "";
    }
  }

  @override
  void initState() {
    super.initState();
    countryController= new TextEditingController();
    countryEngController= new TextEditingController();
    nationalityController= new TextEditingController();
    currentCityController= new TextEditingController();
    nationalIDController= new TextEditingController();
    ethnicGroupController= new TextEditingController();
    cityController= new TextEditingController();
    maritalStatusController= new TextEditingController();
    husbandNameController= new TextEditingController();
    husbandNameEngController= new TextEditingController();
    genderController= new TextEditingController();
    birthdateController= new TextEditingController();
    ageController= new TextEditingController();
    professionalEngController= new TextEditingController();
    professionalArabicController= new TextEditingController();
    regionEngController= new TextEditingController();
    regionArabicController= new TextEditingController();
    arabicNameController= new TextEditingController();
    englishNameController= new TextEditingController();
    emailController= new TextEditingController();
    homeController= new TextEditingController();
    phoneController= new TextEditingController();
    emergencyPhoneController= new TextEditingController();

    fillIDData(IDScanModel.idScanModel);

  }




  fillIDData(IDScan_Model iDScan_Model) async {

    countryController= new TextEditingController(text: iDScan_Model.mainBirthPlaceArabic);
    countryEngController= new TextEditingController(text: iDScan_Model.mainBirthPlaceEnglish);
    nationalityController= new TextEditingController(text: iDScan_Model.nationality);
    currentCityController= new TextEditingController(text: iDScan_Model.cityArabic);
    nationalIDController= new TextEditingController(text: iDScan_Model.id);
    ethnicGroupController= new TextEditingController(text:iDScan_Model.ethnicGroup);
    cityController= new TextEditingController(text: iDScan_Model.cityEnglish);
    maritalStatusController= new TextEditingController(text: iDScan_Model.maritalStatusArabic);
    husbandNameController= new TextEditingController(text: iDScan_Model.husbandNameArabic);
    husbandNameEngController= new TextEditingController(text: iDScan_Model.husbandNameEnglish);
    genderController= new TextEditingController(text: iDScan_Model.genderEnglish);
    birthdateController= new TextEditingController(text: iDScan_Model.birthDate);
    professionalEngController= new TextEditingController(text: iDScan_Model.jobEnglish);
    professionalArabicController= new TextEditingController(text: iDScan_Model.jobArabic);
    regionEngController= new TextEditingController(text: iDScan_Model.religionEnglish);
    regionArabicController= new TextEditingController(text: iDScan_Model.religionArabic);
    arabicNameController= new TextEditingController(text: iDScan_Model.fullNameArabic);
    englishNameController= new TextEditingController(text: iDScan_Model.fullNameEnglish);
    emailController= new TextEditingController(text: iDScan_Model.email);
    homeController= new TextEditingController(text: iDScan_Model.address);
    phoneController= new TextEditingController(text: iDScan_Model.phoneNumber);
    emergencyPhoneController= new TextEditingController(text: iDScan_Model.emergencyPhone);

    if(iDScan_Model.profileImage!=null){
    profileImagePath= "http://3.139.34.137:8080${iDScan_Model.profileImage}";

    }

    setState(() {
      print("data filled");
    });


  }



  @override
  Widget build(BuildContext context) {



    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    return Stack(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child:SingleChildScrollView(
              child: SafeArea(
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        AppBarWidget(),
                        SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: [
                                ProfileImageWidget(),
                                GestureDetector(
                                  onTap:(){
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                    setState(() {
                                      dropDownButton=false;
                                    });
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Full Name",
                                          style: TextStyle(
                                            color: pTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: new ThemeData(
                                          primaryColor: primaryColor,
                                          primaryColorDark: primaryColor,
                                        ),
                                        child: TextField(
                                          onChanged:(text) async {
                                              print("First text field: $text");
                                              englishNameController.text=await translateDataToEng(text);
                                              print("eng ${englishNameController.text}");


                                          },
                                          decoration: InputDecoration(
                                              hintText: "(Arabic)"
                                          ),
                                          controller: arabicNameController,
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      Theme(
                                        data: new ThemeData(
                                          primaryColor: primaryColor,
                                          primaryColorDark: primaryColor,
                                        ),
                                        child: TextField(
                                          onChanged:(text) async {
                                            print("First text field: $text");
                                            arabicNameController.text=await translateDataToArabic(text);
                                          },
                                          decoration: InputDecoration(
                                              hintText: "(English)"
//                                      suffixIcon: Icon(Icons.language),
                                          ),
                                          controller: englishNameController,
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      SizedBox(
                                          height:10
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Email Address",
                                          style: TextStyle(
                                            color: pTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: new ThemeData(
                                          primaryColor: primaryColor,
                                          primaryColorDark: primaryColor,
                                        ),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: "emailaddress@domain.com"
//                                      suffixIcon: Icon(Icons.language),
                                          ),
                                          controller: emailController,
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      SizedBox(
                                          height:10
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Home Address",
                                          style: TextStyle(
                                            color: pTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: new ThemeData(
                                          primaryColor: primaryColor,
                                          primaryColorDark: primaryColor,
                                        ),
                                        child: TextField(
                                          controller: homeController,
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      SizedBox(
                                          height:10
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              flex:1,
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                      "Phone Number",
                                                      style: TextStyle(
                                                        color: pTextColor,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Theme(
                                                    data: new ThemeData(
                                                      primaryColor: primaryColor,
                                                      primaryColorDark: primaryColor,
                                                    ),
                                                    child: TextField(
                                                      controller: phoneController,
                                                      keyboardType: TextInputType.number,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                width:10
                                            ),
                                            Expanded(
                                              flex:1,
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                      "Emergency Phone Number",
                                                      style: TextStyle(
                                                        color: pTextColor,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Theme(
                                                    data: new ThemeData(
                                                      primaryColor: primaryColor,
                                                      primaryColorDark: primaryColor,
                                                    ),
                                                    child: TextField(
                                                      controller: emergencyPhoneController,
                                                      keyboardType: TextInputType.number,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          height:10
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Profession /Experience",
                                          style: TextStyle(
                                            color: pTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:1,
                                            child:Theme(
                                              data: new ThemeData(
                                                primaryColor: primaryColor,
                                                primaryColorDark: primaryColor,
                                              ),
                                              child: TextField(
                                                onChanged:(text) async {
                                                  print("First text field: $text");
                                                  professionalArabicController.text=await translateDataToArabic(text);
                                                },
                                                decoration: InputDecoration(
                                                    hintText: "(English)"
                                                ),
                                                controller: professionalEngController,
                                                keyboardType: TextInputType.text,
                                              ),
                                            ),

                                          ),
                                          Expanded(
                                            flex:1,
                                            child:Theme(
                                              data: new ThemeData(
                                                primaryColor: primaryColor,
                                                primaryColorDark: primaryColor,
                                              ),
                                              child: TextField(
                                                onChanged:(text) async {
                                                  print("First text field: $text");
                                                  professionalEngController.text=await translateDataToEng(text);
                                                },
                                                decoration: InputDecoration(
                                                    hintText: "(Arabic)"
                                                ),
                                                controller: professionalArabicController,
                                                keyboardType: TextInputType.text,
                                              ),
                                            ),

                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                          height:10
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              flex:1,
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                      "Gender",
                                                      style: TextStyle(
                                                        color: pTextColor,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Theme(
                                                    data: new ThemeData(
                                                      primaryColor: primaryColor,
                                                      primaryColorDark: primaryColor,
                                                    ),
                                                    child: TextField(
                                                      controller: genderController,
                                                      keyboardType: TextInputType.text,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                width:10
                                            ),
                                            Expanded(
                                              flex:1,
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child:Row(
                                                        children:[
                                                          Text(
                                                            "Date of Birth",
                                                            style: TextStyle(
                                                              color: pTextColor,
                                                              fontWeight: FontWeight.normal,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap:(){
                                                              _selectDate(context);

    },
                                                              child: Icon(Icons.date_range,size:15))
                                                        ]
                                                    ),
                                                  ),
                                                  Theme(
                                                    data: new ThemeData(
                                                      primaryColor: primaryColor,
                                                      primaryColorDark: primaryColor,
                                                    ),
                                                    child: TextField(
                                                      controller: birthdateController,
                                                      keyboardType: TextInputType.text,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                width:10
                                            ),
                                            Expanded(
                                              flex:1,
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                      "Age",
                                                      style: TextStyle(
                                                        color: pTextColor,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Theme(
                                                    data: new ThemeData(
                                                      primaryColor: primaryColor,
                                                      primaryColorDark: primaryColor,
                                                    ),
                                                    child: TextField(
                                                      controller: ageController,
                                                      keyboardType: TextInputType.number,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          height:10
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Religion",
                                          style: TextStyle(
                                            color: pTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:1,
                                            child:Theme(
                                              data: new ThemeData(
                                                primaryColor: primaryColor,
                                                primaryColorDark: primaryColor,
                                              ),
                                              child: TextField(
                                                onChanged:(text) async {
                                                  print("First text field: $text");
                                                  regionArabicController.text=await translateDataToArabic(text);
                                                },
                                                decoration: InputDecoration(
                                                    hintText: "(English)"
                                                ),
                                                controller: regionEngController,
                                                keyboardType: TextInputType.text,
                                              ),
                                            ),

                                          ),
                                          Expanded(
                                            flex:1,
                                            child:Theme(
                                              data: new ThemeData(
                                                primaryColor: primaryColor,
                                                primaryColorDark: primaryColor,
                                              ),
                                              child: TextField(
                                                onChanged:(text) async {
                                                  print("First text field: $text");
                                                  regionEngController.text=await translateDataToEng(text);
                                                },
                                                decoration: InputDecoration(
                                                    hintText: "(Arabic)"
                                                ),
                                                controller: regionArabicController,
                                                keyboardType: TextInputType.text,
                                              ),
                                            ),

                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                          height:10
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Main Birth City",
                                          style: TextStyle(
                                            color: pTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: new ThemeData(
                                          primaryColor: primaryColor,
                                          primaryColorDark: primaryColor,
                                        ),
                                        child: TextField(
                                          controller: cityController,
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      SizedBox(
                                          height:10
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Marital Status",
                                          style: TextStyle(
                                            color: pTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: new ThemeData(
                                          primaryColor: primaryColor,
                                          primaryColorDark: primaryColor,
                                        ),
                                        child: TextField(
                                          controller: maritalStatusController,
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      SizedBox(
                                          height:10
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Husband Name",
                                          style: TextStyle(
                                            color: pTextColor,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: new ThemeData(
                                          primaryColor: primaryColor,
                                          primaryColorDark: primaryColor,
                                        ),
                                        child: TextField(
                                          onChanged:(text) async {
                                            print("First text field: $text");
                                            husbandNameEngController.text=await translateDataToEng(text);
                                          },
                                          decoration: InputDecoration(
                                              hintText: "(Arabic)"
                                          ),
                                          controller: husbandNameController,
                                          keyboardType: TextInputType.text,
                                        ),
                                      ),
                                      Stack(
                                        children: [

                                          husbandenglish_showwidget?Positioned(
                                              top: 5,
                                              right: 5,
                                              child: GestureDetector(
                                                  onTap: (){

                                                    setState(() {

                                                      husbandenglish_showwidget = false;

                                                      husbandNameController.text="";

                                                      husbandNameController.clear();

                                                    });

                                                  },

                                                  child: Icon(Icons.close,size: 20,color: cancelBtnColor,))):Text(""),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: height/50,bottom: height/50),
                                              child: husbandenglish_showwidget == true?

                                              Container(
                                                height:MediaQuery.of(context).size.height*0.07,
                                                //                            width: MediaQuery.of(context).size.width,
                                                child: ListTile(
                                                  onTap: (){



                                                  },
                                                  leading:Padding(
                                                    padding: const EdgeInsets.only(right: 16),
                                                    child: CircularImage(
                                                      NetworkImage("https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg"),
                                                    ),
                                                  ),
                                                  title: Text("Diana Rockwell",style: TextStyle(color: titleColor),),
                                                  subtitle: Text("M.23.Diabetic"),
                                                  trailing: Row(
                                                    mainAxisSize: MainAxisSize.min,

                                                    children: <Widget>[
                                                      Tab(
                                                        child: Image.asset("images/sharedPatientsIcon.png"),
                                                      ),

                                                      SizedBox(width: width/15,),

                                                      Tab(
                                                        child: Icon(Icons.bookmark),
                                                      ),
                                                    ],
                                                  ),
                                                ),)

                                                  :Theme(
                                                data: new ThemeData(
                                                  primaryColor: primaryColor,
                                                  primaryColorDark: primaryColor,
                                                ),
                                                child: TextFormField(
                                                  onChanged:(text) async {
                                                    setState(() {

                                                      husbandName=text;

                                                      print("husbandName $husbandName");

                                                      dropDownButton=true;

                                                    });
                                                    print("First text field: $text");
                                                    husbandNameController.text=await translateDataToArabic(text);


                                                  },

                                                  decoration: InputDecoration(
                                                      hintText: "(English)",
                                                      suffixIcon: GestureDetector(
                                                          onTap:(){
                                                            setState(() {
                                                              dropDownButton?
                                                              dropDownButton=false: dropDownButton=true;
                                                            });
                                                          },
                                                          child: Icon(Icons.keyboard_arrow_down))
                                                  ),
                                                  controller: husbandNameEngController,
                                                  keyboardType: TextInputType.text,
                                                ),
                                              ),
                                            ),
                                          ),


                                          dropDownButton == false ? Text(""):Padding(
                                            padding: EdgeInsets.only(top:height/12),
                                            child: HusbandEnglish(),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          height:10
                                      ),



                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              flex:1,
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                      "National ID/Passport",
                                                      style: TextStyle(
                                                        color: pTextColor,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Theme(
                                                    data: new ThemeData(
                                                      primaryColor: primaryColor,
                                                      primaryColorDark: primaryColor,
                                                    ),
                                                    child: TextField(
                                                      controller: nationalIDController,
                                                      keyboardType: TextInputType.number,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                width:10
                                            ),
                                            Expanded(
                                              flex:1,
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                      "Ethnic Group",
                                                      style: TextStyle(
                                                        color: pTextColor,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Theme(
                                                    data: new ThemeData(
                                                      primaryColor: primaryColor,
                                                      primaryColorDark: primaryColor,
                                                    ),
                                                    child: TextField(
                                                      controller: ethnicGroupController,
                                                      keyboardType: TextInputType.text,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          height:10
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              flex:1,
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                      "Country ",
                                                      style: TextStyle(
                                                        color: pTextColor,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Theme(
                                                    data: new ThemeData(
                                                      primaryColor: primaryColor,
                                                      primaryColorDark: primaryColor,
                                                    ),
                                                    child: TextField(
                                                      onChanged:(text) async {
                                                        print("First text field: $text");
                                                        countryController.text=await translateDataToArabic(text);
                                                      },
                                                      decoration: InputDecoration(
                                                          hintText: "(English)"
                                                      ),
                                                      controller: countryEngController,
                                                      keyboardType: TextInputType.text,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                width:2
                                            ),
                                            Expanded(
                                              flex:1,
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                      "",
                                                      style: TextStyle(
                                                        color: pTextColor,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Theme(
                                                    data: new ThemeData(
                                                      primaryColor: primaryColor,
                                                      primaryColorDark: primaryColor,
                                                    ),
                                                    child: TextField(
                                                      onChanged:(text) async {
                                                        print("First text field: $text");
                                                        countryEngController.text=await translateDataToEng(text);
                                                      },
                                                      decoration: InputDecoration(
                                                          hintText: "(Arabic)"
                                                      ),
                                                      controller: countryController,
                                                      keyboardType: TextInputType.text,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                width:10
                                            ),
                                            Expanded(
                                              flex:1,
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                      "Nationality",
                                                      style: TextStyle(
                                                        color: pTextColor,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Theme(
                                                    data: new ThemeData(
                                                      primaryColor: primaryColor,
                                                      primaryColorDark: primaryColor,
                                                    ),
                                                    child: TextField(
                                                      controller: nationalityController,
                                                      keyboardType: TextInputType.text,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                                width:10
                                            ),
                                            Expanded(
                                              flex:1,
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                      "City (Current)",
                                                      style: TextStyle(
                                                        color: pTextColor,
                                                        fontWeight: FontWeight.normal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  Theme(
                                                    data: new ThemeData(
                                                      primaryColor: primaryColor,
                                                      primaryColorDark: primaryColor,
                                                    ),
                                                    child: TextField(
                                                      controller: currentCityController,
                                                      keyboardType: TextInputType.text,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          height:20
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            height:10
                        ),
                        AdditionalInfoWidget(),
                        RatesGridViewWidget(),
                        SaveButtonWidget(onSubmit:widget.onSubmit),
                        SizedBox(
                            height:10
                        ),
                        CancelButtonWidget(),
                        SizedBox(
                            height:10
                        ),
                      ]
                  )
              ),
            )
        ),


      ],
    );
  }

}



class CancelButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Cancel",
        style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
      ),
    );
  }
}

class SaveButtonWidget extends StatelessWidget {
  final Function onSubmit;

  const SaveButtonWidget({Key key, this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: () async {
          onSubmit();

      },
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Text("Save", style: TextStyle(color: Colors.white,fontSize: 16)),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width:double.infinity,
        child:ListTile(
            leading:GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Transform(
                  transform: Matrix4.translationValues(-10, 0.0, 0.0),
                  child:Image.asset(
                    "images/back.png",
                    fit: BoxFit.none,
                  )),
            ),
            title:  Padding(
              padding: const EdgeInsets.only(top: 8),
              child:Transform(
                transform: Matrix4.translationValues(-30, 0.0, 0.0),
                child: Text(
                  "Add Patient",
                  style: TextStyle(
                    color: FONT_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            subtitle: Container(),
            trailing: GestureDetector(
              onTap:(){

              },
              child: Container(
                width: 90,
                child:Column(
                  children: <Widget> [
                    Row(
                        children: <Widget> [
                          Image.asset(
                            "images/qr_code.png",
                            height: 30,
                            width: 30,
                          ),
                          GestureDetector(
                            onTap:(){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingleScan()),
                              );
                            },
                            child: Image.asset(
                              "images/id_card.png",
                              height: 42,
                              width: 60,
                            ),
                          ),
                        ]
                    ),
                    Center(
                      child: Text(
                        "Scan/ Import",
                        style: TextStyle(
                          color: unActiveTabbarColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}

class ProfileImageWidget extends StatefulWidget{

  final File profileImage;

  const ProfileImageWidget({Key key, this.profileImage}) : super(key: key);

  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  PermissionStatus _status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
                children:[
                    CircleAvatar(
                        radius: MediaQuery.of(context).size.width * .09,
                        child:profileImagePath!=null? Container(
                          height: MediaQuery.of(context).size.height * .1,
                          width: MediaQuery.of(context).size.width * .3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(profileImagePath),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ): Image.asset("images/personal_info_colored.png"),
//              child: Icon(Icons.perm_identity,color: WHITE,),
                    backgroundColor: primaryColor,
                  ),
//                  GestureDetector(
//                    onTap:(){
//                      showSourceDialog();
//
//    },
//                    child: Positioned(
//                      top:52,
//                      left:27,
//                      child: Container(
//                        color: unActiveTabbarColor,
//                        child:Image.asset("images/camera.png"),
//                        height:10,
//                        width:10,
////                      child: Icon(Icons.add_a_photo,color:unActiveTabbarColor ,)),
//                      ),
//                    ),
//                  ),
//                  Positioned(
//                    top:40,
//                    child: Opacity(
//                      opacity: 0.7,
//                      child: Container(
//                        padding:EdgeInsets.only(top:10),
//                        height: 30,
//                        width: 65,
//                        color: Colors.transparent,
//                        child: new Container(
//                          decoration: new BoxDecoration(
//                              color: unActiveTabbarColor,
//                              borderRadius: new BorderRadius.only(
//                                  bottomLeft: const Radius.circular(40.0),
//                                  bottomRight: const Radius.circular(40.0))),
//                        ),
//                      ),
//                    ),
//                  ),
                ]
            ),

            Padding(
              padding: const EdgeInsets.only(top:30,left:15),
              child: Text(
                "Personal Information",
                style: TextStyle(
                  color: pTextColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height:15,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Profile Image",
            style: TextStyle(
              color: pTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(
            height:15
        )
      ],);
  }
  void showSourceDialog(){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take Photo'),
                    onTap: _askPermission,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select Image From Gallery'),
                    onTap: imageSelectorGallery,
                  ),
                ],
              ),
            ),
          );
        });
//    showCupertinoModalPopup(
//      context: context,
//      builder: (BuildContext context) => CupertinoActionSheet(
//        title:  CustomTextWidget(
//          text: "Choose",
//          textSize: 18.0,
//          txtColor: appColor,
//          fontWeight:  FontWeight.bold,
//        ),
//        actions: <Widget>[
//          CupertinoActionSheetAction(
//            child: CustomTextWidget(
//              text:"Open Camera",
//              textSize: 16.0,
//              txtColor: appColor,
//              fontWeight:  FontWeight.bold,
//            ),
//            onPressed: () {
////              getImage(ImageSource.camera).then((image) {
////                navigateToAddFile(image);
////              });
//              _askPermission;
//              print("caaaam");
//              //    Navigator.pop(context);
//            },
//          ),
//          CupertinoActionSheetAction(
//            child: CustomTextWidget(
//              text: "Open Gallery",
//              textSize: 16.0,
//              txtColor: appColor,
//              fontWeight:  FontWeight.bold,
//            ),
//            onPressed: () {
//              //    getImage(ImageSource.gallery);
////              getImage(ImageSource.gallery).then((image) {
////                navigateToAddFile(image);
////
////              });
//              imageSelectorGallery;
//              print("gallerryyyyyy");
//            },
//          )
//        ],
//      ),
//    );
  }
  void _askPermission() {
    PermissionHandler()
        .requestPermissions([PermissionGroup.camera]).then(_onStatusRequested);
  }

  void _onStatusRequested(Map<PermissionGroup, PermissionStatus> value) {
    final status = value[PermissionGroup.camera];
    if (status == PermissionStatus.granted) {
      imageSelectorCamera();
    } else {
      _updateStatus(status);
    }
  }

  _updateStatus(PermissionStatus value) {
    if (value != _status) {
      setState(() {
        _status = value;
      });
    }
  }

  void imageSelectorCamera() async {
    Navigator.pop(context);
    var imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
  }

  void imageSelectorGallery() async {
    Navigator.pop(context);
    var imageFile1 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }
}

class AdditionalInfoWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _AdditionalInfoWidgetsState();
  }
}

class _AdditionalInfoWidgetsState extends State<AdditionalInfoWidget> {

  String selectedValue = "F";
  String bloodValue = "AB";
  String insuranceValue = "Insured";
  int _handleChange;
  int _heightChange,_widthChange;
  double bmiValue=31;
  //weight(Kg)/(height(cm)/100)^2

  @override
  Widget build(BuildContext context) {
    return Container(
        height:300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: LIGHT_COLOR),
          color: WHITE,
        ),
        padding: const EdgeInsets.all(8),
        child:Column(
          children: [
            Expanded(
              flex: 1,
              child:Row(
                children: [
                  Expanded(
                    flex:1,
                    child: Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top:5),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:13),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment:Alignment.centerLeft,
                                            child:Image.asset(
                                              "images/age.png",
                                            ),
                                          ),
                                          SizedBox(
                                              width:20
                                          ),
                                          Align(
                                            child: Text(
                                              "Age",
                                              style: TextStyle(
                                                color: unActiveTabbarColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width:30
                                    ),
                                    Container(
                                      height:100,
                                      width:40,
                                      child: Center(
                                        child: NumberPicker.integer(
                                            highlightSelectedValue: false,
                                            initialValue: 30,
                                            minValue: 1,
                                            maxValue: 90,
                                            onChanged: (newValue) =>
                                                setState(() => _handleChange = newValue)),
                                      ),
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    flex:1,
                    child:Padding(
                      padding: const EdgeInsets.only(top:15),
                      child: Row(
                        children: [
                          Center(
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Align(
                                          alignment:Alignment.centerLeft,
                                          child:Image.asset(
                                            "images/bmi.png",
                                          ),
                                        ),
                                        SizedBox(
                                            width:20
                                        ),
                                        Align(
                                          child: Text(
                                            "BMI",
                                            style: TextStyle(
                                              color: unActiveTabbarColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                        width:50
                                    ),
                                    Container(
                                      height:60,
                                      width:40,
                                      child: Text(
                                          bmiValue.toStringAsFixed(1),
                                        style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
                                      ),
//
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
                flex: 1,
                child:Row(
                  children: [
                    Expanded(
                      flex:1,
                      child: Padding(
                        padding: const EdgeInsets.only(top:5),
                        child: Row(
                          children: [
                            Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:13),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment:Alignment.centerLeft,
                                          child:Image.asset(
                                            "images/height.png",
                                          ),
                                        ),
                                        SizedBox(
                                            width:20
                                        ),
                                        Align(
                                          child: Text(
                                            "Height",
                                            style: TextStyle(
                                              color: unActiveTabbarColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      width:30
                                  ),
                                  Container(
                                    height:100,
                                    width:40,
                                    child: NumberPicker.integer(
                                        highlightSelectedValue: false,
                                        initialValue: 152,
                                        minValue: 150,
                                        maxValue: 190,
                                        onChanged: (newValue){
                                          setState(() {
                                            _heightChange = newValue-1;
                                            print(_heightChange);
                                            print(_widthChange);
                                            bmiValue = _widthChange / pow(_heightChange / 100, 2);
                                            print(bmiValue);
                                          });
                                        }
                                  )
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      flex:1,
                      child: Padding(
                        padding: const EdgeInsets.only(top:5),
                        child: Row(
                          children: [
                            Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:13),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment:Alignment.centerLeft,
                                          child:Image.asset(
                                            "images/weight.png",
                                          ),
                                        ),
                                        SizedBox(
                                            width:20
                                        ),
                                        Align(
                                          child: Text(
                                            "Weight",
                                            style: TextStyle(
                                              color: unActiveTabbarColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      width:30
                                  ),
                                  Container(
                                    height:120,
                                    width:40,
                                    child: NumberPicker.integer(
                                        highlightSelectedValue: false,
                                        initialValue: 70,
                                        minValue: 40,
                                        maxValue: 150,
                                        onChanged: (newValue) {
                                          setState(() {
                                             _widthChange = newValue-1;
                                             print(_heightChange);
                                             print(_widthChange);
                                            bmiValue = _widthChange / pow(_heightChange / 100, 2);
                                             print(bmiValue);
                                            });
                                            }
    )
    )

    ],
    ),
    ),

    ],
    ),
    ),
    ),
    ],
    )
    ),
    Divider(),
    Expanded(
    flex: 1,
    child:Row(
    children: [
    Expanded(
    flex:1,
    child: Padding(
    padding: const EdgeInsets.only(top:15),
    child: Row(
    children: [
    Center(
    child: Row(
    children: [
    Column(
    children: [
    Align(
    alignment:Alignment.centerLeft,

                                        child:Image.asset(
                                          "images/blood.png",
                                        ),
                                      ),
                                      SizedBox(
                                          width:20
                                      ),
                                      Align(
                                        child: Text(
                                          "Blood",
                                          style: TextStyle(
                                            color: unActiveTabbarColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      width:30
                                  ),
                                  Container(
                                    height:70,
                                    width:40,
                                    child: CupertinoPicker(
                                      onSelectedItemChanged: (value){
                                        setState((){
                                          bloodValue = value as String;
                                        });
                                      },
                                      itemExtent: 30.0,
                                      children: const[
                                        Center(child: Text('O+',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                                        Center(child: Text('O-',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                                        Center(child: Text('A-',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                                        Center(child: Text('A+',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                                        Center(child: Text('AB+',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                                        Center(child: Text('AB-',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                                        Center(child: Text('B+',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                                        Center(child: Text('B-',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      flex:1,
                      child: Padding(
                        padding: const EdgeInsets.only(top:15),
                        child: Row(
                          children: [
                            Center(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Align(
                                        alignment:Alignment.centerLeft,
                                        child:Image.asset(
                                          "images/insurance.png",
                                        ),
                                      ),
                                      SizedBox(
                                          width:20
                                      ),
                                      Align(
                                        child: Text(
                                          "Insurance",
                                          style: TextStyle(
                                            color: unActiveTabbarColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      width:30
                                  ),
                                  Container(
                                    height:60,
                                    width:40,
                                    child: CupertinoPicker(
                                      onSelectedItemChanged: (value){
                                        setState((){
                                          insuranceValue = value as String;
                                        });
                                      },
                                      itemExtent: 30.0,
                                      children: const[
                                        Center(child: Text('Insured',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                                        Center(child: Text('Not Insured',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }
}

class RatesGridViewWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height:350,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: LIGHT_COLOR),
                color: WHITE,
              ),
              padding: const EdgeInsets.all(8),
              child:Column(
                children: [
                  Row(
                    children: [
                      Align(
                        alignment:Alignment.centerLeft,
                        child:Image.asset(
                          "images/heartrate.png",
                        ),
                      ),
                      SizedBox(
                          width:30
                      ),
                      Align(
                        child: Text(
                          "102 b/min",
                          style: TextStyle(
                            color: titleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height:10,
                  ),
                  Align(
                    alignment:Alignment.bottomLeft,
                    child: Text(
                      "Heart Rate",
                      style: TextStyle(
                        color: unActiveTabbarColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  Container(
                    height:60,
                    child: Align(
                      alignment:Alignment.bottomCenter,
                      child:Image.asset(
                        "images/electrocardiogram.png",
                      ),
                    ),
                  ),
                ],
              )
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: LIGHT_COLOR),
                color: WHITE,
              ),
              padding: const EdgeInsets.all(8),
              child:Column(
                children: [
                  Row(
                    children: [
                      Align(
                        alignment:Alignment.centerLeft,
                        child:Image.asset(
                          "images/pressure.png",
                        ),
                      ),
                      SizedBox(
                          width:20
                      ),
                      Align(
                        child: Text(
                          "110/70 mm/Hg",
                          style: TextStyle(
                            color: titleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 9,
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height:10,
                  ),
                  Align(
                    alignment:Alignment.bottomLeft,
                    child: Text(
                      "Blood Pressure",
                      style: TextStyle(
                        color: unActiveTabbarColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    height:60,
                    child: Align(
                      alignment:Alignment.bottomCenter,
                      child:Image.asset(
                        "images/bloodpressuregauge.png",
                      ),
                    ),
                  ),
                ],
              )
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: LIGHT_COLOR),
                color: WHITE,
              ),
              padding: const EdgeInsets.all(8),
              child:Column(
                children: [
                  Row(
                    children: [
                      Align(
                        alignment:Alignment.centerLeft,
                        child:Image.asset(
                          "images/temprature.png",
                        ),
                      ),
                      SizedBox(
                          width:50
                      ),
                      Align(
                        child: Text(
                          "37 ˚C",
                          style: TextStyle(
                            color: titleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height:10,
                  ),
                  Align(
                    alignment:Alignment.bottomLeft,
                    child: Text(
                      "Temprature",
                      style: TextStyle(
                        color: unActiveTabbarColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height:10,
                  ),
                  Container(
                    height:60,
                    child: Align(
                      alignment:Alignment.bottomCenter,
                      child:Image.asset(
                        "images/thermometers.png",
                      ),
                    ),
                  ),
                ],
              )
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: LIGHT_COLOR),
                color: WHITE,
              ),
              padding: const EdgeInsets.all(8),
              child:Column(
                children: [
                  Row(
                    children: [
                      Align(
                        alignment:Alignment.centerLeft,
                        child:Image.asset(
                          "images/respiratory.png",
                        ),
                      ),
                      SizedBox(
                          width:50
                      ),
                      Align(
                        child: Text(
                          "25 c/min",
                          style: TextStyle(
                            color: titleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height:10,
                  ),
                  Align(
                    alignment:Alignment.bottomLeft,
                    child: Text(
                      "Respiratory Rate",
                      style: TextStyle(
                        color: unActiveTabbarColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height:10,
                  ),
                  Container(
                    height:60,
                    child: Align(
                      alignment:Alignment.bottomCenter,
                      child:Image.asset(
                        "images/lungs.png",
                      ),
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );

  }
}

