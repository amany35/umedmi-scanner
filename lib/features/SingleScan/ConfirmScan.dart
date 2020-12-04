import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';
import 'package:umedmiscanner/features/SingleScan/AddDocumentDetails.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'SingleScan.dart';
import 'IDScan.dart';

import 'UploadImage.dart';
import 'SpecialtiesScan.dart';


class ConfirmScan extends StatefulWidget {
  final File image;

  const ConfirmScan({Key key, this.image}) : super(key: key);

  @override
  _ConfirmScanState createState() => _ConfirmScanState();
}

class _ConfirmScanState extends State<ConfirmScan> {

  File imageFile;
  LoadingDialog loadingDialog;
  bool chooseSpecialties = false, chooseOrthopedics = false;
  String ocrText = "*Some error happened.. try again later";

  Future<Null> _customizationImage(String pageName) async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: pageName,
            toolbarColor: DarkAppColor,
            toolbarWidgetColor: Colors.white,
            activeControlsWidgetColor: appColor,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: pageName,
        ));
    if (croppedFile != null) {
      setState(() {
        imageFile = croppedFile;
      });
    } else {
      setState(() {
        imageFile = imageFile;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      imageFile = widget.image;
    });
  }

  Future<void> hideDialog() async {
    if (loadingDialog != null && loadingDialog.isShowing()) {
      Navigator.of(context).pop();
      loadingDialog = null;
    }
  }

  void showLoadingDialog() async {
    loadingDialog = LoadingDialog();
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => loadingDialog);
  }

  void showOcrDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: Container(
                padding: EdgeInsets.all(5,),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 10.0), //(x,y)
                        blurRadius: 15.0, // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListView(
                    children: [
                      Text(
                        ocrText,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: titleColor, fontSize: 10),
                      ),
                    ],
                  )),
              content: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 31,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: cancelBtnColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0, 10.0), //(x,y)
                            blurRadius: 15.0, // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.cancel,
                            color: accentColor,
                            size: 10,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Delete",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: accentColor, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 31,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: callnowlBtnColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0, 10.0), //(x,y)
                            blurRadius: 15.0, // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.check,
                            color: accentColor,
                            size: 10,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Approve",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: accentColor, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  showslidingbottomSheet(route, width, height) {
    showSlidingBottomSheet(context, builder: (context) {
      return SlidingSheetDialog(
        elevation: 0,
        cornerRadius: 16,
        color: accentColor,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.4, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return Container(
            color: accentColor,
            height: height,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 50, vertical: height / 40),
                child: route,
              ),
            ),
          );
        },
      );
    });
  }

  _handleOcr() async {
    Map checkOcr = await uploadImage(imageFile, ocrURL);
    hideDialog();
    setState(() {
      ocrText = checkOcr['text'];
    });
    print(" checkOcr " + ocrText);
    showOcrDialog();
  }


  handleLooksGood(){

    if(selectedOption!="ID Scan"){

      images.remove(widget.image.path);
      images.add(imageFile.path);

      setState(() {

      });

    }

    else if(selectedOption=="ID Scan"){


      int index = id_images.indexOf(widget.image.path);
      id_images.removeAt(index);
      id_images.insert(index, imageFile.path);
      print(index);

      print(id_images[0]);

      setState(() {

        isFrontClicked=false;
        isbackClicked=false;


      });

    }

    else if(selectedOption=="Specialties"){

      covid_image=imageFile.path;

      setState(() {

        isCovidClicked = false;

      });

    }


    Navigator.pop(context);

  }

  confirmScanButtons({bool isMainButton, width, height}) {
    return GestureDetector(
      onTap: () {
        isMainButton
            ? handleLooksGood()
            : Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.only(top: height / 50, bottom: height / 80),
        child: Container(
            width: isMainButton ? width / 1.3 : width / 2.5,
            height: height / 15,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isMainButton ? primaryColor : accentColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border:
                  Border.all(color: isMainButton ? accentColor : primaryColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(0.0, 5.0), //(x,y)
                  blurRadius: 10.0, // changes position of shadow
                ),
              ],
            ),
            child: Center(
                child: Text(
              isMainButton ? "Looks Good!" : "Re-Scan",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: isMainButton ? accentColor : primaryColor),
            ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: chooseOrthopedics
            ? null
            : AppBar(
                backgroundColor: fontColor,
                toolbarHeight: height / 12,
                leading: GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: width / 30,
                    color: accentColor,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: height / 50,
                        bottom: height / 50,
                        left: width / 50),
                    child: Container(
                      color: fontColor,
                      width: width / 1.2,
                      height: height / 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _customizationImage("Crop");
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.crop,
                                  color: accentColor,
                                  size: width / 30,
                                ),
                                Text(
                                  "Crop",
                                  style: TextStyle(
                                      fontSize: 10, color: accentColor),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width / 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              _customizationImage("Scale");
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.compare_arrows,
                                  color: accentColor,
                                  size: width / 30,
                                ),
                                Text(
                                  "Scale",
                                  style: TextStyle(
                                      fontSize: 10, color: accentColor),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width / 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              showLoadingDialog();
                              _handleOcr();
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search,
                                  color: accentColor,
                                  size: width / 30,
                                ),
                                Text(
                                  "OCR",
                                  style: TextStyle(
                                      fontSize: 10, color: accentColor),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width / 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                chooseSpecialties = !chooseSpecialties;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.announcement,
                                  color: accentColor,
                                  size: width / 30,
                                ),
                                Text(
                                  "Analyze",
                                  style: TextStyle(
                                      fontSize: 10, color: accentColor),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width / 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              _customizationImage("Rotate");
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.rotate_90_degrees_ccw,
                                  color: accentColor,
                                  size: width / 30,
                                ),
                                Text(
                                  "Rotate",
                                  style: TextStyle(
                                      fontSize: 10, color: accentColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              chooseSpecialties = false;
              chooseOrthopedics = false;
            });
          },
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: imageFile == null
                    ? Text('No image selected.')
                    : Image.file(imageFile),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    confirmScanButtons(
                        isMainButton: true, width: width, height: height),
                    confirmScanButtons(
                        isMainButton: false, width: width, height: height),
                  ],
                ),
              ),
              chooseSpecialties
                  ? Center(
                      child: ClipRect(
                        // <-- clips to the 200x200 [Container] below
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5.0,
                            sigmaY: 5.0,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: width,
                            height: height,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      chooseSpecialties = false;
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: height * 0.25,
                                        ),
                                        decoration: BoxDecoration(
                                          color: appColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
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
                                        width: width * 0.4,
                                        height: height * 0.12,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: backgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomLeft: Radius.circular(20.0),
                                              bottomRight: Radius.circular(
                                                  50.0), //         <--- border radius here
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset:
                                                    Offset(0.0, 1.0), //(x,y)
                                                blurRadius: 1.0,
                                              ),
                                            ],
                                          ),
                                          // color: Colors.white,
                                          alignment: Alignment.center,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.08,
                                                    top: height * .04),
                                                child: Text(
                                                  "COVID- 19 Detector",
                                                  style: TextStyle(
                                                      color: titleColor,
                                                      fontSize: 14.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: width * 0.3,
                                        top: height * 0.218,
                                        child: Image(
                                          image: AssetImage(
                                              'images/coronavirus.png'),
                                          width: 65,
                                          height: 64,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      chooseSpecialties = false;
                                      chooseOrthopedics = true;
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: height * 0.05,
                                        ),
                                        decoration: BoxDecoration(
                                          color: appColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
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
                                        width: width * 0.4,
                                        height: height * 0.12,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: backgroundColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomLeft: Radius.circular(20.0),
                                              bottomRight: Radius.circular(
                                                  50.0), //         <--- border radius here
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset:
                                                    Offset(0.0, 1.0), //(x,y)
                                                blurRadius: 1.0,
                                              ),
                                            ],
                                          ),
                                          // color: Colors.white,
                                          alignment: Alignment.center,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.08,
                                                    top: height * .04),
                                                child: Text(
                                                  "Orthopedics Fracture Detector",
                                                  style: TextStyle(
                                                      color: titleColor,
                                                      fontSize: 14.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: width * 0.3,
                                        top: height * 0.02,
                                        child: Image(
                                          image: AssetImage(
                                              'images/brokenbone.png'),
                                          width: 65,
                                          height: 64,
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
                    )
                  : Container(),
              chooseOrthopedics
                  ? Center(
                      child: ClipRect(
                        // <-- clips to the 200x200 [Container] below
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5.0,
                            sigmaY: 5.0,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: width,
                            height: height,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: height * 0.05,
                                  ),
                                  decoration: BoxDecoration(
                                    color: accentColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            30.0) //         <--- border radius here
                                        ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 1.0), //(x,y)
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Image(
                                        image:
                                            AssetImage('images/brokenbone.png'),
                                        width: 65,
                                        height: 64,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Orthopedics",
                                            style: TextStyle(
                                                color: appColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25.0),
                                          ),
                                          Text(
                                            "Choose the relevant Ortho-Filter:",
                                            style: TextStyle(
                                                color: titleColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      chooseSpecialties = false;
                                      chooseOrthopedics = false;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: height * 0.15,
                                    ),
                                    decoration: BoxDecoration(
                                      color: appColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
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
                                    width: width * 0.4,
                                    height: height * 0.12,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: height * .01),
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(
                                              50.0), //         <--- border radius here
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
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: <Widget>[
                                          Image(
                                            image: AssetImage(
                                                'images/forearm.png'),
                                            width: 52,
                                            height: 56,
                                          ),
                                          Text(
                                            "Forearm",
                                            style: TextStyle(
                                                color: titleColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      chooseSpecialties = false;
                                      chooseOrthopedics = false;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: height * 0.05,
                                    ),
                                    decoration: BoxDecoration(
                                      color: appColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
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
                                    width: width * 0.4,
                                    height: height * 0.12,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: height * .01),
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(
                                              50.0), //         <--- border radius here
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
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: <Widget>[
                                          Image(
                                            image: AssetImage(
                                                'images/elbowpads.png'),
                                            width: 52,
                                            height: 56,
                                          ),
                                          Text(
                                            "Elbow",
                                            style: TextStyle(
                                                color: titleColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      chooseSpecialties = false;
                                      chooseOrthopedics = false;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: height * 0.05,
                                    ),
                                    decoration: BoxDecoration(
                                      color: appColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
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
                                    width: width * 0.4,
                                    height: height * 0.12,
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(top: height * .01),
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(
                                              50.0), //         <--- border radius here
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
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "Foot - Soon",
                                        style: TextStyle(
                                            color: titleColor, fontSize: 9.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ));
  }
}
