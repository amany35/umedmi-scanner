import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';





class FeedBackRate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FeedBackRateState();
  }
}

class _FeedBackRateState extends State<FeedBackRate> {
Color answerColor = Colors.green;
String answerText = "Very Satisfied";

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final submitButton = ButtonTheme(
      minWidth: MediaQuery.of(context).size.height * .3,
      height: MediaQuery.of(context).size.height * .06,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {

        },
        color: appColor,
        child: Text("Submit", style: TextStyle(color: Colors.white)),
      ),
    );
final body = Center(
  child: Column(
    children: <Widget>[
      SizedBox(height: 25,),
      Text("How Satisfied are you with this app?",style: TextStyle(color: Colors.black,fontSize: 16.0, fontWeight: FontWeight.bold),),
      SizedBox(height: 15,),
      Text(answerText,style: TextStyle(color: answerColor,fontSize: 16.0, fontWeight: FontWeight.bold),),
      SizedBox(height: 15,),
      Row(
        children: <Widget>[
          SizedBox(width: 5,),
          IconButton(
              iconSize: 50,
              icon: Image(
                image: AssetImage('images/upset.png'),
                width: 54,
                height: 54,
              ),
              onPressed: () {
                setState(() {
                  answerColor = Colors.red;
                  answerText = "Upset";
                });
              }),
          IconButton(
              iconSize: 50,
              icon: Image(
                image: AssetImage('images/not_satisfied.png'),
                width: 54,
                height: 54,
              ),
              onPressed: () {
                setState(() {
                  answerColor = Colors.orange;
                  answerText = "Not Satisfied";
                });
              }),
          IconButton(
              iconSize: 50,
              icon: Image(
                image: AssetImage('images/not_really.png'),
                width: 54,
                height: 54,
              ),
              onPressed: () {
                setState(() {
                  answerColor = Colors.amber;
                  answerText = "Not Really";
                });
              }),
          IconButton(
              iconSize: 50,
              icon: Image(
                image: AssetImage('images/satisfied.png'),
                width: 54,
                height: 54,
              ),
              onPressed: () {
                setState(() {
                  answerColor = Colors.lightGreen;
                  answerText = "Satisfied";
                });
              }),
          IconButton(
            iconSize: 50,
              icon: Image(
                image: AssetImage('images/very_satisfied.png'),
                width: 54,
                height: 54,
              ),
              onPressed: () {
                setState(() {
                  answerColor = Colors.green;
                  answerText = "Very Satisfied";
                });
              }),
        ],
      ),
      SizedBox(height: 25,),
      submitButton,
    ],
  ),
);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        color: backgroundColor,
        width: MediaQuery.of(context).size.width,
        child: body,
      ),
    );
  }
}
