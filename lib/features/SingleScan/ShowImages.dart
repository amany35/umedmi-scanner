import 'dart:io';

import 'package:camerakit/CameraKitController.dart';
import 'package:camerakit/CameraKitView.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:umedmiscanner/features/SingleScan/SingleScan.dart' as singlescan;

class ShowImages extends StatefulWidget {
  @override
  _ShowImagesState createState() => _ShowImagesState();
}

class _ShowImagesState extends State<ShowImages> {


  @override
  Widget build(BuildContext context) {


    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
        backgroundColor: accentColor,
        body: Stack(
          children: [

            Padding(
              padding: EdgeInsets.only(top: height/30),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text((singlescan.images.length>1)?"${singlescan.images.length} selected photos":
                "${singlescan.images.length} selected photo",style: TextStyle(fontSize: 15,color: fontColor,fontWeight: FontWeight.bold),),
              ),
            ),



            Padding(
              padding: EdgeInsets.only(top: height/15),
              child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: singlescan.images.map((image) {
                    return Scaffold(
                      backgroundColor: accentColor,
                      body: GridTile(
                          child: Stack(
                            children: [

                              Center(child: Image.file(File(image), fit: BoxFit.fill)),

                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  decoration: new BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: accentColor.withOpacity(.3),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: GestureDetector(

                                      onTap: (){

                                        singlescan.images.remove(image);

                                        setState(() {
                                        });

                                      },

                                      child: Icon(Icons.delete,color: cancelBtnColor,)),
                                ),
                              ),


                            ],
                          )),




                    );
                  }).toList()),
            ),
          ],
        ),

    );
  }
}