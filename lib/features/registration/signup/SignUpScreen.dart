import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:local_auth/local_auth.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/common/ValidationWidget.dart';
import 'package:umedmiscanner/features/registration/VerifyPhone/VerifyPhoneScreen.dart';
import 'package:umedmiscanner/features/registration/login/LoginScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import "package:http/http.dart" as http;
import 'SignUpBloc.dart';
import 'model/SignUpResponse.dart';


class SignUpScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return  _SignUpScreenState();
  }
}


class _SignUpScreenState extends BaseState<SignUpScreen>
  implements ActionClickListener, NavigationListener {
  List<String> options = new List();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _digitCodeController = new TextEditingController();
  FocusNode _mailNode= FocusNode();
  FocusNode _passwordNode= FocusNode();
  FocusNode _nameNode = FocusNode();
  FocusNode _phoneNumberNode = FocusNode();
  FocusNode _digitCodeNode=FocusNode();
  String businessType;
  String type="Doctor";
  bool rememberMe = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  bool isLoading = false, _privacyPolicyValue = true;
  bool _obscureTextPass = true,_obscureTextCode = true;
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _hasFingerPrintSupport = false;
  String _authorizedOrNot = "Not Authorized";
  List<BiometricType> _availableBuimetricType = List<BiometricType>();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  RegExp regex = new RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  bool linkedInLogoutUser = false;
  String socialUserType, socialUserToken, socialUserId;
  bool isUserName = false,isPhoneNumber = false,isEmail = false,isPassword = false,isQuickPassword = false;
  FirebaseUser _user;
  final FirebaseAuth _authGoogle = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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

  void _togglePass() {
    setState(() {
      _obscureTextPass = !_obscureTextPass;
    });
  }

  void _toggleCode() {
    setState(() {
      _obscureTextCode = !_obscureTextCode;
    });
  }

  Future  _handleFacebookSignIn() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        var response = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${result.accessToken.token}');
        var responseData = json.decode(response.body);
        setState(() {
          socialUserType = "FACEBOOK";
          socialUserToken = accessToken.token.toString();
          socialUserId = accessToken.userId.toString();
          _emailController.text = responseData['email'];
          _usernameController.text = responseData['name'];
        });
//        _showMessage('''
//         Logged in!
//
//         Token: ${accessToken.token}
//         User id: ${accessToken.userId}
//         Expires: ${accessToken.expires}
//         Permissions: ${accessToken.permissions}
//         Declined permissions: ${accessToken.declinedPermissions}
//         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future<void>  _handleGoogleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    print(" checkcredential " + credential.toString());
    AuthResult authResult = await _authGoogle.signInWithCredential(credential);
    print(" checktest " + authResult.toString());
    _user = authResult.user;
    print("User Name: ${_user.displayName}");
    print("User Email ${_user.email}");
  }


  void _handleLinkedInSignIn(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LinkedInUserWidget(
          appBar: AppBar(
            title: Text('OAuth User'),
          ),
          destroySession: linkedInLogoutUser,
          redirectUrl: redirectUrl,
          clientId: clientId,
          clientSecret: clientSecret,
          projection:  [
            ProjectionParameters.id,
            ProjectionParameters.localizedFirstName,
            ProjectionParameters.localizedLastName,
            ProjectionParameters.firstName,
            ProjectionParameters.lastName,
            ProjectionParameters.profilePicture,
          ],
          onGetUserProfile: (LinkedInUserModel linkedInUser) {
            print('Access token ${linkedInUser.token.accessToken}');

            print('User id: ${linkedInUser.userId}');

            setState(() {
              socialUserType = "LINKEDIN";
              socialUserToken = linkedInUser.token.accessToken.toString();
              socialUserId = linkedInUser.userId.toString();
              _emailController.text = linkedInUser
                  ?.email?.elements[0]?.handleDeep?.emailAddress.toString();
              _usernameController.text = linkedInUser?.firstName?.localized?.label.toString();
              linkedInLogoutUser = false;
            });

            Navigator.pop(context);
          },
          catchError: (LinkedInErrorObject error) {
            print('Error description: ${error.description},'
                ' Error code: ${error.statusCode.toString()}');
            Navigator.pop(context);
          },
        ),
        fullscreenDialog: true,
      ),
    );
  }

  _handleCreateNewAccount() async {
    setState(() {
      isUserName = false;
      isPhoneNumber = false;
      isEmail = false;
      isPassword = false;
      isQuickPassword = false;
    });
    Map checkRegistration = await createNewAccount(
        businessType.toString()
        ,_emailController.text.toString()
        ,_passwordController.text.toString()
        ,_usernameController.text.toString()
        ,_phoneNumberController.text.toString()
        ,_digitCodeController.text.toString()
        ,socialUserType
        ,socialUserToken
        ,socialUserId);
    if(checkRegistration['message'] != "Server Error") {
      if(checkRegistration['statusCode'] == 200 && checkRegistration['error'] == null){
        hideDialog();
//        final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
//          email: _emailController.text.toString(),
//          password: _passwordController.text.toString(),
//        )).user;
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VerifyPhoneScreen(userPhoneNumber: _phoneNumberController.text.toString(),)),
        );
      }else{
        hideDialog();
        List checkMessageError = checkRegistration['message'];
        if(checkMessageError.contains("username must be unique")){
          setState(() {
            isUserName = true;
          });
        }
        if(checkMessageError.contains("phoneNumber must be unique")){
          setState(() {
            isPhoneNumber = true;
          });
        }
        if(checkMessageError.contains("email must be unique")){
          setState(() {
            isEmail = true;
          });
        }
        if(checkMessageError.contains("password must be longer than or equal to 6 characters")){
          setState(() {
            isPassword = true;
          });
        }
        if(checkMessageError.contains("quickLoginPassword must be longer than or equal to 4 characters")){
          setState(() {
            isQuickPassword = true;
          });
        }
      }
    }else{
      hideDialog();
      showSnack("*Some error happened.. try again later");
    }
  }

  @override
  initState() {
    super.initState();
    _getBiometricsSupport();
    _getAvailableSupport();
  }

  @override
  Widget getBody(BuildContext context) {
    return  Scaffold(
      backgroundColor: WHITE,
      body: getSignUpWidgets((){
        businessType !=null ? businessType :businessType = "clinic";
        showLoadingDialog();
        _handleCreateNewAccount();
      }),

    );
  }

  Widget getSignUpWidgets(Function onSubmit) {
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: _formKey,
          child: SafeArea(
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
                            Center(child: getType()),
                            getBusinessType(),
                            getUserNameWidget(),
                             Padding(
                               padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                               child: Align(
                                 alignment: Alignment.center,
                                 child: Visibility(
                                 visible:isUserName ,
                                 child: Text(
                                   "*User Name Already Exist",
                                   style: TextStyle(
                                     color:ERROR_COLOR,
                                     fontSize: 12,
                                   ),
                                 ),
                                 ),
                               ),
                             ),
                            getPhoneNumberWidget(),
                             Padding(
                               padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                               child: Align(
                                 alignment: Alignment.center,
                                 child: Visibility(
                                 visible:isPhoneNumber ,
                                 child: Text(
                                   "*Phone Number Already Exist",
                                   style: TextStyle(
                                     color:ERROR_COLOR,
                                     fontSize: 12,
                                   ),
                                 ),
                               ),
                               ),
                             ),
                            getEmailWidget(),
                             Padding(
                               padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                               child: Align(
                                 alignment: Alignment.center,
                                 child: Visibility(
                                 visible:isEmail,
                                 child: Text(
                                   "*Email Already Exist",
                                   style: TextStyle(
                                     color:ERROR_COLOR,
                                     fontSize: 12,
                                   ),
                                 ),
                               ),
                               ),
                             ),
                            getPassWidget(),
                             Padding(
                               padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                               child: Align(
                                 alignment: Alignment.center,
                                 child: Visibility(
                                 visible:isPassword ,
                                 child: Text(
                                   "*Invalid Password",
                                   style: TextStyle(
                                     color:ERROR_COLOR,
                                     fontSize: 12,
                                   ),
                                 ),
                               ),
                               ),
                             ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .02),
                              child: getQuickLogin(),
                            ),
                             Padding(
                               padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                               child: Align(
                                 alignment: Alignment.center,
                                 child: Visibility(
                                 visible:isQuickPassword ,
                                 child: Text(
                                   "*Invalid Code",
                                   style: TextStyle(
                                     color:ERROR_COLOR,
                                     fontSize: 12,
                                   ),
                                 ),
                                 ),
                               ),
                             ),
                            _hasFingerPrintSupport ?  Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * .1,
                                    left: MediaQuery.of(context).size.width * .11,
                                  ),),
                                !isLoading ? getsignUpBtnWidget(onSubmit) : loadingSign,
                                getFingerPrintBtn(),
                              ],
                            ):Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * .1,
                                  ),),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.of(context).size.height * .06,
                                  ),),
                                !isLoading ? getsignUpBtnWidget(onSubmit) : loadingSign,
                              ],
                            ),

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

