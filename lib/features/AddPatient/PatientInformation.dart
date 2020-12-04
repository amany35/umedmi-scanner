import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/common/IDScanModel.dart';
import 'package:umedmiscanner/features/AddPatient/model/Item.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:http/http.dart' as http;

import 'AddPatientScreen.dart';

bool husbandenglish_showwidget = false;

File profileImageFile;

String husbandName;

class PatientInformation extends StatefulWidget {

final String phoneNumber;
final String email;

  const PatientInformation({Key key, this.phoneNumber, this.email}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return new _PatientInformationState();
  }
}





class _PatientInformationState extends State<PatientInformation> {

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
    return Scaffold(
        body:
        ListView(
          controller: _scrollController,
          padding: EdgeInsets.all(10.0),
          children: [
            AddPatientWidgets(phoneNumber:widget.phoneNumber),
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
final String phoneNumber;
final String email;
const AddPatientWidgets({Key key, this.phoneNumber, this.email}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new _AddPatientWidgetsState();
  }
}
class _AddPatientWidgetsState extends State<AddPatientWidgets> {


  bool dropDownButton=false;
  Item selectedUser;
  bool seeMore=false;

  File profileImageFile;

  getImageFile(strURL) async {

    final http.Response responseData = await http.get(strURL);
    var uint8list = responseData.bodyBytes;
    var buffer = uint8list.buffer;
    ByteData byteData = ByteData.view(buffer);
    var tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/img.jpg').writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;

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
                        SizedBox(
                            height:10
                        ),
                        PersonalInfoWidget(phoneNumber:widget.phoneNumber,email:widget.email),
                        SizedBox(
                            height:10
                        ),
                        Align(
                          alignment:Alignment.topLeft,
                          child: Text(
                            "Demographics",
                            style: TextStyle(
                                color: titleColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(
                            height:10
                        ),
                        seeMore==true?AdditionalInfoWidget():
                        Container(
                        height:120,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: LIGHT_COLOR),
                        color: WHITE,
                        ),
                        padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
                        child:Row(
                        children:[
                        Expanded(
                        flex:1,
                        child:Center(
                        child: Column(
                        children:[
                        Container(
                        height:50,
                        width:50,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        border: Border.all(color: LIGHT_COLOR),
                        color: GREY_BORDER,
                        ),
                        child:Image.asset(
                        "images/age.png",
                        ),
                        ),
                          SizedBox(
                              height:8
                          ),
                        Text(
                        "33 Years",
                        style: TextStyle(
                        color: titleColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                        ),
                        ),
                        ]
                        ),
                        )
                        ),
                        VerticalDivider(),
                        Expanded(
                        flex:1,
                        child:Center(
                        child: Column(
                        children:[
                        Container(
                        height:50,
                        width:50,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        border: Border.all(color: LIGHT_COLOR),
                        color: GREY_BORDER,
                        ),
                        child:Image.asset(
                        "images/gender.png",
                        ),
                        ),
                          SizedBox(
                              height:8
                          ),
                        Text(
                        "Male",
                        style: TextStyle(
                        color: titleColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                        ),
                        ),
                        ]
                        ),
                        )
                        ),
                        VerticalDivider(),
                        Expanded(
                        flex:1,
                        child:Center(
                        child: Column(
                        children:[
                        Container(
                        height:50,
                        width:50,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        border: Border.all(color: LIGHT_COLOR),
                        color: GREY_BORDER,
                        ),
                        child:Image.asset(
                        "images/height.png",
                        ),
                        ),
                        SizedBox(
                          height:8
                        ),
                        Text(
                        "170 CM",
                        style: TextStyle(
                        color: titleColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                        ),
                        ),

                        ]
                        ),
                        )
                        ),
                        VerticalDivider(),
                        Expanded(
                        flex:1,
                        child:GestureDetector(
                          onTap:(){
                            setState(() {
                              seeMore=true;
                            });
                          },
                          child: Center(
                          child:
                          Text(
                          "See More",
                          style: TextStyle(
                          color: unActiveTabbarColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                          ),
                          ),
    ),
                        ))]
                        ),
                        ),
                        SizedBox(
                            height:10
                        ),
                        Align(
                          alignment:Alignment.topLeft,
                          child: Text(
                            "Live Dashboard",
                            style: TextStyle(
                                color: titleColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(
                            height:10
                        ),
                        LiveDashboardWidget(),
                        SizedBox(
                            height:10
                        ),
                        DiagnosisWidget(),
                        RatesGridViewWidget(),

                      ]
                  )
              ),
            )
        ),


      ],
    );
  }

}

class AppBarWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width:double.infinity,
        child:Row(
          children:[
            GestureDetector(
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
             SizedBox(
               width:8
             ),
             Text(
                  "Personal Information",
                  style: TextStyle(
                    color: FONT_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
            GestureDetector(
              onTap:(){
              },
              child: Transform(
                transform: Matrix4.translationValues(40, 0.0, 0.0),
                child: Container(
                  width: 90,
                     child: Row(
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
                                      builder: (context) => AddPatientScreen()),
                                );
                              },
                              child: Image.asset(
                                "images/edit.png",
                                height: 42,
                                width: 60,
                              ),
                            ),
                          ]
                      ),
                ),
              ),
            )
          ]
        ));
  }
}

class PersonalInfoWidget extends StatelessWidget{
  final String phoneNumber;
  final String email;
  const PersonalInfoWidget({Key key, this.phoneNumber, this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height:180,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
    border: Border.all(color: LIGHT_COLOR),
    color: WHITE,
    ),
    padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
    child:Row(
      children:[
        Expanded(
          flex:1,
          child:Column(
            children:[
              Row(
                children:[
                  Container(
                    height:10,
                    width:10,
                    child: Image.asset(
                      "images/patientInfo.png",
                    ),
                  ),
                  Text(
                    "Patient Name",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 10,
                        fontWeight: FontWeight.normal
                    ),
                  ),

                ]
              ),
              Text(
                IDScanModel.idScanModel.fullNameEnglish,
                style: TextStyle(
                    color: titleColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal
                ),
              ),
              SizedBox(
                  height:10
              ),
              Row(
                  children:[

                    Text(
                      "Phone Number",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.normal
                      ),
                    ),

                  ]
              ),
              Text(
               phoneNumber??"01123456789",
                style: TextStyle(
                    color: titleColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal
                ),
              ),
              SizedBox(
                  height:10
              ),

              Row(
                  children:[

                    Text(
                      "Email Address",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.normal
                      ),
                    ),

                  ]
              ),
              Text(
                email??"email@domain.com",
                style: TextStyle(
                    color: titleColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal
                ),
              ),
            ]
          )
        ),
        VerticalDivider(),
        Expanded(
          flex:1,
            child:Column(
                children:[
                  Row(
                      children:[
                        Container(
                          height:10,
                          width:10,
                          child: Image.asset(
                            "images/id.png",
                          ),
                        ),
                        Text(
                          "National ID",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.normal
                          ),
                        ),

                      ]
                  ),
                  Text(
                    IDScanModel.idScanModel.id,
                    style: TextStyle(
                        color: titleColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  SizedBox(
                      height:10
                  ),
                  Row(
                      children:[
                        Container(
                          height:10,
                          width:10,
                          child: Image.asset(
                            "images/location.png",
                          ),
                        ),
                        Text(
                          "Country, Province",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.normal
                          ),
                        ),

                      ]
                  ),
                  Text(
                    IDScanModel.idScanModel.mainBirthPlaceEnglish,
                    style: TextStyle(
                        color: titleColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  SizedBox(
                      height:10
                  ),
                  Row(
                      children:[

                        Text(
                          "Address",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.normal
                          ),
                        ),

                      ]
                  ),
                  Text(
                   IDScanModel.idScanModel.address,
                    style: TextStyle(
                        color: titleColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ]
            )

        )
      ]
    )
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
                                    Padding(
                                      padding: const EdgeInsets.only(top:20),
                                      child: Container(
                                        height:100,
                                        width:40,
                                        child: Text(
                                          "33",
                                          style: TextStyle(
                                              color: titleColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
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
                                        "30",
                                        style: TextStyle(
                                            color: titleColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold
                                        ),
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
                                  Padding(
                                    padding: const EdgeInsets.only(top:20.0),
                                    child: Container(
                                        height:100,
                                        width:40,
                                        child: Text(
                                          "170 CM",
                                          style: TextStyle(
                                              color: titleColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                    ),
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
                                  Padding(
                                    padding: const EdgeInsets.only(top:20.0),
                                    child: Container(
                                        height:120,
                                        width:40,
                                        child:Text(
                                          "70 KG",
                                          style: TextStyle(
                                              color: titleColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                    ),
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
                                  Padding(
                                    padding: const EdgeInsets.only(top:20.0),
                                    child: Container(
                                      height:70,
                                      width:40,
                                      child: Text(
                                        "AB",
                                        style: TextStyle(
                                            color: titleColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
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
                                      width:10
                                  ),
                                  Container(
                                    height:60,
                                    width:45,
                                    child: Text(
                                      "Insured",
                                      style: TextStyle(
                                          color: titleColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                      ),
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

class LiveDashboardWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
        height:120,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
    border: Border.all(color: LIGHT_COLOR),
    color: WHITE,
    ),
    padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
    child:Row(
      children:[
        Expanded(
          flex:1,
          child:Center(
            child: Column(
              children:[
              Container(
                height:50,
                width:50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  border: Border.all(color: LIGHT_COLOR),
                  color: GREY_BORDER,
    ),
                  child:Image.asset(
                    "images/medicalPrescription.png",
                  ),
                ),
                Text(
                  "15",
                  style: TextStyle(
                      color: titleColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Prescriptions",
                  style: TextStyle(
                      color: titleColor,
                      fontSize: 8,
                      fontWeight: FontWeight.bold
                  ),
                ),

              ]
            ),
          )
        ),
        VerticalDivider(),
        Expanded(
          flex:1,
          child:Center(
            child: Column(
                children:[
                  Container(
                    height:50,
                    width:50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      border: Border.all(color: LIGHT_COLOR),
                      color: GREY_BORDER,
                    ),
                    child:Image.asset(
                      "images/drug.png",
                    ),
                  ),
                  Text(
                    "6",
                    style: TextStyle(
                        color: titleColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "Ongoing Meds.",
                    style: TextStyle(
                        color: titleColor,
                        fontSize: 8,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                ]
            ),
          )
        ),
        VerticalDivider(),
        Expanded(
          flex:1,
            child:Center(
              child: Column(
                  children:[
                    Container(
                      height:50,
                      width:50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        border: Border.all(color: LIGHT_COLOR),
                        color: GREY_BORDER,
                      ),
                      child:Image.asset(
                        "images/Flat.png",
                      ),
                    ),
                    Text(
                      "10",
                      style: TextStyle(
                          color: titleColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Visits",
                      style: TextStyle(
                          color: titleColor,
                          fontSize: 8,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                  ]
              ),
            )
        ),
        VerticalDivider(),
        Expanded(
          flex:1,
            child:Center(
              child: Column(
                  children:[
                    Container(
                      height:50,
                      width:50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        border: Border.all(color: LIGHT_COLOR),
                        color: GREY_BORDER,
                      ),
                      child:Image.asset(
                        "images/consultation.png",
                      ),
                    ),
                    Text(
                      "10",
                      style: TextStyle(
                          color: titleColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Consultations",
                      style: TextStyle(
                          color: titleColor,
                          fontSize: 8,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                  ]
              ),
            )
        ),
      ]
    )
    );
  }
}

class DiagnosisWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
        height:120,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
    border: Border.all(color: LIGHT_COLOR),
    color: WHITE,
    ),
    padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
    child:Column(
      children:[
      Align(
        alignment:Alignment.topLeft,
        child: Text(
          "Diagnosis",
          style: TextStyle(
            color: titleColor,
            fontSize: 12,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
        SizedBox(
          height:8
        ),
        Row(
          children:[
            Container(
              height:60,
              width:60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: LIGHT_COLOR),
                color: DIAGNOSIS_COLOR,
              ),
              padding: const EdgeInsets.all(8),
              child:Center(
                child: Column(
                  children:[
                    Image.asset(
                      "images/diabetes.png",
                    ),
                    Text(
                      "Diabetic",
                      style:TextStyle(
                        color:PROGRESS_COLOR,
                        fontSize:6
                      )
                    )
                  ]
                ),
              )
            ),
            SizedBox(
              width:8
            ),
            Container(
                height:60,
                width:60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: LIGHT_COLOR),
                  color: DIAGNOSIS_COLOR,
                ),
                padding: const EdgeInsets.all(8),
                child:Center(
                  child: Column(
                      children:[
                        Container(
                          height:30,
                          width:30,
                          child: Image.asset(
                            "images/add.png",
                          ),
                        ),
                        Text(
                            "Add New Dx",
                            style:TextStyle(
                                color:PROGRESS_COLOR,
                                fontSize:6
                            )
                        )
                      ]
                  ),
                )
            )
          ]
        )

      ]
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

