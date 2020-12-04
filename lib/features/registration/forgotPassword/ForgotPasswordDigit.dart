import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/registration/login/LoginScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordDigit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ForgotPasswordDigitState();
  }
}

class _ForgotPasswordDigitState extends State<ForgotPasswordDigit> {

  TextEditingController textEditingController = TextEditingController()
    ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";

  @override
  initState() {
    super.initState();
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

    final reSendSms = Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * .06),
      child: FlatButton(
        onPressed: () {
        },
        child: Text("Didn't Recieve it? Resend ",
            style: TextStyle(
                color: appColor,
                fontSize: 14.0)),
      ),
    );

    final submitButton = Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * .1,left: 30, right: 30),
      child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.9,
        height: 50.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.7),
          ),
          onPressed: () {
            return Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          color: appColor,
          child: Text("Submit", style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.width * .1),
            child: logo,
          ),
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.width * .04),
            child: Text(
              "Forgot Password",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.width * .03),
            child: Text(
              "Please enter the pin code sent to",
            ),
          ),
          Text(
            "emailaddress@domain.com.",
          ),
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.width * .15,right: 15,left:15),
              child:digitText
          ),
          submitButton,
          reSendSms
        ],
      ),
    );
  }
}
