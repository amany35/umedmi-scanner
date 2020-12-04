import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class AboutDoctor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AboutDoctorState();
  }
}

class _AboutDoctorState extends State<AboutDoctor> {
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final body = ListView(
      children: <Widget>[
        SizedBox(height: 10,),
        Card(
          semanticContainer: true,
          margin: EdgeInsets.only(top: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          shadowColor: SHADOW,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .02,
              top: MediaQuery.of(context).size.width * .02,
            ),
            child: ExpandablePanel(
              header: Row(
                children: <Widget>[
                  Image.asset(
                    'images/doctorIntro.png',
                    width: 16,
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .02,
                    ),
                  ),
                  Text(
                    "Intro",
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              expanded: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: GREY_CONTAINER,
                        borderRadius: BorderRadius.all(Radius.circular(
                            10.0) //         <--- border radius here
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Headline",
                              style: TextStyle(
                                  color: titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.",
                              style:
                              TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Primary Practice",
                              style: TextStyle(
                                  color: titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.",
                              style:
                              TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Recent Education",
                              style: TextStyle(
                                  color: titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.",
                              style:
                              TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: GREY_CONTAINER,
                        borderRadius: BorderRadius.all(Radius.circular(
                            10.0) //         <--- border radius here
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Industry",
                              style: TextStyle(
                                  color: titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.",
                              style:
                              TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Country/Region",
                              style: TextStyle(
                                  color: titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.",
                              style:
                              TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Contact Info",
                              style: TextStyle(
                                  color: titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.globe,
                                    size: 14.0,
                                    color: titleColor,
                                  ),
                                  Text(
                                    "Website:",
                                    style: TextStyle(
                                        color: titleColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam.",
                              style:
                              TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                    size: 14.0,
                                    color: titleColor,
                                  ),
                                  Text(
                                    "Phone No:",
                                    style: TextStyle(
                                        color: titleColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "0132649653",
                              style:
                              TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Card(
          semanticContainer: true,
          margin: EdgeInsets.only(top: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          shadowColor: SHADOW,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .02,
              top: MediaQuery.of(context).size.width * .02,
            ),
            child: ExpandablePanel(
              header: Row(
                children: <Widget>[
                  Image.asset(
                    'images/doctorPersonalInformation.png',
                    width: 16,
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .02,
                    ),
                  ),
                  Text(
                    "Personal Information",
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              expanded: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: GREY_CONTAINER,
                        borderRadius: BorderRadius.all(Radius.circular(
                            10.0) //         <--- border radius here
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Mr. Peter Michelle Parker",
                              style: TextStyle(
                                  color: titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Gender",
                                  style: TextStyle(
                                      color: titleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Date of Birth",
                                style: TextStyle(
                                    color: titleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Age",
                                style: TextStyle(
                                    color: titleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Female",
                                  style:
                                  TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "20/10/1986",
                                style:
                                TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "34",
                                style:
                                TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "National ID/Passport",
                              style: TextStyle(
                                  color: titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "1326531596312546312",
                              style:
                              TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Country",
                                  style: TextStyle(
                                      color: titleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Region",
                                style: TextStyle(
                                    color: titleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Egypt",
                                  style:
                                  TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Cairo",
                                style:
                                TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Main Email Address",
                              style: TextStyle(
                                  color: titleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "emailaddress@domain.com",
                              style:
                              TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Phone Number",
                                  style: TextStyle(
                                      color: titleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Emergency Phone Number",
                                style: TextStyle(
                                    color: titleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "+2012365324560",
                                  style:
                                  TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "+2012365324560",
                                style:
                                TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: GREY_CONTAINER,
                        borderRadius: BorderRadius.all(Radius.circular(
                            10.0) //         <--- border radius here
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Personal Interests",
                                  style: TextStyle(
                                      color: titleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Professional Interests",
                                style: TextStyle(
                                    color: titleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Interest1, Interest2,\nInterest3, Interest4",
                                  style:
                                  TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Interest1, Interest2,\nInterest3, Interest4",
                                style:
                                TextStyle(color: LIGHT_GREY, fontSize: 12.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Card(
          semanticContainer: true,
          margin: EdgeInsets.only(top: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          shadowColor: SHADOW,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .02,
              top: MediaQuery.of(context).size.width * .02,
            ),
            child: ExpandablePanel(
              header: Row(
                children: <Widget>[
                  Image.asset(
                    'images/doctorEducation.png',
                    width: 16,
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .02,
                    ),
                  ),
                  Text(
                    "Education & Certificates",
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              expanded: Text(
                "Education & Certificates",
                softWrap: true,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Card(
          semanticContainer: true,
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * .05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          shadowColor: SHADOW,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .02,
              top: MediaQuery.of(context).size.width * .02,
            ),
            child: ExpandablePanel(
              header: Row(
                children: <Widget>[
                  Image.asset(
                    'images/licenseure.png',
                    width: 16,
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .02,
                    ),
                  ),
                  Text(
                    "Licensure",
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              expanded: Text(
                "Licensure",
                softWrap: true,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Card(
          semanticContainer: true,
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * .05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          shadowColor: SHADOW,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .02,
              top: MediaQuery.of(context).size.width * .02,
            ),
            child: ExpandablePanel(
              header: Row(
                children: <Widget>[
                  Image.asset(
                    'images/portfolio.png',
                    width: 16,
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .02,
                    ),
                  ),
                  Text(
                    "Professional Expertise",
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              expanded: Text(
                "Professional Expertise",
                softWrap: true,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Card(
          semanticContainer: true,
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * .05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          shadowColor: SHADOW,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .02,
              top: MediaQuery.of(context).size.width * .02,
            ),
            child: ExpandablePanel(
              header: Row(
                children: <Widget>[
                  Image.asset(
                    'images/patient.png',
                    width: 16,
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .02,
                    ),
                  ),
                  Text(
                    "Patient Profile",
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              expanded: Text(
                "Professional Expertise",
                softWrap: true,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
      ],
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
