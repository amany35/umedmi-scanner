import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:umedmiscanner/common/CustomTextWidget.dart';
import 'package:umedmiscanner/features/FoldersScreen/model/FoldersResponse.dart';
import 'package:umedmiscanner/features/scan/AddFileScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

import 'RevisedScreen/RevisedScreen.dart';
import 'model/NewFolderResponse.dart';


class FoldersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FoldersScreenState();
  }
}

class FoldersScreenState extends State<FoldersScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // File _image;
  navigateToAddFile(File image) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddFileScreen(image)),
    );
  }

  Future<File> getImage(ImageSource source) async {
    return ImagePicker.pickImage(source: source);

  }
  _handleFoldersSuccess(FoldersResponse data) {}

  _handleFoldersError(FormatException e) {}

  _handleNewFolderSuccess(NewFolderResponse data) {}
  void showSnack(String msg) async {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(msg)));
  }
  _handleNewFolderError(FormatException e) {
    showSnack(e.message);
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
              getImage(ImageSource.camera).then((image) {
                navigateToAddFile(image);
              });
              //    Navigator.pop(context);
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
              //    getImage(ImageSource.gallery);
              getImage(ImageSource.gallery).then((image) {
                navigateToAddFile(image);

              });
            },
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
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
          padding: const EdgeInsets.all(16.0),
          child:   ListView(
              children: <Widget>[
                Text("Hello Peter,",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex:1,
                        child: Column(
                          children: <Widget>[
                            Text("Here you will find a summary of all your stored files and shared activity.",style: TextStyle(
                                fontWeight: FontWeight.normal,fontSize: 12),maxLines: 3,),
                            SizedBox(height: 30,),
                            Row(
                              children: <Widget>[
                                Icon(Icons.person, size: 12,),
                                Text("30",style: TextStyle(fontSize: 10)),
                                SizedBox(width: 10,),
                                Icon(FontAwesomeIcons.comment, size: 12,),
                                Text("3",style: TextStyle(fontSize: 10)),
                                SizedBox(width: 10,),
                                Icon(FontAwesomeIcons.users, size: 12,),
                                Text("10",style: TextStyle(fontSize: 10)),
                                SizedBox(width: 10,),
                                Icon(FontAwesomeIcons.calendarAlt, size: 12,),
                                Text("12",style: TextStyle(fontSize: 10)),
                              ],
                            )
                          ],
                        )
                    ),
                    Expanded(
                        flex:1,
                        child:Image(
                          image: AssetImage('images/folders_illustration.png'),
                          width: MediaQuery.of(context).size.width*0.1,
                          height: MediaQuery.of(context).size.height *0.17,
                        )
                    ),
                  ],
                ),
                Divider(),

                Text("All Folders",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
//                          return Navigator.pushReplacement(
//                            context,
//                            MaterialPageRoute(builder: (context) => LoginScreen()),
//                          );
                      },
                      iconSize: 110,
                      icon: Image(
                        image: AssetImage('images/newFolder.png'),
                        width: 104,
                        height: 155,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
//                          return Navigator.pushReplacement(
//                            context,
//                            MaterialPageRoute(builder: (context) => LoginScreen()),
//                          );
                          },
                          iconSize: 70,
                          icon: Image(
                            image: AssetImage('images/archive.png'),
                            width: 92,
                            height: 75,
                          ),
                        ),
                        Text("Archive",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
//                          return Navigator.pushReplacement(
//                            context,
//                            MaterialPageRoute(builder: (context) => LoginScreen()),
//                          );
                          },
                          iconSize: 70,
                          icon: Image(
                            image: AssetImage('images/trash.png'),
                            width: 92,
                            height: 75,
                          ),
                        ),
                        Text("Trash",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 20,),
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                          return Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => RevisedScreen()),
                          );
                          },
                          iconSize: 70,
                          icon: Image(
                            image: AssetImage('images/to_be_revised.png'),
                            width: 92,
                            height: 70,
                          ),
                        ),
                        Text("To be Revised",style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
//                          return Navigator.pushReplacement(
//                            context,
//                            MaterialPageRoute(builder: (context) => LoginScreen()),
//                          );
                          },
                          iconSize: 70,
                          icon: Image(
                            image: AssetImage('images/prescriptions.png'),
                            width: 92,
                            height: 70,
                          ),
                        ),
                        Text("Prescription",style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
//                          return Navigator.pushReplacement(
//                            context,
//                            MaterialPageRoute(builder: (context) => LoginScreen()),
//                          );
                          },
                          iconSize: 70,
                          icon: Image(
                            image: AssetImage('images/investigations.png'),
                            width: 92,
                            height: 70,
                          ),
                        ),
                        Text("Investigation",style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 20,),
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
//                          return Navigator.pushReplacement(
//                            context,
//                            MaterialPageRoute(builder: (context) => LoginScreen()),
//                          );
                          },
                          iconSize: 70,
                          icon: Image(
                            image: AssetImage('images/interventions.png'),
                            width: 92,
                            height: 70,
                          ),
                        ),
                        Text("Interventions",style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
//                          return Navigator.pushReplacement(
//                            context,
//                            MaterialPageRoute(builder: (context) => LoginScreen()),
//                          );
                          },
                          iconSize: 70,
                          icon: Image(
                            image: AssetImage('images/referrals.png'),
                            width: 92,
                            height: 70,
                          ),
                        ),
                        Text("Referrals",style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(width: 15,),
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
//                          return Navigator.pushReplacement(
//                            context,
//                            MaterialPageRoute(builder: (context) => LoginScreen()),
//                          );
                          },
                          iconSize: 70,
                          icon: Image(
                            image: AssetImage('images/reports.png'),
                            width: 92,
                            height: 70,
                          ),
                        ),
                        Text("Reports",style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),

              ])
      ),
    ); }
}