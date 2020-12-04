import 'package:shared_preferences/shared_preferences.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:umedmiscanner/common/ValidationWidget.dart';
import 'package:umedmiscanner/features/home/HomeScreen.dart';
import 'package:umedmiscanner/features/registration/forgotPassword/ForgotPasswordSms.dart';
import 'package:umedmiscanner/features/registration/login/LoginBloc.dart';
import 'package:umedmiscanner/features/registration/signup/SignUpScreen.dart';
import '../quickLogin/QuickLoginScreen.dart';
import 'model/LoginResponse.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  List<String> options = new List();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  bool isLoading = false, _privacyPolicyValue = true;
  bool _obscureTextPass = true;
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _hasFingerPrintSupport = false;
  bool isLoggedIn = false;
  String _authorizedOrNot = "Not Authorized";
  LoadingDialog loadingDialog;
  List<BiometricType> _availableBuimetricType = List<BiometricType>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool rememberMe = false;
  bool isUserName = false,isPassword = false;
  String passMessage="*password Required",nameMessage="*name Required";

  Future<void> _getBiometricsSupport() async {
    bool hasFingerPrintSupport = false;
    try {
      hasFingerPrintSupport = await _localAuthentication.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _hasFingerPrintSupport = hasFingerPrintSupport;
    });
  }

  Future<void> _getAvailableSupport() async {
    // 7. this method fetches all the available biometric supports of the device
    List<BiometricType> availableBuimetricType = List<BiometricType>();
    try {
      availableBuimetricType =
      await _localAuthentication.getAvailableBiometrics();
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBuimetricType = availableBuimetricType;
    });
  }

  Future<void> _authenticateMe() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: "Confirm fingerprint to continue",
        useErrorDialogs: true, // show error in dialog
      );
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _authorizedOrNot = authenticated ? "Authorized" : "Not Authorized";
    });
  }

  void _togglePass() {
    setState(() {
      _obscureTextPass = !_obscureTextPass;
    });
  }

  @override
  initState() {
    _getBiometricsSupport();
    _getAvailableSupport();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return getLoginWidgets(context,(){

      showLoadingDialog();
      LoginBloc().loginAccount(_nameController.text.toString(),
          _passwordController.text.toString()
          , _handleLoginSuccess, _handleLoginError);

    });
  }

  _handleLoginSuccess(LoginResponse data) {
    hideDialog();
    print("UserToken Is "+ data.data);
    AppConfig.shared.setUserToken(data.data);
//    AppConfig.shared.setUserData(data.user);
    SharedPreference.setRememberMe(rememberMe);
    print("Userremember "+ SharedPreference.rememberMe.toString());
    print("remembcer "+ rememberMe.toString());
    SharedPreference.setUsername(_nameController.text.toString());
    SharedPreference.setPassword(_passwordController.text.toString());

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => HomeScreen()),
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
    if(e.message=="Unauthorized"){
      if(_nameController.text.trim().isEmpty){
        setState(() {
          isUserName= true;
          nameMessage="*Username is Empty";
        });
      }
      else {
        setState(() {
          isUserName = true;
          nameMessage = "*Username not found";
        });
      }
    }
    if(e.message=="BadRequest"){
      if(_nameController.text.trim().isNotEmpty &&_passwordController.text.trim().isNotEmpty){
        setState(() {
          isPassword= true;
          passMessage="*Password is incorrect";
        });
      }
      else {
        if(_nameController.text.trim().isEmpty &&_passwordController.text.trim().isEmpty){
          setState(() {
            isUserName= true;
            nameMessage="*Username is Empty";
            isPassword=true;
            passMessage="*Password is Empty";
          });
        }
         if(_nameController.text.trim().isEmpty){
          setState(() {
            isUserName= true;
            nameMessage="*Username is Empty";
          });
        }
        else{
          setState(() {
            isPassword=true;
            passMessage="*Password is Empty";
          });
        }

      }

    }
    if(e.message=="Check your passord or email"){
      setState(() {
        isPassword=true;
        passMessage="*Password is incorrect";
      });
    }
    if(e.message=="Unprocessable"){
      setState(() {
        isUserName=true;
        nameMessage="*Username not found";
      });
    }
  }



  _onChanged(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      rememberMe = value;
      sharedPreferences.setBool("check", rememberMe);
    });
  }
  Widget getLoginWidgets(BuildContext context,Function onSubmit){
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: _formKey,
          child: SafeArea(
              child: GestureDetector(
                onTap:(){
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: ListView(children: <Widget>[
                  Container(
                    color: backgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        loginText(),
                        getUserNameWidget(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                          child: Visibility(
                            visible:isUserName ,
                            child: Text(
                              nameMessage,
//                              "*Username not found",
                              style: TextStyle(
                                color:ERROR_COLOR,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        getPassWidget(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                          child: Visibility(
                            visible:isPassword ,
                            child: Text(
                              passMessage,
//                              "*Password is incorrect",
                              style: TextStyle(
                                color:ERROR_COLOR,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),

                    Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child:Padding(
                                padding: const EdgeInsets.only(left:20),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      checkColor: WHITE,
                                      activeColor: checkColor,
                                      focusColor:checkColor ,
                                      hoverColor:checkColor ,
                                      value: rememberMe,
                                      onChanged: (bool value) {
                                        setState(() {
                                          rememberMe = value;
                                        });
                                      },
                                    ),
                                    Text("Remember Me", style: new TextStyle(
                                        color: appColor, fontStyle: FontStyle.normal,fontSize: 12.0),),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(child: getForgetPassWidget()),
                          ],
                        ),
                        quickLoginBtn(context),
                        _hasFingerPrintSupport ? Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .05,
                                  left: MediaQuery.of(context).size.width * .03),
                            ),
                            !isLoading ? getLoginBtnWidget(onSubmit) : loadongSignWidget(),
                            fingerPrintButton(),
                          ],
                        ): Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .07,
                                  left: MediaQuery.of(context).size.width * .15),
                            ),
                            !isLoading ? getLoginBtnWidget(onSubmit) : loadongSignWidget(),

                          ],
                        ),

                        getSignUpBtnWidget(context),
                        Row(
                            children: <Widget>[
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
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .25),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .02),
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
                ]),
              )),
        ));
  }

  void _loginListener(Function onClick) {
    if (_formKey.currentState.validate()) {
      onClick();
      print(_formKey.currentState.validate().toString());
      print(_nameController.text.toString());
      print(_passwordController.text.toString());
    }
    print("out");
  }

  Widget loginText(){
    return  Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .08,bottom:MediaQuery.of(context).size.height * .08 ),
      child: Text(
        "Login",
        style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget getUserNameWidget() {
    return  Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * .03),
        child:Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Material(
            elevation: 12.0,
            borderRadius: BorderRadius.circular(25.7),
            shadowColor: Colors.white,
            child:  TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              focusNode: _nameNode,
              onFieldSubmitted: (text) {
                onFieldSubmittedNextNode(context, _nameNode, _passwordNode);
              },
              // ignore: missing_return
//          validator:(value) {
//            if (value.isEmpty)
//              return "Enter Username";
//
//
//          },

              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Username',
                prefixIcon: new Icon(Icons.perm_identity, color: appColor),
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
        ));

  }

  Widget getPassWidget() {
    return   Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * .04),
        child:  Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Material(
            elevation: 12.0,
            borderRadius: BorderRadius.circular(25.7),
            shadowColor: Colors.white,
            child: TextFormField(
              controller: _passwordController,
              autofocus: false,
              focusNode: _passwordNode,
              textInputAction: TextInputAction.done,
              textAlignVertical: TextAlignVertical.center,
//          validator: (value){
////            String msg= passValidation(value);
////            return ;
//            if (value.isEmpty)
//              return "Enter Password";
//          },
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
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
            ),
          ),
        ));
  }

  Widget getLoginBtnWidget(Function onClick) {
    return    Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: ButtonTheme(
        minWidth: 190.0,
        height: 50.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            isPassword=false;
            isUserName=false;
            _loginListener(onClick);
          },
          color: appColor,
          child: Text("Login", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget getSignUpBtnWidget(BuildContext ctx) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
      child: ButtonTheme(
        //minWidth: 200.0,
        height: 60.0,
        child: FlatButton(
            onPressed: () {
              return Navigator.pushReplacement(
                ctx,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            },
            child: Center(
              child: Row(
                children: <Widget>[
                  Text("Don't have an account? ", style: TextStyle(color: Colors.black, fontSize: 12)),
                  Text("Register", style: TextStyle(color: appColor, fontSize: 12)),
                ],
              ),
            )
        ),
      ),
    );
  }

  Widget fingerPrintButton(){
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .001),
      child: FlatButton(
        onPressed: _authenticateMe,
        child: Icon(
          FontAwesomeIcons.fingerprint,
          color: appColor,
          size: 40,
        ),
      ),
    );
  }

  Widget getForgetPassWidget(){
    return FlatButton(
      onPressed: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ForgotPasswordSms()),
        );
      },
      child: Text("Forgot Password?",
          style: TextStyle(
              color: appColor,
              fontStyle: FontStyle.italic,
              fontSize: 12.0)),
    );
  }

  Widget quickLoginBtn(BuildContext context){
    return ListTile(
      trailing: Padding(
        padding: const EdgeInsets.only(right:20),
        child: FlatButton(
          onPressed: () {
            return Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen()),
            );
          },
          child: Text("Quick login",
              style: TextStyle(
                  fontSize: 12.0, color:appColor, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget loadongSignWidget(){
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SpinKitPouringHourglass(
        color: appColor,
      ),
    );
  }
}