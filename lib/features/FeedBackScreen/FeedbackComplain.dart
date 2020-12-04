import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';

import 'ComplaintReceived.dart';


class FeedbackComplain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FeedbackComplainState();
  }
}

class _FeedbackComplainState extends State<FeedbackComplain> {


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
          return Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ComplaintReceived()),
          );
        },
        color: appColor,
        child: Text("Submit", style: TextStyle(color: Colors.white)),
      ),
    );
    final addScreenShotButton = Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {

        },
        color: SWITCH_TRACK,
        child: Text("Add Screenshot", style: TextStyle(color:Colors.white)),
      ),
    );
    final body = Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 25,),
            Text("We apologize if you encountered any issues, please advise us with more details and we will contact you shortly.",
              style: TextStyle(color: Colors.black,fontSize: 14.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(15.0) //         <--- border radius here
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 3.0,
                  ),
                ],
              ),
              // color: Colors.white,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Complaint here',
                      filled: true,
                      fillColor: Colors.white70,
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
                    ),),
                  addScreenShotButton,
                ],
              ),
            ),
            SizedBox(height: 25,),
            submitButton,
          ],
        ),
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
