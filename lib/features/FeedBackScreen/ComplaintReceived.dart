import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/home/HomeScreen.dart';





class ComplaintReceived extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ComplaintReceivedState();
  }
}

class _ComplaintReceivedState extends State<ComplaintReceived> {


  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final gotoHomeButton = ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * .6,
        height: MediaQuery.of(context).size.height * .06,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            return Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          color: appColor,
          child: Text("Go Back Home",
              style: TextStyle(color: Colors.white, fontSize: 14.0)),
        )
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15),
                  child: Image(
                    image: AssetImage('images/success_bg.png'),
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                ),
                Text("Thank You For Your message!",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold),),
                Text("We will do some checks and contact",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold),),
                Text("you shortly :)",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold),),
                SizedBox(height: 35,),
                gotoHomeButton
              ],
            ),
          ),
        ),
      ),
    );
  }
}
