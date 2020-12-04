import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/data/BaseUser.dart';
import 'package:umedmiscanner/features/splashScreens/onBoarding/OnBoardingScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';



class SplashScreenTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenTwoState();
  }
}

class SplashScreenTwoState extends State<SplashScreenTwo> {


  BaseUser loggedUser;
  @override
  void initState() {

    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => nextPage(loggedUser),
          ));
    });
  }

 StatefulWidget nextPage(BaseUser loggedUser) {
    return  OnBoardingScreen();
  }

//  checkLogin() async {
//    BaseUser user =await getUserData();
//    loggedUser = user;
//  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: getLogo(),
    );
  }

  Widget getLogo(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag:"logo",
            child: Image(
              image: AssetImage('images/logo2.png'),
              width: MediaQuery.of(context).size.width * .6,
              height: MediaQuery.of(context).size.height * .2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:0.3,left: MediaQuery.of(context).size.width*.20),
            child: Text("Scan",
              style: TextStyle(color: appColor,
                  fontSize: 16.0,fontStyle: FontStyle.italic,fontWeight: FontWeight.normal ),),
          ),
        ],
      ),
    );
  }
}