import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'ForgotPasswordDigit.dart';
import 'ForgotPasswordSms.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ForgotPasswordScreenState();
  }
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = new TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Image(
      image: AssetImage('images/forgotpassword.png'),
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height * .3,
    );

    final email = Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Material(
        elevation: 12.0,
        borderRadius: BorderRadius.circular(25.7),
        shadowColor: Colors.white,
        child: TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: 'Email Address',
            hintStyle: TextStyle(fontSize: 15, color: HINT_COLOR),
            prefixIcon: new Icon(Icons.email, color:appColor, size: 18,),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
          ),
        ),
      ),
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
            return Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgotPasswordDigit()),
            );
          },
          color: appColor,
          child: Text("Email Me", style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final sendSmsButton = Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * .05),
      child: FlatButton(
        onPressed: () {
          return Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPasswordSms()),
          );
        },
        child: Text("Send SMS instead",
            style: TextStyle(
                color: appColor,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * .1),
              child: logo,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * .04),
              child: Text(
                "Forgot Password",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height* 0.03,),
            Center(child: Text(
              "Please enter Your email address",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),),
            Center(child: Text(
              "We will email you a password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),),
            Center(child: Text(
              "resent link.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * .15),
              child: email,
            ),
            submitButton,
            sendSmsButton,
          ],
        ),
      )
    );
  }
}
