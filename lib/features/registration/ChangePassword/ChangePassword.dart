import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umedmiscanner/common/LoadingDialog.dart';
import 'package:umedmiscanner/features/home/HomeScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

import 'ChangePasswordBloc.dart';



class ChangePassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ChangePasswordState();
  }
}

class _ChangePasswordState extends State<ChangePassword> {

  TextEditingController _passwordController = new TextEditingController();
  bool _obscureTextPass = true;
  final FocusNode _passwordNode = FocusNode();
  bool hasError = false,isPassword=false;
  String currentText = "";
  LoadingDialog loadingDialog;

  @override
  initState() {
    super.initState();
  }
  void _togglePass() {
    setState(() {
      _obscureTextPass = !_obscureTextPass;
    });
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

  _handleChangePassword() async {
    var changePass = await changePasswordBloc(_passwordController.text.toString());
    print(" changePass " + changePass.toString());
    if(changePass == "Server Error"){
      hideDialog();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    }else{
      hideDialog();
print("something error");
setState(() {
  isPassword = true;
});
    }
  }


  @override
  Widget build(BuildContext context) {
    final logo = Image(
      image: AssetImage('images/forgotpassword.png'),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .3,
    );

    Widget getPassWidget() {
      return   Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .08),
          child:  Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Material(
              elevation: 12.0,
              borderRadius: BorderRadius.circular(25),
              shadowColor: Colors.white,
              child: TextFormField(
                controller: _passwordController,
                autofocus: false,
                focusNode: _passwordNode,
                textInputAction: TextInputAction.done,
                textAlignVertical: TextAlignVertical.center,
                obscureText: _obscureTextPass,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: new Icon(Icons.lock, color: appColor),
                  suffixIcon: GestureDetector(
                    onTap: _togglePass,
                    child: Icon(
                        _obscureTextPass
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        color: appColor,
                        size: 20.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ));
    }

    final confirmButton = Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.9,
        height: 50.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onPressed: () {
            showLoadingDialog();
            _handleChangePassword();
          },
          color: appColor,
          child: Text("Confirm", style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final askForHelpButton = Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: FlatButton(
        onPressed: () {
//          return Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
//          );
        },
        child: Center(
          child: Text("Ask for help!",
              style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 13.0)),
        ),
      ),
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
            "Please enter your new password",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),),
          getPassWidget(),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Align(
                alignment: Alignment.center,
                child: Visibility(
                  visible:isPassword,
                  child: Text(
                    "**Please Enter Valid Password",
                    style: TextStyle(
                      color:ERROR_COLOR,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .08),
          confirmButton,
          SizedBox(height: MediaQuery.of(context).size.height * .08),
          askForHelpButton,
        ],
      ),
    );
  }
}
