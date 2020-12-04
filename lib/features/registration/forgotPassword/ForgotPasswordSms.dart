import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/registration/forgotPassword/ForgotPasswordScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'ForgotPasswordSmsBloc.dart';
import 'ForgotPasswordSmsDigit.dart';


class ForgotPasswordSms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ForgotPasswordSmsState();
  }
}

class _ForgotPasswordSmsState extends State<ForgotPasswordSms> {
  TextEditingController phoneController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  LoadingDialog loadingDialog;
  bool isPhoneNumber = false;
  String errorMessage="";
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> hideDialog() async {
      if (loadingDialog != null && loadingDialog.isShowing()) {
        Navigator.of(context).pop();
        loadingDialog = null;
      }
    }


    _handleForgotPasswordSms() async {
      var checkSendOtp = await forgotPasswordSmsBloc(phoneController.text.toString());
      print(" checkSendOtp " + checkSendOtp.toString());
      if(checkSendOtp == "Server Error"){
        hideDialog();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return ForgotPasswordSmsDigit(phoneNumber: phoneController.text.toString(),);
        }));
      }else{
        hideDialog();
        setState(() {
          isPhoneNumber = true;
          if(checkSendOtp['message'] == "Otp has not expired yet.")
            errorMessage = "*Some error happened.. try again later";
          else if(checkSendOtp['message'] == "Phone number is not found")
            errorMessage = "*Phone number is not found";
          else errorMessage = "*Please Check Your Phone Number";
        });
      }
    }
    void showLoadingDialog() async {
      loadingDialog = LoadingDialog();
      await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => loadingDialog);
    }


    void showSnack(String msg) async {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(msg)));
    }


    final logo = Image(
      image: AssetImage('images/forgotpassword.png'),
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.height * .3,
    );

    final phoneNumber = Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Material(
        elevation: 12.0,
        borderRadius: BorderRadius.circular(25),
        shadowColor: Colors.white,
        child: TextField(
          controller: phoneController,
          keyboardType: TextInputType.number,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: 'Phone Number',
            hintStyle: TextStyle(fontSize: 15, color: HINT_COLOR),
            prefixIcon: new Icon(Icons.call, color: appColor, size: 18,),
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
      padding: EdgeInsets.symmetric(horizontal: 30,),
      child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.9,
        height: 50.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onPressed: () {
            showLoadingDialog();
            _handleForgotPasswordSms();
          },
          color: appColor,
          child: Text("Send SMS", style: TextStyle(color: Colors.white)),
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



    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: true,
      backgroundColor:backgroundColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 10),
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
          SizedBox(height: MediaQuery.of(context).size.height* 0.03,),
          Center(child: Text(
              "Please enter Your registered",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),),
          Center(child: Text(
            "phone number.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),),
          Padding(
            padding: EdgeInsets.only(
                top: 15),
            child: phoneNumber,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Visibility(
              visible:isPhoneNumber ,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  errorMessage,
                  style: TextStyle(
                    color:ERROR_COLOR,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height* 0.12,),
          submitButton,
          SizedBox(height: MediaQuery.of(context).size.height* 0.02,),
          sendSmsButton,
        ],
      ),
    );
  }
}
