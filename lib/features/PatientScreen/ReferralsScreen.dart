import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umedmiscanner/common/CustomTextWidget.dart';
import 'package:umedmiscanner/common/StarDisplay.dart';
import 'package:umedmiscanner/features/scan/AddFileScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:image_picker/image_picker.dart';

class ReferralsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ReferralsScreenState();
  }
}

class _ReferralsScreenState extends State<ReferralsScreen> {
  File _image;
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  Future getImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = image;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddFileScreen(_image)),
        );
      });
    }
  }

  void showSourceDialog() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: CustomTextWidget(
          text: "Choose",
          textSize: 18.0,
          txtColor: appColor,
          fontWeight: FontWeight.bold,
        ),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: CustomTextWidget(
              text: "Open Camera",
              textSize: 16.0,
              txtColor: appColor,
              fontWeight: FontWeight.bold,
            ),
            onPressed: () {
              getImage(ImageSource.camera);
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: CustomTextWidget(
              text: "Open Gallery",
              textSize: 16.0,
              txtColor: appColor,
              fontWeight: FontWeight.bold,
            ),
            onPressed: () {
              getImage(ImageSource.gallery);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: appColor),
        title: Row(
          children: <Widget>[
            Icon(
              FontAwesomeIcons.user,
              color: appColor,
              size: 17.0,
            ),
            Text(
              "Jimmy Fallon",
              style: TextStyle(
                  color: appColor, fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.search),
            color: appColor,
            onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      title: Material(
                        borderRadius: BorderRadius.circular(5.0),
                        child: TextField(
                          autofocus: false,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Search by name, area or specialty',
                            hintStyle: TextStyle(fontSize: 12.0),
                            prefixIcon:
                                new Icon(Icons.search, color: Colors.black12),
                            filled: true,
                            fillColor: Colors.white10,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white10),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white10),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      content: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView(
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel",
                                  style: TextStyle(
                                      color: appColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0)),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
          // action button
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSourceDialog();
        },
        backgroundColor: WHITE,
        child: Tab(
          child: Image.asset("images/scan.png"),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30.0,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      FontAwesomeIcons.peopleCarry,
                      size: 16.0,
                      color: appColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Referrals",
                        style: TextStyle(
                          color: appColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * .03,
                ),
                color: backgroundColor,
                width: MediaQuery.of(context).size.width,
                height: 30.0,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      FontAwesomeIcons.headSideVirus,
                      size: 16.0,
                      color: appColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "|",
                          style: TextStyle(fontSize: 8.0, color: appColor),
                        ),
                        Text(
                          "|",
                          style: TextStyle(fontSize: 8.0, color: appColor),
                        ),
                        Text(
                          "|",
                          style: TextStyle(fontSize: 8.0, color: appColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Psychiatrists",
                        style: TextStyle(
                          color: appColor,
                          fontSize: 16.0,
                        )),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * .01,
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 5,
                                    bottom: MediaQuery.of(context).size.width * .01,
                                  ),
                                  color: backgroundColor,
                                  width: MediaQuery.of(context).size.width * 0.07,
                                  height: MediaQuery.of(context).size.width * 0.18,
                                  child: Icon(
                                    FontAwesomeIcons.peopleArrows,
                                    color: appColor,
                                    size: 16.0,
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "|",
                                      style:
                                      TextStyle(fontSize: 8.0, color: appColor),
                                    ),
                                    Text(
                                      "|",
                                      style:
                                      TextStyle(fontSize: 8.0, color: appColor),
                                    ),
                                    Text(
                                      "|",
                                      style:
                                      TextStyle(fontSize: 8.0, color: appColor),
                                    ),
                                    Text(
                                      "|",
                                      style:
                                      TextStyle(fontSize: 8.0, color: appColor),
                                    ),
                                    Text(
                                      "|",
                                      style:
                                      TextStyle(fontSize: 8.0, color: appColor),
                                    ),
                                    Text(
                                      "|",
                                      style:
                                      TextStyle(fontSize: 8.0, color: appColor),
                                    ),
                                    Text(
                                      "|",
                                      style:
                                      TextStyle(fontSize: 8.0, color: appColor),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right:
                                        MediaQuery.of(context).size.width * .5),
                                    child: Text(
                                      "Referred To:",
                                      style: TextStyle(
                                          color: appColor,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Icon(
                                    FontAwesomeIcons.calendarAlt,
                                    size: 10,
                                    color: appColor,
                                  ),
                                  Text(
                                    "3 days",
                                    style: TextStyle(
                                        color: appColor,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width * .5),
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius:
                                      MediaQuery.of(context).size.width * .04,
                                      backgroundColor: backgroundColor,
                                      backgroundImage:
                                      AssetImage('images/doctorProfile.png'),
                                    ),
                                    Text(
                                      "Dr. Jane Fallon",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width * .4),
                                child: Text(
                                  "Psychiatrist",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width * .4),
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
                      Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .1,
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  right:
                                  MediaQuery.of(context).size.width * .6),
                              child: Text(
                                "Referred By:",
                                style: TextStyle(
                                    color: appColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width * .4),
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius:
                                    MediaQuery.of(context).size.width * .04,
                                    backgroundColor: backgroundColor,
                                    backgroundImage:
                                    AssetImage('images/doctorProfile.png'),
                                  ),
                                  Text(
                                    "Dr. Mario Botencell",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width * .4),
                              child: Text(
                                "Psychiatrist",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .1,
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  right:
                                  MediaQuery.of(context).size.width * .65),
                              child: Text(
                                "Reason",
                                style: TextStyle(
                                    color: appColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * .02),
                              child: Text(
                                "URL: Lorem ipsum dolor sit amet, consenturer saspicin alter, diam nunumy elmod tempor invidunt.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
                    Divider(),
              ])),
            ],
          )),
    );
  }
}

