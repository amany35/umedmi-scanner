import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/common/ValidationWidget.dart';
import 'package:umedmiscanner/features/home/HomeScreen.dart';
import 'package:umedmiscanner/features/registration/quickLogin/QuickLoginBloc.dart';
import 'package:umedmiscanner/features/registration/quickLogin/model/QuickLoginResponse.dart';
import 'package:umedmiscanner/features/registration/signup/SignUpScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class QuickLoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _QuickLoginState();
  }
}

class _QuickLoginState extends State<QuickLoginScreen> {
  List<String> options = new List();
  bool isLoading = false;
  bool _obscureTextCode = true;
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _hasFingerPrintSupport = false;
  String _authorizedOrNot = "Not Authorized";
  List<BiometricType> _availableBuimetricType = List<BiometricType>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _codeController = new TextEditingController();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _codeNode = FocusNode();
  bool isLoggedIn = false;
  bool isUserName = false,isPassword = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  LoadingDialog loadingDialog;
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
        // message for dialog
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
  void _toggleCode() {
    setState(() {
      _obscureTextCode = !_obscureTextCode;
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
    return getLoginWidgets((){
      showLoadingDialog();
      QuickLoginBloc().quickLoginAccount(_nameController.text.toString(),
          _codeController.text.toString()
          , _handleLoginSuccess, _handleLoginError);

    });
  }
  _handleLoginSuccess(QuickLoginResponse data) {
    hideDialog();
    print("UserToken Is "+ data.data);
    AppConfig.shared.setUserToken(data.data);
//    AppConfig.shared.setUserData(data.user);
    SharedPreference.setUsername(_nameController.text.toString());
    SharedPreference.setPassword(_codeController.text.toString());

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => HomeScreen()),
    );;

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
    hideDialog();
    if(e.message=="BadRequest"){
      if(_nameController.text.trim().isNotEmpty &&_codeController.text.trim().isNotEmpty){
        setState(() {
          isPassword= true;
          passMessage="*code is incorrect";
        });
      }
      else {
        if(_nameController.text.trim().isEmpty &&_codeController.text.trim().isEmpty){
          setState(() {
            isUserName= true;
            nameMessage="*Username is Empty";
            isPassword=true;
            passMessage="*code is Empty";
          });
        }
        else if(_nameController.text.trim().isEmpty){
          setState(() {
            isUserName= true;
            nameMessage="*Username is Empty";
          });
        }
        else{
          setState(() {
            isPassword=true;
            passMessage="*code is Empty";
          });
        }
      }

    }
    if(e.message=="Check your passord or email"){
      setState(() {
        isPassword=true;
        passMessage="*code is incorrect";
      });
    }
    if(e.message=="Unprocessable"){
      setState(() {
        isUserName=true;
        nameMessage="*Username not found";
      });
    }
  }
  Widget getLoginWidgets(Function onSubmit){
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
                    // Also Including Tab-bar height.
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        getLoginWidget(),
                        getUserNameWidget(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                          child: Visibility(
                            visible:isUserName ,
                            child: Text(
                              nameMessage,
                              style: TextStyle(
                                color:ERROR_COLOR,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        getDigitCodeWidget(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                          child: Visibility(
                            visible:isPassword ,
                            child: Text(
                              passMessage,
                              style: TextStyle(
                                color:ERROR_COLOR,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * .3,
                                  left: MediaQuery.of(context).size.width * .1),
                            ),
                            !isLoading ? getLoginBtnWidget(onSubmit) : loadingSign,
                            getFingerPrintBtn(),
                          ],
                        ),
                        Center(
                          child: GestureDetector(
                            onTap:(){
                              return Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => SignUpScreen()),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical:MediaQuery.of(context).size.height * .01,
                                horizontal:MediaQuery.of(context).size.width * .25,),
                              child: Row(
                                children: <Widget>[
                                  Text("Don't have an account? ", style: TextStyle(color: Colors.black, fontSize: 12)),
                                  Text("Register", style: TextStyle(color: appColor, fontSize: 12)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top:MediaQuery.of(context).size.height * .1,),
                          child: Row(
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
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .25),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .01),
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
                  //TabBarView(children: [ImageList(),])
                ]),
              )),
        ));
  }

  void _loginListener(Function onClick) {
    if (_formKey.currentState.validate()) {
      onClick();
      print(_formKey.currentState.validate().toString());
      print(_nameController.text.toString());
      print(_codeController.text.toString());
    }
    print("out");
  }

  Widget loginText(){
    return  Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .03,bottom:MediaQuery.of(context).size.height * .01 ),
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
    return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * .03),
        child:Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Material(
            elevation: 12.0,
            borderRadius: BorderRadius.circular(25.7),
            shadowColor: Colors.white,
            child: TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              autofocus: false,
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.next,
              focusNode: _nameNode,
              onFieldSubmitted: (text) {
                onFieldSubmittedNextNode(context, _nameNode, _codeNode);
              },
//          validator:(value) {
//            if (value.isEmpty)
//              return "Enter UserID";
//          },
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

  Widget getLoginWidget(){
    return  Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * .2,bottom:MediaQuery.of(context).size.height * .08 ),
      child: Text(
        "Quick Login",
        style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget getDigitCodeWidget() {
    return   Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * .04),
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Material(
            elevation: 12.0,
            borderRadius: BorderRadius.circular(25.7),
            shadowColor: Colors.white,
            child: TextFormField(
              controller: _codeController,
              autofocus: false,
              textAlignVertical: TextAlignVertical.center,
              obscureText: _obscureTextCode,
              focusNode: _codeNode,
              textInputAction: TextInputAction.done,
//          validator: (value){
//            String msg= codeValidation(value);
//            return ;
//          },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '4-digit code for quick sign',
                prefixIcon: new Icon(Icons.keyboard, color:appColor),
                suffixIcon: GestureDetector(
                  onTap: _toggleCode,
                  child: Icon(
                      _obscureTextCode
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      color:appColor,
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ButtonTheme(
        minWidth: 200.0,
        height: 45.0,
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

  Widget getFingerPrintBtn(){
    return  _hasFingerPrintSupport
        ? Padding(
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
    )
        : Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .001),
      child: FlatButton(
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Sign in',
                    style: TextStyle(color: appColor),
                  ),
                  actions: <Widget>[
                    RaisedButton(
                      color: Colors.white,
                      child: Text("Back",
                          style: TextStyle(color:appColor)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //Text("Confirm fingerprint to continue", style: TextStyle(color: Color(0xff5D6275))),
                      Text("You Haven't FingerPrint Support"),
                    ],
                  ),
                );
              });
        },
        child: Icon(
          FontAwesomeIcons.fingerprint,
          color:appColor,
          size: 40,
        ),
      ),
    );
  }

  Widget loadingSign(){
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: SpinKitPouringHourglass(
        color: appColor,
      ),
    );
  }

}
