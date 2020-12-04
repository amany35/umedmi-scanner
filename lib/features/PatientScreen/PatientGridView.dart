import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umedmiscanner/common/CustomTextWidget.dart';
import 'package:umedmiscanner/features/home/drawer/circular_image.dart';
import 'package:umedmiscanner/features/scan/AddFileScreen.dart';
import 'package:umedmiscanner/features/scan/CustomDialog.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:image_picker/image_picker.dart';

import 'PatientDataScreen.dart';

class PatientGridView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PatientGridViewState();
  }
}

class _PatientGridViewState extends State<PatientGridView> {
  File _image;
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: backgroundColor,
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(10, (index) {
            return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 40, vertical: height / 40),
                child: GestureDetector(
                  onTap: () {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PatientDataScreen()),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(
                                20.0) //         <--- border radius here
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          width: width / 10,
                          height: height / 30,
                          child: Column(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                left: width / 3,
                              ),
                              child: Icon(
                                Icons.bookmark,
                                size: 22,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(width:width / 15,),
                                GestureDetector(
                                    child: Image.asset(
                                      "images/sharedPatientsIcon.png",
                                      color: primaryColor,
                                      width: width / 18,
                                    ),
                                    onTap: () {}),
                                SizedBox(width:width / 15,),
                                CircularImage(
                                  NetworkImage(imageUrl),
                                ),
                                SizedBox(width:width / 15,),
                                GestureDetector(
                                    child: Image.asset(
                                      "images/qr-code.png",
                                      color: primaryColor,
                                      width: width / 18,
                                    ),
                                    onTap: () {}),
                              ],
                            ),
                            SizedBox(height: height/25),
                            Text(
                              "Diana Rockwell",
                              style: TextStyle(color: titleColor, fontSize: 15),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width / 10),
                              child: Row(
                                children: [
                                  Text("M",
                                    style: TextStyle(
                                        color: searchbarIconColor, fontSize: 12),),
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor: appColor,
                                  ),
                                  Text("23",
                                    style: TextStyle(
                                        color: searchbarIconColor, fontSize: 12),),
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor: appColor,
                                  ),
                                  Text("Diabetic",
                                    style: TextStyle(
                                        color: searchbarIconColor, fontSize: 12),),
                                ],
                              ),
                            )
                          ])),
                      Positioned(
                        left: width / 40,
                        top: height / 20,
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  )
                )
            );
          }),
        ));
  }
}