//                    Expanded(
//                        child: Container(
//                          //  height: MediaQuery.of(context).size.height / 15,
//                          width: MediaQuery.of(context).size.width,
//                          decoration: new BoxDecoration(
//                            color:backgroundColor,
//                          ),
//                          child:
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
                                       onPressed: _handleGoogleSignIn,
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
                                         onPressed: _handleFacebookSignIn,
                                         iconSize: 30,
                                         icon: Image(
                                           image: AssetImage("images/faceBookLogo.png"),
                                           width: 30,
                                           height: 30,
                                         ),
                                       ),
                                     ),
                                     IconButton(
                                       onPressed: _handleLinkedInSignIn,
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
              )),
        ));

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
                  image: AssetImage('images/doctor-inactive.png'),
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
                    image: AssetImage('images/nuclear_active.png'),
                    width: 25,
                    height: 27,
                  ): Image(
                    image: AssetImage("images/nuclear_inactive.png"),
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

  Widget getPhoneNumberWidget(){
    return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .02),
        child:Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Material(
            elevation: 12.0,
            borderRadius: BorderRadius.circular(25),
            shadowColor: Colors.white,
            child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
          print(number.phoneNumber);
          },
            onInputValidated: (bool value) {
              print(value);
            },
            ignoreBlank: false,
            autoValidate: false,
            selectorTextStyle: TextStyle(color: Colors.black),
            initialValue: number,
            textFieldController: _phoneNumberController,
            inputDecoration: InputDecoration(
              hintText: 'Phone Number',
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
          ),
        ));
  }

  Widget getUserNameWidget() {
    return Padding(
        padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * .02),
    child:Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Material(
        elevation: 12.0,
        borderRadius: BorderRadius.circular(25),
        shadowColor: Colors.white,
        child: TextFormField(
          controller: _usernameController,
          keyboardType: TextInputType.text,
          focusNode: _nameNode,
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (text) {
            onFieldSubmittedNextNode(context, _nameNode, _phoneNumberNode);
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Invalid User Name';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'User Name',
            prefixIcon: new Icon(Icons.perm_identity, color:appColor),
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

  Widget getEmailWidget() {
    return      Padding(
        padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * .02),
    child:Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Material(
        elevation: 12.0,
        borderRadius: BorderRadius.circular(25),
        shadowColor: Colors.white,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          focusNode: _mailNode,
          textInputAction: TextInputAction.next,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          onFieldSubmitted: (text) {
            onFieldSubmittedNextNode(context, _mailNode, _nameNode);
          },
            validator: (value) {
              if (!(regex.hasMatch(value))) {
                return 'Invalid Email';
              }
              return null;
            },
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: new Icon(Icons.email, color: appColor),
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

  Widget getPassWidget() {
    return  Padding(
        padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * .02),
    child:Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Material(
        elevation: 12.0,
        borderRadius: BorderRadius.circular(25),
        shadowColor: Colors.white,
        child: TextFormField(
          controller: _passwordController,
          textAlignVertical: TextAlignVertical.center,
          obscureText: _obscureTextPass,
          textInputAction: TextInputAction.next,
          focusNode: _passwordNode,
          keyboardType: TextInputType.text,
          onFieldSubmitted: (text) {
            onFieldSubmittedNextNode(context, _passwordNode, _digitCodeNode);
          },
          validator: (value) {
            if (value.isEmpty || (value.length  < 6)) {
              return 'Invalid Password';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: new Icon(Icons.lock, color: appColor),
            suffixIcon: GestureDetector(
              onTap: _togglePass,
              child: Icon(
                  _obscureTextPass
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
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

  Widget getsignUpBtnWidget(Function onClick) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.5,
        height: 40.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            if ( _formKey.currentState.validate()) {
              onClick();

            }
          },
          color: appColor,
          child: Text("Register", style: TextStyle(color: Colors.white)),
        ),
      ),
    );

  }



//  bool validate() {
//    return (_emailController.text.trim().isNotEmpty) &&
//        (_phoneNumberController.text.trim().isNotEmpty) &&
//        (_usernameController.text.trim().isNotEmpty) &&
//        (_passwordController.text.trim().isNotEmpty) &&
//        (_digitCodeController.text.trim().isNotEmpty) &&
//        _formKey.currentState.validate();
//
//  }

  Widget registerWidget(){
    return Padding(
      padding: EdgeInsets.only(
          top: 15,bottom: 10),
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

  Widget getFingerPrintBtn(){
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

  Widget getQuickLogin(){
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Material(
        elevation: 12.0,
        borderRadius: BorderRadius.circular(25),
        shadowColor: Colors.white,
        child: TextFormField(
          controller: _digitCodeController,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.done,
          focusNode: _digitCodeNode,
          keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'Invalid Code';
              }
              return null;
            },
          decoration: InputDecoration(
            hintText: '4-digit code for quick sign',
            prefixIcon: new Icon(Icons.keyboard, color: appColor),
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
