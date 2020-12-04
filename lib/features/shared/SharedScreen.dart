import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/common/CustomTextWidget.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientDataScreen.dart';
import 'package:umedmiscanner/features/home/drawer/circular_image.dart';
import 'package:umedmiscanner/features/scan/AddFileScreen.dart';
import 'package:umedmiscanner/features/scan/CustomDialog.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:image_picker/image_picker.dart';

import 'model/SharedPatientResponse.dart';


class SharedScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SharedScreenState();
  }
}

class _SharedScreenState extends State<SharedScreen> {
  File _image;
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  _handleSharedPatientSuccess(SharedPatientResponse data) {}

  _handleSharedPatientError(FormatException e) {}

  Future getImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);
    if(image != null) {
      setState(() {
        _image = image;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddFileScreen(_image)),
        );
      });
    }
  }



  void showSourceDialog(){
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title:  CustomTextWidget(
          text: "Choose",
          textSize: 18.0,
          txtColor: appColor,
          fontWeight:  FontWeight.bold,
        ),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: CustomTextWidget(
              text:"Open Camera",
              textSize: 16.0,
              txtColor: appColor,
              fontWeight:  FontWeight.bold,
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
              fontWeight:  FontWeight.bold,
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

    return       Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showSourceDialog();


        },
        backgroundColor: WHITE,
        child: Tab(
          child: Image.asset("images/scan.png"),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(6),
          child:   Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap:(){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                          title: "Add New Shared Patient",
                          description:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          buttonText: "Proceed",
                        ),
                      );
                    },
                      child: Text("+ Add New",style: TextStyle(color:appColor,fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
                Expanded(
                  child: Container(
                    height:MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height:MediaQuery.of(context).size.height*0.1,
//                            width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            onTap: (){
                              return Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PatientDataScreen()),
                              );
                            },
                            leading:Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: CircularImage(
                                NetworkImage(imageUrl),
                              ),
                            ),
                            title: Text("Diana Rockwell",style: TextStyle(color: titleColor),),
                            subtitle: Text("M.23.Diabetic"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: <Widget>[
                                Tab(
                                  child: Image.asset("images/sharedPatientsIcon.png"),
                                ),
                                Tab(
                                  child: Icon(Icons.bookmark),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height:MediaQuery.of(context).size.height*0.1,
//                            width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            onTap: (){
                              return Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PatientDataScreen()),
                              );
                            },
                            leading:Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: CircularImage(
                                NetworkImage(imageUrl),
                              ),
                            ),
                            title: Text("Diana Rockwell",style: TextStyle(color: titleColor),),
                            subtitle: Text("M.23.Diabetic"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: <Widget>[
                                Tab(
                                  child: Image.asset("images/sharedPatientsIcon.png"),
                                ),
                                Tab(
                                  child: Icon(Icons.bookmark),
                                ),
                              ],
                            ),
                          ),),
                        Container(
                          height:MediaQuery.of(context).size.height*0.1,
//                            width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            onTap: (){
                              return Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PatientDataScreen()),
                              );
                            },
                            leading:Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: CircularImage(
                                NetworkImage(imageUrl),
                              ),
                            ),
                            title: Text("Diana Rockwell",style: TextStyle(color: titleColor),),
                            subtitle: Text("M.23.Diabetic"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: <Widget>[
                                Tab(
                                  child: Image.asset("images/sharedPatientsIcon.png"),
                                ),
                                Tab(
                                  child: Icon(Icons.bookmark),
                                ),
                              ],
                            ),
                          ),),
                        Container(
                          height:MediaQuery.of(context).size.height*0.1,
//                            width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            onTap: (){
                              return Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PatientDataScreen()),
                              );
                            },
                            leading:Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: CircularImage(
                                NetworkImage(imageUrl),
                              ),
                            ),
                            title: Text("Diana Rockwell",style: TextStyle(color: titleColor),),
                            subtitle: Text("M.23.Diabetic"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: <Widget>[
                                Tab(
                                  child: Image.asset("images/sharedPatientsIcon.png"),
                                ),
                                Tab(
                                  child: Icon(Icons.bookmark),
                                ),
                              ],
                            ),
                          ),),
                        Container(
                          height:MediaQuery.of(context).size.height*0.1,
//                            width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            onTap: (){
                              return Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PatientDataScreen()),
                              );
                            },
                            leading:Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: CircularImage(
                                NetworkImage(imageUrl),
                              ),
                            ),
                            title: Text("Diana Rockwell",style: TextStyle(color: titleColor),),
                            subtitle: Text("M.23.Diabetic"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: <Widget>[
                                Tab(
                                  child: Image.asset("images/sharedPatientsIcon.png"),
                                ),
                                Tab(
                                  child: Icon(Icons.bookmark),
                                ),
                              ],
                            ),
                          ),),
                        Container(
                          height:MediaQuery.of(context).size.height*0.1,
//                            width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            onTap: (){
                              return Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PatientDataScreen()),
                              );
                            },
                            leading:Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: CircularImage(
                                NetworkImage(imageUrl),
                              ),
                            ),
                            title: Text("Diana Rockwell",style: TextStyle(color: titleColor),),
                            subtitle: Text("M.23.Diabetic"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: <Widget>[
                                Tab(
                                  child: Image.asset("images/sharedPatientsIcon.png"),
                                ),
                                Tab(
                                  child: Icon(Icons.bookmark),
                                ),
                              ],
                            ),
                          ),),
                      ],
                    ),
                  ),
                )
              ])
      ),
    ); }
}