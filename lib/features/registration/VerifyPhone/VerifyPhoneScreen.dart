import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/registration/login/LoginScreen.dart';
import 'package:umedmiscanner/features/registration/signup/AccountCreated.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

import 'VerifyPhoneBloc.dart';
import 'model/VerifyPhoneResponse.dart';



class VerifyPhoneScreen extends BaseStatefulWidget {
  final String userPhoneNumber;
  VerifyPhoneScreen({this.userPhoneNumber});
  @override
  State<StatefulWidget> createState() {
    return  _VerifyPhoneScreenState();
  }
}


class _VerifyPhoneScreenState extends BaseState<VerifyPhoneScreen>
    implements ActionClickListener, NavigationListener {
  List<String> options = new List();
  String businessType;
  String type;
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String currentText = "";
  VerifyPhoneBloc verifyPhoneBloc = VerifyPhoneBloc();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget getBody(BuildContext context) {
    return  Scaffold(
      backgroundColor: WHITE,
      body: getVerifyPhoneWidgets((){ }),

    );
  }

  Widget getVerifyPhoneWidgets(Function onSubmit) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
            child: GestureDetector(
              onTap:(){
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child:
              Container(
                color:backgroundColor,
                child: ListView(
                    children: <Widget>[
                      Center(child: registerWidget()),
                      Center(child: getType(),),
                      getBusinessType(),
                      SizedBox(height: MediaQuery.of(context).size.height* 0.03,),
                      Center(child: Text("Please enter the verification code",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),),
                      Center(child: Text("sent to your mobile.",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),),
                      SizedBox(height: MediaQuery.of(context).size.height* 0.07,),
                      getDigitText(),
                      SizedBox(height: MediaQuery.of(context).size.height* 0.05,),
                      !isLoading ? getVerifyBtnWidget(onSubmit) : loadingSign,
                      SizedBox(height: MediaQuery.of(context).size.height* 0.1,),
                      Center(
                        child: GestureDetector(
                          onTap:(){
                            return Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical:MediaQuery.of(context).size.height * .01,
                              horizontal:MediaQuery.of(context).size.width * .3,),
                            child: Row(
                              children: <Widget>[
                                Text("Already Registered? ", style: TextStyle(color: Colors.black, fontSize: 12)),
                                Text("Login", style: TextStyle(color: appColor, fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                          ),
                        ),
                        Expanded(
                          child: new Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                              ),
                              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                              child: Divider(
                                color: Colors.black,
                                thickness: 0.5,
                              )),
                        ),
                        Container(
                          decoration: new BoxDecoration(
                            color: backgroundColor,
                          ),
                          child: Text(
                            "Use social media to connect",
                            style:
                            TextStyle(color: Color(0xff5D6275), fontSize: 12.0),
                          ),
                        ),
                        Expanded(
                          child: new Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                              ),
                              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                                thickness: 0.5,
                              )),
                        ),
                      ]),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .25),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .007),
                        width: MediaQuery.of(context).size.width,
                        decoration: new BoxDecoration(
                          color: backgroundColor,
                        ),
                        alignment: Alignment.center,
                        child: Row(
                            children: <Widget>[
                              IconButton(
                                iconSize: 40,
                                icon: Image(
                                  image: AssetImage("images/googleLogo.png"),
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.of(context).size.width * .02),
                                child: IconButton(
                                  iconSize: 30,
                                  icon: Image(
                                    image: AssetImage("images/faceBookLogo.png"),
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                              IconButton(
                                iconSize: 40,
                                icon: Image(
                                  image: AssetImage("images/linkedInLogo.png"),
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ]),
                      ),
//                        ),
//                    ),
                      //TabBarView(children: [ImageList(),])
                    ]),
              ),
            )),);

  }



  Widget getType(){
    return Padding(
      padding: EdgeInsets.only(
          top: 15,bottom: 15),
      child: Text(
        type !=null?type:"Doctor",
        style: TextStyle(
            color: appColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget getBusinessType(){
    /*
Clinic: 1
Medical center: 2
Pharmacy: 3
Laboratory center: 4
Radiology center: 5
Pharma company: 6
 */
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 30,),
      child: Material(
          elevation: 2.0,
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          shadowColor: Colors.white,
          child:Row(
            children: <Widget>[
              Expanded(
                flex:1,
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      //Clinic: 1
                      businessType="clinic";
                      type="Doctor";
                    });
                    print(type);
                    print(businessType.toString());
                  },
                  child: (type == "Doctor") ? Image(
                    image: AssetImage('images/doctor@3x.png'),
                    width: 25,
                    height: 27,
                  ): Image(
                    image: AssetImage('images/doctor@3x.png'),
                    width: 25,
                    height: 27,
                  ),
                ),
              ),
              VerticalDivider(
                thickness: 1,
                width: 0.02,
              ),
              Expanded(
                flex:1,
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      // Medical center: 2
                      businessType="medical_center";
                      type="Medical center";
                    });
                  },
                  child: (type == "Medical center") ? Image(
                    image: AssetImage('images/hospital_active.png'),
                    width: 25,
                    height: 27,
                  ): Image(
                    image: AssetImage('images/hospital@3x.png'),
                    width: 25,
                    height: 27,
                  ),
                ),
              ),
              VerticalDivider(
                thickness: 1,
                width: 0.02,
              ),
              Expanded(
                flex:1,
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      //Pharmacy: 3
                      businessType="pharmacy";
                      type="Pharmacy";
                    });
                  },
                  child: (type == "Pharmacy") ? Image(
                    image: AssetImage('images/pharmacy_active.png'),
                    width: 25,
                    height: 27,
                  ): Image(
                    image: AssetImage('images/medicine@3x.png'),
                    width: 25,
                    height: 27,
                  ),
                ),
              ),
              VerticalDivider(
                thickness: 1,
                width: 0.02,
              ),
              Expanded(
                flex:1,
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      //Laboratory center: 4
                      businessType="laboratory_center";
                      type="Laboratory center";
                    });
                  },
                  child:  (type == "Laboratory center") ? Image(
                    image: AssetImage('images/lab_active.png'),
                    width: 25,
                    height: 27,
                  ): Image(
                    image: AssetImage('images/lab_inactive@3x.png'),
                    width: 25,
                    height: 27,
                  ),
                ),
              ),
              VerticalDivider(
                thickness: 1,
                width: 0.02,
              ),
              Expanded(
                flex:1,
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      //Radiology center: 5
                      businessType="radiology_center";
                      type="Radiology center";
                    });
                  },
                  child:  (type == "Radiology center") ? Image(
                    image: AssetImage('images/rad_active.png'),
                    width: 25,
                    height: 27,
                  ): Image(
                    image: AssetImage('images/rad@3x.png'),
                    width: 25,
                    height: 27,
                  ),
                ),
              ),
              VerticalDivider(
                thickness: 1,
                width: 0.02,
              ),
              Expanded(
                flex:1,
                child: FlatButton(
                  onPressed: (){
                    setState(() {
                      //Pharma company: 6
                      businessType="pharma_company";
                      type="Pharma company";
                    });
                  },
                  child:  (type == "Pharma company") ? Image(
                    image: AssetImage('images/pills@3x.png'),
                    width: 25,
                    height: 27,
                  ): Image(
                    image: AssetImage("images/pills@3x.png"),
                    width: 25,
                    height: 27,
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget getDigitText(){
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
    child: PinCodeTextField(
        length: 4,
        obsecureText: false,
        shape: PinCodeFieldShape.underline,
        animationDuration: Duration(milliseconds: 300),
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    backgroundColor: backgroundColor,
    inactiveColor: appColor,
    activeColor: appColor,
    fieldWidth: 40,
    onChanged: (value) {
    print(value);
    setState(() {
    currentText = value;
    });
    }),
    );
  }
  _handleVerifyPhoneSuccess(VerifyPhoneResponse data) async {
    hideDialog();
    AppConfig.shared.setUserToken(data.data);
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AccountCreated()),
    );
  }

  _handleVerifyPhoneError(FormatException e) {
    hideDialog();
    showSnack("Invalid Verification");
  }

  Widget getVerifyBtnWidget(Function onClick) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
      child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.8,
        height: 57.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            verifyPhoneBloc.verifyPhoneNumber(
                 "PASSWORD"
                ,widget.userPhoneNumber.toString()
                ,currentText.toString()
                , _handleVerifyPhoneSuccess, _handleVerifyPhoneError);
            },
          color: appColor,
          child: Text("Verify", style: TextStyle(color: Colors.white)),
        ),
      ),
    );

  }
  Widget registerWidget(){
    return Padding(
      padding: EdgeInsets.only(
          top: 15,bottom: 15),
      child: Text(
        "Register",
        style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }


  Widget loadingSign(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SpinKitPouringHourglass(
        color: appColor,
      ),
    );
  }



  @override
  void back() {
    // TODO: implement back
  }

  @override
  Widget getAppbar() {
    // TODO: implement getAppbar
    return null;
  }



  @override
  onActionClick(int actionId) {
    // TODO: implement onActionClick
    return null;
  }
}
