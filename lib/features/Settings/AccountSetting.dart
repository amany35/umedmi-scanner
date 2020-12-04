import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';



class AccountSetting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AccountSettingState();
  }
}

class _AccountSettingState extends State<AccountSetting>{
bool isFingerPrintLockSwitched = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          iconTheme: new IconThemeData(color: appColor),
          title: Center(
            child: Text("Account Settings",
                style: TextStyle(
                  color: Colors.black,
                )),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.search),
              color: appColor,
              onPressed: (){
              },
            ),
            // action button
          ],
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Privacy",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular( 20.0) ),
                  boxShadow: [
                    BoxShadow(
                      color: greyColor,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 15.0,
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Last Seen",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    ),
                    Divider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Status",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    ),
                    Divider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Read Recipts",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    ),
                    Divider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Groups",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Fingerprint Lock",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            value: isFingerPrintLockSwitched,
                            onChanged: (value) {
                              setState(() {
                                isFingerPrintLockSwitched = value;
                              });
                            },
                            activeTrackColor: backgroundColor,
                            activeColor: appColor,
                          ),
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Security",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular( 20.0) ),
                  boxShadow: [
                    BoxShadow(
                      color: greyColor,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 15.0,
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Show Security Notifications",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Transform.scale(
                            scale: 0.6,
                            child: Switch(
                              value: isFingerPrintLockSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isFingerPrintLockSwitched = value;
                                });
                              },
                              activeTrackColor: backgroundColor,
                              activeColor: appColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Two-Steps Verification",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Transform.scale(
                            scale: 0.6,
                            child: Switch(
                              value: isFingerPrintLockSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isFingerPrintLockSwitched = value;
                                });
                              },
                              activeTrackColor: backgroundColor,
                              activeColor: appColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Change Pin",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    ),
                    Divider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Change Email Address",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    ),
                    Divider(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Change Default Phone Number",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular( 20.0) ),
                  boxShadow: [
                    BoxShadow(
                      color: greyColor,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 15.0,
                    ),
                  ],
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
                height: 47,
                child: Text("Deactivate My Account",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        )
    );
  }
}
