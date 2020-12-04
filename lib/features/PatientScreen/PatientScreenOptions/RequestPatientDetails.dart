import 'dart:ui';

import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/common/StarDisplay.dart';
import 'package:umedmiscanner/features/PatientScreen/ReferralsScreen.dart';
import 'package:umedmiscanner/features/home/drawer/circular_image.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class RequestPatientDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RequestPatientDetailsState();
  }
}

class _RequestPatientDetailsState extends State<RequestPatientDetails> {
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";
  bool folderSelected = true, nonSelected = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final body = Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              Colors.white,
              const Color(0xDDC5C2D5),
            ],
            end: const Alignment(0.0, -1),
            begin: const Alignment(0.0, 0.6),
            stops: [0.0, 1.0],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height / 15, horizontal: width / 40),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "images/close.png",
                    color: appColor,
                    width: width / 15,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    width: width / 4,
                    height: height / 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Approved",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                        textScaleFactor: 1,
                      ),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                    ),
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(
                              20.0) //         <--- border radius here
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffE8E6F1),
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    width: width,
                    height: height / 4,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.bookmark_border,
                            color: PROGRESS_COLOR,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            CircularImage(
                              NetworkImage(imageUrl),
                              width: 30,
                              height: 30,
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Milena Kafka (#206541)",
                                      style: TextStyle(
                                          color: titleColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width:5,),
                                    GestureDetector(
                                      onTap: null,
                                      child: Image.asset(
                                        "images/qr-code.png",
                                        color: appColor,
                                        width: width / 30,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      decoration: BoxDecoration(
                                        color: POINTS_COLOR,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                5.0) //         <--- border radius here
                                            ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0.0, 1.0), //(x,y)
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                      ),
                                      height: 15,
                                      child: Row(
                                        children: <Widget>[
                                          Image(
                                            image: AssetImage(
                                                'images/patientcritical.png'),
                                            width: 7,
                                            height: 10,
                                          ),
                                          Text(
                                            "6 Critical Points",
                                            style: TextStyle(
                                                color: Colors.pink,
                                                fontSize: 8),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      FontAwesomeIcons.users,
                                      size: 10.0,
                                      color: appColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "3",
                                      style: TextStyle(
                                          color: appColor, fontSize: 10),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: width * .4),
                                  child: Text(
                                    "Last Visit on 20/1/2019",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10.0),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
//                    return Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => PatientProfile()),
//                    );
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.02,
                                ),
                                decoration: BoxDecoration(
                                  color: SHARE_USERS,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          8.0) //         <--- border radius here
                                      ),
                                ),
                                alignment: Alignment.center,
                                width: width / 8,
                                height: height / 15,
                                child: Column(
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage('images/maleIcon.png'),
                                      width: 10,
                                      height: 22,
                                      color: appColor,
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      "Female",
                                      style: TextStyle(
                                          fontSize: 9.0,
                                          fontWeight: FontWeight.bold,
                                          color: appColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.02,
                                ),
                                decoration: BoxDecoration(
                                  color: DIAGNOSIS_COLOR,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          8.0) //         <--- border radius here
                                      ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                                // color: Colors.white,
                                alignment: Alignment.center,
                                width: width / 8,
                                height: height / 15,
                                child: Column(
                                  children: <Widget>[
                                    Image(
                                      image:
                                          AssetImage('images/pregnantIcon.png'),
                                      width: 18,
                                      height: 18,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Pregnant",
                                      style: TextStyle(
                                          fontSize: 9.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pinkAccent),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.02,
                                ),
                                decoration: BoxDecoration(
                                  color: AGE_COLOR,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          8.0) //         <--- border radius here
                                      ),
                                ),
                                // color: Colors.white,
                                alignment: Alignment.center,
                                width: width / 8,
                                height: height / 15,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "30",
                                      style: TextStyle(
                                          fontSize: 18.0, color: appColor),
                                    ),
                                    //SizedBox(height: 2,),
                                    Text(
                                      "Years",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: appColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.02,
                                ),
                                decoration: BoxDecoration(
                                  color: INSURANCE,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          8.0) //         <--- border radius here
                                      ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                                // color: Colors.white,
                                alignment: Alignment.center,
                                width: width / 8,
                                height: height / 15,
                                child: Column(
                                  children: <Widget>[
                                    Image(
                                      image:
                                          AssetImage('images/shieldIcon.png'),
                                      width: 18,
                                      height: 22,
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      "Insured",
                                      style: TextStyle(
                                          fontSize: 9.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.02,
                                ),
                                decoration: BoxDecoration(
                                  color: DIAGNOSIS_COLOR,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          8.0) //         <--- border radius here
                                      ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                                // color: Colors.white,
                                alignment: Alignment.center,
                                width: width / 8,
                                height: height / 15,
                                child: Column(
                                  children: <Widget>[
                                    Image(
                                      image:
                                          AssetImage('images/diabetesIcon.png'),
                                      width: 18,
                                      height: 18,
                                    ),
                                    Text(
                                      "Diabetic",
                                      style: TextStyle(
                                          fontSize: 9.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pinkAccent),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.02,
                                ),
                                decoration: BoxDecoration(
                                  color: SHARE_USERS,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          8.0) //         <--- border radius here
                                      ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                                // color: Colors.white,
                                alignment: Alignment.center,
                                width: width / 8,
                                height: height / 15,
                                child: Column(
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage('images/groupIcon.png'),
                                      width: 18,
                                      height: 18,
                                    ),
                                    Text(
                                      "Share",
                                      style: TextStyle(
                                          fontSize: 9.0,
                                          fontWeight: FontWeight.bold,
                                          color: appColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: width / 40,
                    top: height / 20,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width / 60),
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                              15.0) //         <--- border radius here
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    // color: Colors.white,
                    alignment: Alignment.center,
                    width: width / 8,
                    height: width / 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(
                              40.0), //         <--- border radius here
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 1.0,
                          ),
                        ],
                      ),
                      // color: Colors.white,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Image(
                        image: AssetImage('images/patientinfo-emr.png'),
                        width: 25,
                        height: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width / 60),
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                              15.0) //         <--- border radius here
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    // color: Colors.white,
                    alignment: Alignment.center,
                    width: width / 8,
                    height: width / 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(
                              40.0), //         <--- border radius here
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 1.0,
                          ),
                        ],
                      ),
                      // color: Colors.white,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Image(
                        image: AssetImage('images/stethoscope.png'),
                        width: 25,
                        height: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width / 60),
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                              15.0) //         <--- border radius here
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    // color: Colors.white,
                    alignment: Alignment.center,
                    width: width / 8,
                    height: width / 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(
                              40.0), //         <--- border radius here
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 1.0,
                          ),
                        ],
                      ),
                      // color: Colors.white,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Image(
                        image: AssetImage('images/doctor-emr.png'),
                        width: 25,
                        height: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width / 60),
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                              15.0) //         <--- border radius here
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    // color: Colors.white,
                    alignment: Alignment.center,
                    width: width / 8,
                    height: width / 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(
                              40.0), //         <--- border radius here
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 1.0,
                          ),
                        ],
                      ),
                      // color: Colors.white,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Image(
                        image: AssetImage('images/intervention.png'),
                        width: 25,
                        height: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width / 60),
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                              15.0) //         <--- border radius here
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    // color: Colors.white,
                    alignment: Alignment.center,
                    width: width / 8,
                    height: width / 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: LIGHT_GREY,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(
                              40.0), //         <--- border radius here
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 1.0,
                          ),
                        ],
                      ),
                      // color: Colors.white,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Image(
                        image: AssetImage('images/referral.png'),
                        width: 25,
                        height: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width / 60),
                    decoration: BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                              15.0) //         <--- border radius here
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    // color: Colors.white,
                    alignment: Alignment.center,
                    width: width / 8,
                    height: width / 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: LIGHT_GREY,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(
                              40.0), //         <--- border radius here
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 1.0,
                          ),
                        ],
                      ),
                      // color: Colors.white,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Image(
                        image: AssetImage('images/report.png'),
                        width: 25,
                        height: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CircularCheckBox(
                      value: this.folderSelected,
                      checkColor: Colors.white,
                      activeColor: appColor,
                      inactiveColor: appColor,
                      disabledColor: Colors.grey,
                      onChanged: (val) => this.setState(() {
                            this.folderSelected = !this.folderSelected;
                          })),
                  SizedBox(
                    width: width / 40,
                  ),
                  CircularCheckBox(
                      value: this.folderSelected,
                      checkColor: Colors.white,
                      activeColor: appColor,
                      inactiveColor: appColor,
                      disabledColor: Colors.grey,
                      onChanged: (val) => this.setState(() {
                            this.folderSelected = !this.folderSelected;
                          })),
                  SizedBox(
                    width: width / 40,
                  ),
                  CircularCheckBox(
                      value: this.folderSelected,
                      checkColor: Colors.white,
                      activeColor: appColor,
                      inactiveColor: appColor,
                      disabledColor: Colors.grey,
                      onChanged: (val) => this.setState(() {
                            this.folderSelected = !this.folderSelected;
                          })),
                  SizedBox(
                    width: width / 40,
                  ),
                  CircularCheckBox(
                      value: this.folderSelected,
                      checkColor: Colors.white,
                      activeColor: appColor,
                      inactiveColor: appColor,
                      disabledColor: Colors.grey,
                      onChanged: (val) => this.setState(() {
                            this.folderSelected = !this.folderSelected;
                          })),
                  SizedBox(
                    width: width / 40,
                  ),
                  CircularCheckBox(
                      value: this.nonSelected,
                      checkColor: Colors.white,
                      activeColor: appColor,
                      inactiveColor: appColor,
                      disabledColor: Colors.grey,
                      onChanged: (val) => this.setState(() {
                            this.nonSelected = false;
                          })),
                  SizedBox(
                    width: width / 40,
                  ),
                  CircularCheckBox(
                      value: this.nonSelected,
                      checkColor: Colors.white,
                      activeColor: appColor,
                      inactiveColor: appColor,
                      disabledColor: Colors.grey,
                      onChanged: (val) => this.setState(() {
                            this.nonSelected = false;
                          })),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Access requested from :",
                  style:
                      TextStyle(color: fontColor, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(
                            40.0), //         <--- border radius here
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    // color: Colors.white,
                    alignment: Alignment.center,
                    width: 40,
                    height: 50 ,
                    child: Image(
                      image: AssetImage('images/lab_active.png'),
                      width: 25,
                      height: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, right: 5),
                    padding:EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(20.0) //         <--- border radius here
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffE8E6F1),
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    width: width / 1.3,
                    height: height / 10,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            CircularImage(
                              NetworkImage(imageUrl, scale: width / 40),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Lab Name",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconTheme(
                                    data: IconThemeData(
                                      color: ratingColor,
                                      size: 15,
                                    ),
                                    child: StarDisplay(value: 4),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          left: width / 50,
                          top: 2,
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
    return Scaffold(
      backgroundColor: backgroundColor,
      body: body,
    );
  }
}
