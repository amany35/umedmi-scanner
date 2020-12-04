import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'ForgotPasswordScreen.dart';
import '../ChangePassword/ChangePassword.dart';
import 'VerifySmsCodeBloc.dart';
import 'model/VerifySmsCodeResponse.dart';

class ForgotPasswordSmsDigit extends StatefulWidget {
  final String phoneNumber;
  const ForgotPasswordSmsDigit({this.phoneNumber});
  @override
  State<StatefulWidget> createState() {
    return new _ForgotPasswordSmsDigitState();
  }
}

class _ForgotPasswordSmsDigitState extends State<ForgotPasswordSmsDigit> {

  TextEditingController verifyDigitController = TextEditingController();

  LoadingDialog loadingDialog;
  StreamController<ErrorAnimationType> errorController;

  bool hasError = false,isDigitCode=false;
  String currentText = "";

  @override
  initState() {
    super.initState();
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
  _handleVerifySuccess(VerifySmsCodeResponse data) {
    hideDialog();
    print("data.data " + data.data.toString());
    AppConfig.shared.setUserToken(data.data);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => ChangePassword()),
    );

  }

  _handleVerifyError(FormatException e) {
    hideDialog();
setState(() {
  isDigitCode = true;
});
  }
  @override
  Widget build(BuildContext context) {
    final logo = Image(
      image: AssetImage('images/forgotpassword.png'),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .3,
    );

    final digitText = PinCodeTextField(
      length: 4,
      controller: verifyDigitController,
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
      },
    );

    final submitButton = Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * .1,left: 30, right: 30),
      child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.9,
        height: 50.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onPressed: () {
    showLoadingDialog();
    VerifySmsCodeBloc().verifyAccount(widget.phoneNumber,
        verifyDigitController.text.toString()
    , _handleVerifySuccess, _handleVerifyError);

          },
          color: appColor,
          child: Text("Submit", style: TextStyle(color: Colors.white)),
        ),
      ),
    );



    final sendSmsButton = Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: FlatButton(
        onPressed: () {
          return Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
          );
        },
        child: Center(
          child: Text("Use your verified email address to reset password",
              style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 13.0)),
        ),
      ),
    );
    final reSendSms = FlatButton(
      onPressed: () {
      },
      child: Text("Resend in 1:30 minutes",
          style: TextStyle(
              color: appColor,
              fontSize: 14.0)),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: backgroundColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding:
            EdgeInsets.only(top: 10),
            child: logo,
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.height* 0.01,),
          Center(child: Text(
            "Please enter the pin sent",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),),
          Center(child: Text(
            "to your phone",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),),
        Row(
          children: <Widget>[
            SizedBox(width: 18),
            Text(
              "Didn't Recieve Sms?",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
            reSendSms
          ],
        ),
          Padding(
            padding:
            EdgeInsets.only(right: 15,left:15),
            child: digitText,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
            child: Align(
              alignment: Alignment.center,
              child: Visibility(
                visible:isDigitCode,
                child: Text(
                  "*Please Enter Valid Code",
                  style: TextStyle(
                    color:ERROR_COLOR,
                    fontSize: 12,
                  ),
                ),
              ),
            )
          ),
          SizedBox(height: 10,),
          submitButton,
          sendSmsButton,
        ],
      ),
    );
  }
}
