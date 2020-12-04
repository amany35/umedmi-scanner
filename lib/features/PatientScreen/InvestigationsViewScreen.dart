import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umedmiscanner/common/CustomTextWidget.dart';
import 'package:umedmiscanner/features/scan/AddFileScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:image_picker/image_picker.dart';

class InvestigationsViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InvestigationsViewScreenState();
  }
}

class _InvestigationsViewScreenState extends State<InvestigationsViewScreen> {
  File _image;
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";
  int _count = 0;
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

  void _addNewDocument() {
    setState(() {
      _count = _count + 1;
    });
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

    final saveButton = Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
      child: FlatButton(
        onPressed: () {

        },
        child: Text("Save", style: TextStyle(color:appColor)),
      ),
    );

    List<Widget> _documentsActivityList =
    new List.generate(_count, (int i) => new Container(

      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.05),
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
      height: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: <Widget>[
      TextField(
      keyboardType: TextInputType.multiline,
        maxLines: 4,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'type your note here...',
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
          saveButton,
        ],
      ),
    ));

    final prescription = Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.02,
        right: MediaQuery.of(context).size.height * 0.02,
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //         <--- border radius here
            ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      // color: Colors.white,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * .05,
                backgroundColor: backgroundColor,
                backgroundImage: AssetImage('images/prescription_logo.png'),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .03,
                ),
                child: Text(
                  "Complete Blood Count",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "DR/ Dany Smith",
                      style: TextStyle(color: appColor, fontSize: 14.0),
                    ),
                    Text(
                      "Professor of Heart and Blood vessels",
                      style: TextStyle(color: appColor, fontSize: 8.0),
                    ),
                    Text(
                      "CPHO-PHD-FC-Harvard University",
                      style: TextStyle(color: appColor, fontSize: 8.0),
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
                style: TextStyle(fontSize: 10.0),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .01,
                ),
                child: Text(
                  "Alaa Ahmed Hussien",
                  style: TextStyle(color: appColor, fontSize: 10.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05,
                ),
                child: Text(
                  "Issued in",
                  style: TextStyle(fontSize: 10.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .01,
                ),
                child: Text(
                  "19 Jan 2020",
                  style: TextStyle(color: appColor, fontSize: 10.0),
                ),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * .7,
              top: MediaQuery.of(context).size.width * .01,
            ),
            child: Text(
              "Rx:",
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * .2,
              top: MediaQuery.of(context).size.width * .01,
            ),
            child: Text(
              "- Medication name (Notes here --)",
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * .2,
            ),
            child: Text(
              "- Medication name (Notes here --)",
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * .2,
            ),
            child: Text(
              "- Medication name (Notes here --)",
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * .2,
            ),
            child: Text(
              "- Medication name (Notes here --)",
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * .2,
            ),
            child: Text(
              "- Medication name (Notes here --)",
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.22,
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              width: MediaQuery.of(context).size.width,
              child: Divider(
                color: Colors.grey,
                height: 0.02,
                thickness: 0.2,
              )),
          Row(
            children: <Widget>[
              Text(
                "Address:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .38,
                ),
                child: Text(
                  "Phones:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * .01,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  "Shatby Branch:",
                  style: TextStyle(color: appColor, fontSize: 10.0),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .01,
                  ),
                  child: Text(
                    "Raml Station,Concord Building",
                    style: TextStyle(fontSize: 8.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .06,
                  ),
                  child: Text(
                    "Mobile:",
                    style: TextStyle(color: appColor, fontSize: 8.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .01,
                  ),
                  child: Text(
                    "+201212345678",
                    style: TextStyle(fontSize: 8.0),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * .01,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  "Lamour Branch:",
                  style: TextStyle(color: appColor, fontSize: 9.0),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .01,
                  ),
                  child: Text(
                    "Lamour Station,Concord Building",
                    style: TextStyle(fontSize: 8.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .04,
                  ),
                  child: Text(
                    "Mobile:",
                    style: TextStyle(color: appColor, fontSize: 8.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .01,
                  ),
                  child: Text(
                    "+201112345678",
                    style: TextStyle(fontSize: 8.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: appColor),
        title: Row(
          children: <Widget>[
            Icon(
              FontAwesomeIcons.user,
              color: Colors.black,
              size: 17.0,
            ),
            Text(
              "Jimmy Fallon",
              style: TextStyle(
                  color: Colors.black,
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
              Container(
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.all(
                        Radius.circular(15.0) //         <--- border radius here
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
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
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
                    ],
                  )),
              Expanded(
                  child: ListView(children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Complete Blood Count",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage('images/flagIcon.png'),
                      width: 7.5,
                      height: 9,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text("3 Flags",
                        style: TextStyle(
                          fontSize: 8.0,
                          color: Colors.pinkAccent,
                        )),
                    Container(
                      width: 8.0,
                      height: 10,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.12,
                      ),
                      child: IconButton(
                          iconSize: 10.0,
                          icon: Icon(
                            FontAwesomeIcons.trash,
                            color: appColor,
                          ),
                          onPressed: () {}),
                    ),
                    Container(
                      width: 8.0,
                      height: 10,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: IconButton(
                          iconSize: 10.0,
                          icon: Icon(
                            Icons.share,
                            color: appColor,
                          ),
                          onPressed: () {}),
                    ),
                    Container(
                      width: 8.0,
                      height: 10,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: IconButton(
                          iconSize: 10.0,
                          icon: Icon(
                            FontAwesomeIcons.edit,
                            color: appColor,
                          ),
                          onPressed: () {}),
                    ),
                    Container(
                      width: 8.0,
                      height: 10,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: IconButton(
                          iconSize: 10.0,
                          icon: Icon(
                            FontAwesomeIcons.bookmark,
                            color: appColor,
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Patient Name: Jimmy Fallon",
                      style: TextStyle(color: Colors.black, fontSize: 12.0),
                    ),
                    Container(
                      width: 8.0,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.25,
                      ),
                      child: IconButton(
                          iconSize: 10.0,
                          icon: Icon(
                            FontAwesomeIcons.comment,
                            color: appColor,
                          ),
                          onPressed: () {}),
                    ),
                    Container(
                      width: 8.0,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                        right: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: IconButton(
                          iconSize: 10.0,
                          icon: Icon(
                            FontAwesomeIcons.users,
                            color: appColor,
                          ),
                          onPressed: () {}),
                    ),
                    Text(
                      "3",
                      style: TextStyle(color: appColor, fontSize: 12),
                    ),
                  ],
                ),
                prescription,
                Row(
                  children: <Widget>[
                    Text(
                      "Document Activity",
                      style: TextStyle(
                          color: appColor, fontWeight: FontWeight.bold, fontSize: 15,),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    IconButton(
                        iconSize: 10.0,
                        icon: Icon(
                          FontAwesomeIcons.plus,
                          color: appColor,
                        ),
                      onPressed: _addNewDocument,
                        ),
                  ],
                ),
                Column(
                  children: _documentsActivityList,
                ),
                Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  margin: EdgeInsets.only(top: 3),
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
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 12.0,
                            color: ratingColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * .05,
                            backgroundColor: backgroundColor,
                            backgroundImage:
                                AssetImage('images/doctorProfile.png'),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Dr Brain Samuel added a Note:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            FontAwesomeIcons.clock,
                            size: 8,
                            color: appColor,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "1 hour",
                            style: TextStyle(
                                color: appColor,
                                fontSize: 8.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.03),
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                            top: 3),
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
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            "Lorem ipsum dolor sit amet, consenturer saspicin alter, diam nunumy elmod tempor invidunt,"
                            " Lorem ipsum dolor sit amet, consenturer saspici alter.",
                        style: TextStyle(fontSize: 12.0),),
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
