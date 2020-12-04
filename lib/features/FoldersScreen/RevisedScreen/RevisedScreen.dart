import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umedmiscanner/common/CustomTextWidget.dart';
import 'package:umedmiscanner/features/scan/AddFileScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:image_picker/image_picker.dart';

class RevisedScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RevisedScreenState();
  }
}

class _RevisedScreenState extends State<RevisedScreen> {
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
              FontAwesomeIcons.folder,
              color: appColor,
              size: 14.0,
            ),
            Text(
              "To Be Revised",
              style: TextStyle(color: appColor, fontSize: 14.0, fontWeight: FontWeight.bold),
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
          child: ListView(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
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
                              bottom: MediaQuery.of(context).size.width * .02,
                            ),
                            child: Icon(
                              FontAwesomeIcons.microscope,
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
                                right:
                                MediaQuery.of(context).size.width * .4),
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
                                left: MediaQuery.of(context).size.width * .1),
                            child: Icon(
                              FontAwesomeIcons.clock,
                              size: 14,
                              color: appColor,
                            ),
                          ),
                          Text(
                            "2 days",
                            style: TextStyle(
                                color: appColor,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                right:
                                MediaQuery.of(context).size.width * .01),
                            child: Text(
                              "Patient Name:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right:
                                MediaQuery.of(context).size.width * .37),
                            child: Text(
                              "Maria Sparks",
                              style: TextStyle(
                                  color: appColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Slidable(
                        delegate: new SlidableDrawerDelegate(),
                        actionExtentRatio: 0.25,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.02,
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
                              Container(
                                width: 10.0,
                                height: 1,
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.65,
                                ),
                                child: IconButton(
                                    iconSize: 14.0,
                                    icon: Icon(
                                      FontAwesomeIcons.bookmark,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {}),
                              ),
                              SizedBox(height: 10.0,),
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius:
                                    MediaQuery.of(context).size.width * .05,
                                    backgroundColor: backgroundColor,
                                    backgroundImage: AssetImage(
                                        'images/prescription_logo.png'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          .06,
                                    ),
                                    child: Text(
                                      "Test Name",
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          .05,
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "DR/ Dany Smith",
                                          style: TextStyle(
                                              color: appColor, fontSize: 10.0),
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
                                      left: MediaQuery.of(context).size.width *
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
                                      left: MediaQuery.of(context).size.width *
                                          .07,
                                    ),
                                    child: Text(
                                      "Issued in",
                                      style: TextStyle(fontSize: 8.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
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
                        actions: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.06,
                              top: MediaQuery.of(context).size.width * 0.09,
                            ),
                            decoration: BoxDecoration(
                              color: SWITCH_TRACK,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0) //         <--- border radius here
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
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: IconButton(
                              icon: Icon(Icons.alarm, color: Colors.white,),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                          builder: (context, setState) {
                                            return AlertDialog(
                                                backgroundColor: backgroundColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                                title: Center(
                                                  child: Text(
                                                    'Snooze Details',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14.0),
                                                  ),
                                                ),
                                                content: Container(
                                                  color: backgroundColor,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                  Padding(
                                                  padding:
                                                  EdgeInsets.only(right: MediaQuery.of(context).size.width * .55),
                                              child: Text("Until", style: TextStyle(color: Colors.grey, fontSize: 14.0),),),
                                                    SizedBox(height: 10,),
                                                    Row(
                                                      children: <Widget>[
                                                        Container(
                                                          width:27.0,
                                                          height: 25.0,
                                                          decoration: BoxDecoration(
                                                            boxShadow: <BoxShadow>[
                                                              BoxShadow(
                                                                color: backgroundColor.withOpacity(0.1),
                                                                blurRadius: 1,
                                                                offset: Offset(0, 2),
                                                              ),
                                                            ],
                                                          ),
                                                          margin: EdgeInsets.only(
                                                            right: 8,
                                                          ),
                                                          child: FloatingActionButton(
                                                            heroTag: null,
                                                            onPressed: () {},
                                                            backgroundColor: Colors.white,
                                                            child: Text("Sat", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                                                          ),),
                                                        Container(
                                                          width:27.0,
                                                          height: 25.0,
                                                          decoration: BoxDecoration(
                                                            boxShadow: <BoxShadow>[
                                                              BoxShadow(
                                                                color: backgroundColor.withOpacity(0.1),
                                                                blurRadius: 1,
                                                                offset: Offset(0, 2),
                                                              ),
                                                            ],
                                                          ),
                                                          margin: EdgeInsets.only(
                                                            right: 8,
                                                          ),
                                                          child: FloatingActionButton(
                                                            heroTag: null,
                                                            onPressed: () {},
                                                            backgroundColor: Colors.white,
                                                            child: Text("Sun", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                                                          ),),
                                                        Container(
                                                          width:25.0,
                                                          height: 25.0,
                                                          decoration: BoxDecoration(
                                                            boxShadow: <BoxShadow>[
                                                              BoxShadow(
                                                                color: backgroundColor.withOpacity(0.1),
                                                                blurRadius: 1,
                                                                offset: Offset(0, 2),
                                                              ),
                                                            ],
                                                          ),
                                                          margin: EdgeInsets.only(
                                                            right: 8,
                                                          ),
                                                          child: FloatingActionButton(
                                                            heroTag: null,
                                                            onPressed: () {},
                                                            backgroundColor: appColor,
                                                            child: Text("Mon", style: TextStyle(color: Colors.white, fontSize: 10.0),),
                                                          ),),
                                                        Container(
                                                          width:25.0,
                                                          height: 25.0,
                                                          decoration: BoxDecoration(
                                                            boxShadow: <BoxShadow>[
                                                              BoxShadow(
                                                                color: backgroundColor.withOpacity(0.1),
                                                                blurRadius: 1,
                                                                offset: Offset(0, 2),
                                                              ),
                                                            ],
                                                          ),
                                                          margin: EdgeInsets.only(
                                                            right: 8,
                                                          ),
                                                          child: FloatingActionButton(
                                                            heroTag: null,
                                                            onPressed: () {},
                                                            backgroundColor: Colors.white,
                                                            child: Text("Tue", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                                                          ),),
                                                        Container(
                                                          width:25.0,
                                                          height: 25.0,
                                                          decoration: BoxDecoration(
                                                            boxShadow: <BoxShadow>[
                                                              BoxShadow(
                                                                color: backgroundColor.withOpacity(0.1),
                                                                blurRadius: 1,
                                                                offset: Offset(0, 2),
                                                              ),
                                                            ],
                                                          ),
                                                          margin: EdgeInsets.only(
                                                            right: 8,
                                                          ),
                                                          child: FloatingActionButton(
                                                            heroTag: null,
                                                            onPressed: () {},
                                                            backgroundColor: Colors.white,
                                                            child: Text("Wed", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                                                          ),),
                                                        Container(
                                                          width:25.0,
                                                          height: 25.0,
                                                          decoration: BoxDecoration(
                                                            boxShadow: <BoxShadow>[
                                                              BoxShadow(
                                                                color: backgroundColor.withOpacity(0.1),
                                                                blurRadius: 1,
                                                                offset: Offset(0, 2),
                                                              ),
                                                            ],
                                                          ),
                                                          margin: EdgeInsets.only(
                                                            right: 8,
                                                          ),
                                                          child: FloatingActionButton(
                                                            heroTag: null,
                                                            onPressed: () {},
                                                            backgroundColor: Colors.white,
                                                            child: Text("Thu", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                                                          ),),
                                                        Container(
                                                          width:25.0,
                                                          height: 25.0,
                                                          decoration: BoxDecoration(
                                                            boxShadow: <BoxShadow>[
                                                              BoxShadow(
                                                                color: backgroundColor.withOpacity(0.1),
                                                                blurRadius: 1,
                                                                offset: Offset(0, 2),
                                                              ),
                                                            ],
                                                          ),
                                                          child: FloatingActionButton(
                                                            heroTag: null,
                                                            onPressed: () {},
                                                            backgroundColor: Colors.white,
                                                            child: Text("Fri", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                                                          ),),
                                                      ],
                                                    ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            top: MediaQuery.of(context).size.height * .03),
                                                      ),
                                                      FlatButton(
                                                        onPressed: () {},
                                                        child: Text("Done", style: TextStyle(color: appColor)),
                                                      ),
                                                      FlatButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text("Cancel Snooze", style: TextStyle(color: Colors.grey)),
                                                      ),
                                                    ],
                                                  ),
                                                ));
                                          });
                                    });
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.06,
                              top: MediaQuery.of(context).size.width * 0.09,
                            ),
                            decoration: BoxDecoration(
                              color: SWITCH_TRACK,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0) //         <--- border radius here
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
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.trash, color: Colors.white,),
                              onPressed: () {
//                      return Navigator.pushReplacement(
//                        context,
//                        MaterialPageRoute(builder: (context) => RevisedScreen()),
//                      );
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.06,
                              top: MediaQuery.of(context).size.width * 0.09,
                            ),
                            decoration: BoxDecoration(
                              color: SWITCH_TRACK,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0) //         <--- border radius here
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
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.archive, color: Colors.white,),
                              onPressed: () {
//                      return Navigator.pushReplacement(
//                        context,
//                        MaterialPageRoute(builder: (context) => RevisedScreen()),
//                      );
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.06,
                              top: MediaQuery.of(context).size.width * 0.09,
                            ),
                            decoration: BoxDecoration(
                              color: SWITCH_TRACK,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0) //         <--- border radius here
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
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: IconButton(
                              icon: Icon(Icons.edit, color: Colors.white,),
                              onPressed: () {
//                      return Navigator.pushReplacement(
//                        context,
//                        MaterialPageRoute(builder: (context) => RevisedScreen()),
//                      );
                              },
                            ),
                          ),
                        ],
                        secondaryActions: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.06,
                              top: MediaQuery.of(context).size.width * 0.09,
                            ),
                            decoration: BoxDecoration(
                              color: SWITCH_TRACK,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0) //         <--- border radius here
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
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: IconButton(
                              icon: Icon(Icons.alarm, color: Colors.white,),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                          builder: (context, setState) {
                                            return AlertDialog(
                                                backgroundColor: backgroundColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                                title: Center(
                                                  child: Text(
                                                    'Snooze Details',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14.0),
                                                  ),
                                                ),
                                                content: Container(
                                                  color: backgroundColor,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                        EdgeInsets.only(right: MediaQuery.of(context).size.width * .55),
                                                        child: Text("Until", style: TextStyle(color: Colors.grey, fontSize: 14.0),),),
                                                      SizedBox(height: 10,),
                                                      Row(
                                                        children: <Widget>[
                                                          Container(
                                                            width:27.0,
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                              boxShadow: <BoxShadow>[
                                                                BoxShadow(
                                                                  color: backgroundColor.withOpacity(0.1),
                                                                  blurRadius: 1,
                                                                  offset: Offset(0, 2),
                                                                ),
                                                              ],
                                                            ),
                                                            margin: EdgeInsets.only(
                                                              right: 8,
                                                            ),
                                                            child: FloatingActionButton(
                                                              heroTag: null,
                                                              onPressed: () {},
                                                              backgroundColor: Colors.white,
                                                              child: Text("Sat", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                                                            ),),
                                                          Container(
                                                            width:27.0,
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                              boxShadow: <BoxShadow>[
                                                                BoxShadow(
                                                                  color: backgroundColor.withOpacity(0.1),
                                                                  blurRadius: 1,
                                                                  offset: Offset(0, 2),
                                                                ),
                                                              ],
                                                            ),
                                                            margin: EdgeInsets.only(
                                                              right: 8,
                                                            ),
                                                            child: FloatingActionButton(
                                                              heroTag: null,
                                                              onPressed: () {},
                                                              backgroundColor: Colors.white,
                                                              child: Text("Sun", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                                                            ),),
                                                          Container(
                                                            width:25.0,
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                              boxShadow: <BoxShadow>[
                                                                BoxShadow(
                                                                  color: backgroundColor.withOpacity(0.1),
                                                                  blurRadius: 1,
                                                                  offset: Offset(0, 2),
                                                                ),
                                                              ],
                                                            ),
                                                            margin: EdgeInsets.only(
                                                              right: 8,
                                                            ),
                                                            child: FloatingActionButton(
                                                              heroTag: null,
                                                              onPressed: () {},
                                                              backgroundColor: appColor,
                                                              child: Text("Mon", style: TextStyle(color: Colors.white, fontSize: 10.0),),
                                                            ),),
                                                          Container(
                                                            width:25.0,
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                              boxShadow: <BoxShadow>[
                                                                BoxShadow(
                                                                  color: backgroundColor.withOpacity(0.1),
                                                                  blurRadius: 1,
                                                                  offset: Offset(0, 2),
                                                                ),
                                                              ],
                                                            ),
                                                            margin: EdgeInsets.only(
                                                              right: 8,
                                                            ),
                                                            child: FloatingActionButton(
                                                              heroTag: null,
                                                              onPressed: () {},
                                                              backgroundColor: Colors.white,
                                                              child: Text("Tue", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                                                            ),),
                                                          Container(
                                                            width:25.0,
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                              boxShadow: <BoxShadow>[
                                                                BoxShadow(
                                                                  color: backgroundColor.withOpacity(0.1),
                                                                  blurRadius: 1,
                                                                  offset: Offset(0, 2),
                                                                ),
                                                              ],
                                                            ),
                                                            margin: EdgeInsets.only(
                                                              right: 8,
                                                            ),
                                                            child: FloatingActionButton(
                                                              heroTag: null,
                                                              onPressed: () {},
                                                              backgroundColor: Colors.white,
                                                              child: Text("Wed", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                                                            ),),
                                                          Container(
                                                            width:25.0,
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                              boxShadow: <BoxShadow>[
                                                                BoxShadow(
                                                                  color: backgroundColor.withOpacity(0.1),
                                                                  blurRadius: 1,
                                                                  offset: Offset(0, 2),
                                                                ),
                                                              ],
                                                            ),
                                                            margin: EdgeInsets.only(
                                                              right: 8,
                                                            ),
                                                            child: FloatingActionButton(
                                                              heroTag: null,
                                                              onPressed: () {},
                                                              backgroundColor: Colors.white,
                                                              child: Text("Thu", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                                                            ),),
                                                          Container(
                                                            width:25.0,
                                                            height: 25.0,
                                                            decoration: BoxDecoration(
                                                              boxShadow: <BoxShadow>[
                                                                BoxShadow(
                                                                  color: backgroundColor.withOpacity(0.1),
                                                                  blurRadius: 1,
                                                                  offset: Offset(0, 2),
                                                                ),
                                                              ],
                                                            ),
                                                            child: FloatingActionButton(
                                                              heroTag: null,
                                                              onPressed: () {},
                                                              backgroundColor: Colors.white,
                                                              child: Text("Fri", style: TextStyle(color: Colors.grey, fontSize: 10.0),),
                                                            ),),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            top: MediaQuery.of(context).size.height * .03),
                                                      ),
                                                      FlatButton(
                                                        onPressed: () {},
                                                        child: Text("Done", style: TextStyle(color: appColor)),
                                                      ),
                                                      FlatButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text("Cancel Snooze", style: TextStyle(color: Colors.grey)),
                                                      ),
                                                    ],
                                                  ),
                                                ));
                                          });
                                    });
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.06,
                              top: MediaQuery.of(context).size.width * 0.09,
                            ),
                            decoration: BoxDecoration(
                              color: SWITCH_TRACK,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0) //         <--- border radius here
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
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.trash, color: Colors.white,),
                              onPressed: () {
//                      return Navigator.pushReplacement(
//                        context,
//                        MaterialPageRoute(builder: (context) => RevisedScreen()),
//                      );
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.06,
                              top: MediaQuery.of(context).size.width * 0.09,
                            ),
                            decoration: BoxDecoration(
                              color: SWITCH_TRACK,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0) //         <--- border radius here
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
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.archive, color: Colors.white,),
                              onPressed: () {
//                      return Navigator.pushReplacement(
//                        context,
//                        MaterialPageRoute(builder: (context) => RevisedScreen()),
//                      );
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.06,
                              top: MediaQuery.of(context).size.width * 0.09,
                            ),
                            decoration: BoxDecoration(
                              color: SWITCH_TRACK,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0) //         <--- border radius here
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
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: IconButton(
                              icon: Icon(Icons.edit, color: Colors.white,),
                              onPressed: () {
//                      return Navigator.pushReplacement(
//                        context,
//                        MaterialPageRoute(builder: (context) => RevisedScreen()),
//                      );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
