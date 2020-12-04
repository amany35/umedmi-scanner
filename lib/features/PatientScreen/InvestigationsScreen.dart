import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umedmiscanner/common/CustomTextWidget.dart';
import 'package:umedmiscanner/features/scan/AddFileScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:image_picker/image_picker.dart';

import 'InvestigationsViewScreen.dart';

class InvestigationsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InvestigationsScreenState();
  }
}

class _InvestigationsScreenState extends State<InvestigationsScreen> {
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
    final investigationsButton = Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * .02),
        child: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width,
          height: 40.0,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () {},
              color: appColor,
              child: Row(
                children: <Widget>[
                  Image(
                    image: AssetImage('images/doctorInvestigation.png'),
                    width: 17,
                    height: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Investigations",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 170,
                  ),
                  Icon(
                    FontAwesomeIcons.plus,
                    size: 14.0,
                    color: Colors.white,
                  ),
                ],
              )),
        ));

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
                  color: appColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
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
      backgroundColor: backgroundColor,
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
              investigationsButton,
              Expanded(
                  child: ListView(children: <Widget>[
                GestureDetector(
                  onTap: () {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InvestigationsViewScreen()),
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.width * .01,
                        ),
                        child: Container(
                          color: backgroundColor,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                child: Icon(
                                  FontAwesomeIcons.link,
                                  color: appColor,
                                  size: 16.0,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5,),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        .55),
                                child: Text(
                                  "Url Document",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                FontAwesomeIcons.paperclip,
                                size: 14,
                                color: appColor,
                              ),
                              Text(
                                " 1",
                                style: TextStyle(
                                    color: appColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * .5),
                            child: Text(
                              "Made on 20/6/2020",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * .01),
                            child: Text(
                              "URL: Lorem ipsum dolor sit amet, consenturer saspicin\n alter, diam nunumy elmod tempor invidunt.",
                              style: TextStyle(
                                  color: appColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.width * .01,
                      ),
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: 30.0,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.microscope,
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
                          Text("Laboratory",
                              style: TextStyle(
                                color: appColor,
                                fontSize: 16.0,
                              )),
                        ],
                      ),
                    ),
                GestureDetector(
                  onTap: () {
                    return Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InvestigationsViewScreen()),
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.width * .1,
                        ),
                        child: Container(
                          color: backgroundColor,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.width * .02,
                                ),
                                child: Icon(
                                  FontAwesomeIcons.heartbeat,
                                  color: appColor,
                                  size: 16.0,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(
                                        fontSize: 8.0, color: appColor),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5,),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * .65),
                            child: Text(
                              "Test Name",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * .5),
                            child: Text(
                              "Made on 20/6/2020",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.02,
                              top: MediaQuery.of(context).size.height * 0.01,
                            ),
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: backgroundColor,
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
                            // color: Colors.white,
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.2,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      backgroundColor: backgroundColor,
                                      backgroundImage: AssetImage(
                                          'images/prescription_logo.png'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                .06,
                                      ),
                                      child: Text(
                                        "Test Name",
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                .05,
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "DR/ Dany Smith",
                                            style: TextStyle(
                                                color: appColor,
                                                fontSize: 10.0),
                                          ),
                                          Text(
                                            "Professor of Heart and Blood vessels",
                                            style: TextStyle(
                                                color: appColor, fontSize: 7.0),
                                          ),
                                          Text(
                                            "CPHO-PHD-FC-Harvard University",
                                            style: TextStyle(
                                                color: appColor, fontSize: 7.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "Prescriped for",
                                      style: TextStyle(fontSize: 8.0),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                .01,
                                      ),
                                      child: Text(
                                        "Alaa Ahmed Hussien",
                                        style: TextStyle(
                                            color: appColor, fontSize: 8.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                .07,
                                      ),
                                      child: Text(
                                        "Issued in",
                                        style: TextStyle(fontSize: 8.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                .01,
                                      ),
                                      child: Text(
                                        "19 Jan 2020",
                                        style: TextStyle(
                                            color: appColor, fontSize: 8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
            ],
          )),
    );
  }
}
