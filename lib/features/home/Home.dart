import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:umedmiscanner/common/CustomTextWidget.dart';
import 'package:umedmiscanner/features/SingleScan/SingleScan.dart';
import 'package:umedmiscanner/features/scan/AddFileScreen.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

import 'model/DashboardResponse.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  PermissionStatus _status;
  String totalPatients="",totalSharedPatients="",totalCriticalPatients="",
          totalPrescriptions="",totalDocumentsToBeRevised="";
  // File _image;
  navigateToAddFile(File image) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddFileScreen(image)),
    );
  }

  @override
  void initState() {
    super.initState();
    PermissionHandler()
        .checkPermissionStatus(PermissionGroup.camera)
        .then(_updateStatus);
  }

  Future<File> getImage(ImageSource source) async {
    return ImagePicker.pickImage(source: source);

  }


  _handleDashboardSuccess(DashboardResponse data) {}

  _handleDashboardError(FormatException e) {}

  void showSourceDialog(){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take Photo'),
                    onTap: _askPermission,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select Image From Gallery'),
                    onTap: imageSelectorGallery,
                  ),
                ],
              ),
            ),
          );
        });
//    showCupertinoModalPopup(
//      context: context,
//      builder: (BuildContext context) => CupertinoActionSheet(
//        title:  CustomTextWidget(
//          text: "Choose",
//          textSize: 18.0,
//          txtColor: appColor,
//          fontWeight:  FontWeight.bold,
//        ),
//        actions: <Widget>[
//          CupertinoActionSheetAction(
//            child: CustomTextWidget(
//              text:"Open Camera",
//              textSize: 16.0,
//              txtColor: appColor,
//              fontWeight:  FontWeight.bold,
//            ),
//            onPressed: () {
////              getImage(ImageSource.camera).then((image) {
////                navigateToAddFile(image);
////              });
//              _askPermission;
//              print("caaaam");
//              //    Navigator.pop(context);
//            },
//          ),
//          CupertinoActionSheetAction(
//            child: CustomTextWidget(
//              text: "Open Gallery",
//              textSize: 16.0,
//              txtColor: appColor,
//              fontWeight:  FontWeight.bold,
//            ),
//            onPressed: () {
//              //    getImage(ImageSource.gallery);
////              getImage(ImageSource.gallery).then((image) {
////                navigateToAddFile(image);
////
////              });
//              imageSelectorGallery;
//              print("gallerryyyyyy");
//            },
//          )
//        ],
//      ),
//    );
  }

  void _askPermission() {
    PermissionHandler()
        .requestPermissions([PermissionGroup.camera]).then(_onStatusRequested);
  }

  void _onStatusRequested(Map<PermissionGroup, PermissionStatus> value) {
    final status = value[PermissionGroup.camera];
    if (status == PermissionStatus.granted) {
      imageSelectorCamera();
    } else {
      _updateStatus(status);
    }
  }

  _updateStatus(PermissionStatus value) {
    if (value != _status) {
      setState(() {
        _status = value;
      });
    }
  }

  void imageSelectorCamera() async {
    Navigator.pop(context);
    var imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
  }

  void imageSelectorGallery() async {
    Navigator.pop(context);
    var imageFile1 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //showSourceDialog();
          images.clear();

          id_images.clear();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SingleScan()),
          );

        },
        backgroundColor: WHITE,
        child: Tab(
          child: Image.asset("images/scan.png"),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child:   Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          image: AssetImage('images/home.png'),
                          width: MediaQuery.of(context).size.width*0.1,
                          height: MediaQuery.of(context).size.height *0.17,
                        )
                    ),
                  ],
                ),
                Divider(),

                Text("Your Dashboard",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex:1,
                      child: Container(
                        height: MediaQuery.of(context).size.height *0.15,
                        color: Colors.transparent,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height *0.15,
//                   width: double.infinity,
                            color:totalPatientColor,
                            child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Image(
                                          image: AssetImage( 'images/patientInfo.png'),
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      Align(alignment: Alignment.centerLeft,child: new Text("total Patients",style:TextStyle(color: WHITE))),
                                      Align(alignment: Alignment.bottomLeft,child: new Text(totalPatients,style:TextStyle(color: WHITE,fontWeight:FontWeight.bold,fontSize: 16))),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 50,),
                    Expanded(
                      flex:1,
                      child: Container(
                        height: MediaQuery.of(context).size.height *0.15,
                        color: Colors.transparent,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height *0.15,
//                   width: double.infinity,
                            color:totalSharedColor,
                            child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Image(
                                          image: AssetImage( 'images/shared.png'),
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      Align(alignment: Alignment.centerLeft,child: new Text("total Shared Patients",style:TextStyle(color: WHITE))),
                                      Align(alignment: Alignment.bottomLeft,child: new Text(totalSharedPatients,style:TextStyle(color: WHITE,fontWeight:FontWeight.bold,fontSize: 16))),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex:1,
                      child: Container(
                        height: MediaQuery.of(context).size.height *0.15,
                        color: Colors.transparent,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height *0.15,
//                   width: double.infinity,
                            color:criticalColor,
                            child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Image(
                                          image: AssetImage( 'images/critical.png'),
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      Align(alignment: Alignment.centerLeft,child: new Text("Total Critical",style:TextStyle(color: WHITE))),
                                      Align(alignment: Alignment.bottomLeft,child: new Text(totalCriticalPatients,style:TextStyle(color: WHITE,fontWeight:FontWeight.bold,fontSize: 16))),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 50,),
                    Expanded(
                      flex:1,
                      child: Container(
                        height: MediaQuery.of(context).size.height *0.15,
                        color: Colors.transparent,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height *0.15,
//                   width: double.infinity,
                            color:prescriptionColor,
                            child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Image(
                                          image: AssetImage( 'images/prespectionIcon.png'),
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      Align(alignment: Alignment.centerLeft,child: new Text("Total Prescriptions",style:TextStyle(color: WHITE))),
                                      Align(alignment: Alignment.bottomLeft,child: new Text(totalPrescriptions,style:TextStyle(color: WHITE,fontWeight:FontWeight.bold,fontSize: 16))),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex:1,
                      child: Container(
                        height: MediaQuery.of(context).size.height *0.157,
                        color: Colors.transparent,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height *0.15,
//                   width: double.infinity,
                            color:documentColor,
                            child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Image(
                                          image: AssetImage( 'images/folderIcon.png'),
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      Align(alignment: Alignment.centerLeft,child: new Text("Total Documents to Be Revised",style:TextStyle(color: WHITE))),
                                      Align(alignment: Alignment.bottomLeft,child: new Text(totalDocumentsToBeRevised,style:TextStyle(color: WHITE,fontWeight:FontWeight.bold,fontSize: 16))),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 50,),
                    Expanded(
                        flex:1,
                        child: Container(
                          height: MediaQuery.of(context).size.height *0.17,
                          color: Colors.transparent,


                        )
                    )
                  ],
                ),])
      ),
    ); }
}