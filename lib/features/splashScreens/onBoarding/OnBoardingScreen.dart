import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/data/BaseUser.dart';
import 'package:umedmiscanner/features/registration/login/LoginScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

import 'ForthBoardingScreen.dart';
import 'SecondBoardingScreen.dart';
import 'ThirdBoardingScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OnBoardingScreenState();
  }
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  BaseUser loggedUser;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SecondBoardingScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {


    final skipButton = Padding(
      padding: EdgeInsets.all(2),
      child: FlatButton(
        onPressed: () {
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        child: Text("Skip", style: TextStyle(color: appColor)),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('images/header.png'),
              width: MediaQuery.of(context).size.width,
//              height: MediaQuery.of(context).size.height *0.2,
            ),
             SizedBox(height: 60,),
            GestureDetector(
              onTap:(){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondBoardingScreen(),
                    ));
              },
              child: Image(
                image: AssetImage('images/onboarding1.png'),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height *0.4,
              ),
            ),
            SizedBox(height: 60,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          "Have tons of hectic paperwork but too little time?",
                        textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: ON_BOARDING_TEXT),
                        ),
                    ),

                   Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .1,
                            left: MediaQuery.of(context).size.width * .42,
                          ),
                        ),
                        Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                          child: FloatingActionButton(
                            backgroundColor: appColor,
                            heroTag: null,
                            elevation: 0,
                            onPressed: () => {
                                 Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => OnBoardingScreen()),
                                )
                            },
                          ),
                        ),
                        Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                          child: FloatingActionButton(
                            backgroundColor: greyColor,
                            heroTag: null,
                            elevation: 0,
                            onPressed: () => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => SecondBoardingScreen()),
                              )
                            },
                          ),
                        ),
                        Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                          child: FloatingActionButton(
                            backgroundColor: greyColor,
                            heroTag: null,
                            elevation: 0,
                            onPressed: () => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => ThirdBoardingScreen()),
                              )
                            },
                          ),
                        ),
                        Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                          child: FloatingActionButton(
                            backgroundColor: greyColor,
                            heroTag: null,
                            elevation: 0,
                            onPressed: () => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => ForthBoardingScreen()),
                              )
                            },
                          ),
                        ),

                      ],
                   ),
            skipButton,
          ],
        ),
      ),
    );
  }
}