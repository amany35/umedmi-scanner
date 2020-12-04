import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/data/BaseUser.dart';
import 'SplashScreenTwo.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {


  BaseUser loggedUser;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SplashScreenTwo(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: getLogo(),
    );
  }

  Widget getLogo(){
   return  Container(
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
             image: AssetImage('images/logo.png'),
             width: MediaQuery.of(context).size.width * 1.5,
             height: MediaQuery.of(context).size.height *0.9,
           ),
         ),
       ],
     ),
   );
  }

}