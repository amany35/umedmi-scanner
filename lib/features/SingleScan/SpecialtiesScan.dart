import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_better_camera/camera.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image/image.dart' as Img;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/SingleScan/AddDocumentDetails.dart';
import 'package:umedmiscanner/features/SingleScan/CameraExampleHome.dart';
import 'package:umedmiscanner/features/SingleScan/SingleScan.dart';
import 'package:umedmiscanner/features/SingleScan/models/CovidModel.dart';
import 'package:umedmiscanner/features/SingleScan/models/image_model.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:async/async.dart';


bool isCovidClicked = false;

class SpecialtiesScan extends StatefulWidget {
  @override
  _SpecialtiesScanState createState() => _SpecialtiesScanState();
}

class _SpecialtiesScanState extends State<SpecialtiesScan> with WidgetsBindingObserver{


  bool isScan = true;

  CovidModel covidModel = new CovidModel();

  @override
  void initState() {
    super.initState();

  }



  Future<CovidModel> fetchCovidData(imageUrl) async {

    print(imageUrl.toString()+"888888888");

    var image = Img.decodeImage(File(imageUrl).readAsBytesSync());

    var thumbnail = Img.copyResize(image, width: 120);

    var tempDir = await getTemporaryDirectory();

    File imageFile = await File('${tempDir.path}/img_${DateTime.now().millisecondsSinceEpoch}.jpg')
      ..writeAsBytesSync(Img.encodeJpg(thumbnail));

    print(imageFile.path+"pooooooo");

    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://3.139.30.245:5000/predict");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);
    // multipart that takes file
    var multipartFile = new http.MultipartFile("file", stream, length,
        filename: basename(imageFile.path));
    // add file to multipart
    request.files.add(multipartFile);

    http.Response response = await http.Response.fromStream(await request.send());
    print("Result: ${response.statusCode}");

    covidModel = await CovidModel.fromJson(json.decode(response.body));

    print(covidModel.organ);


    return covidModel;


  }


  String organData,statusData,diagnosisData;

  getDataSplitted(str){

    var resultStr = str.split(" , ");

    var organStr= resultStr[0].split(": ");

    organData = organStr[1];

    var statusStr= resultStr[1].split(": ");

    statusData = statusStr[1];

    var diagnosisStr= resultStr[2].split(": ");

    diagnosisData = diagnosisStr[1];

    print(diagnosisData+"   "+organData+"   "+statusData);
  }




  covidDataWidget(width,height){

    return  Padding(
      padding: EdgeInsets.only(bottom: height/50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width/10,
            height: height/5,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: searchbarIconColor.withOpacity(.5),
                  width: 2.0
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(0.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(0.0),
              ),
            ),

            child: Image.asset("images/ai.png",color: primaryColor,width: width/30,),

          ),


          Container(
            width: width/1.2,
            height: height/5,
            decoration: new BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide( //                    <--- top side
                  color: searchbarIconColor.withOpacity(.5),
                  width: 2.0,
                ),
                top: BorderSide( //                    <--- top side
                    color: searchbarIconColor.withOpacity(.5),
                    width: 2.0
                ),
                right: BorderSide( //                    <--- top side
                    color: searchbarIconColor.withOpacity(.5),
                    width: 2.0
                ),
              ),

            ),

            child:
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/50),
              child: FutureBuilder(
                future: fetchCovidData(covid_image),
                builder: (context, snapshot) {

                  //getDataSplitted("Organ: Lung , Status: Infected Lungs , Diagnosis: +ve COVID");

                  if(snapshot.hasData){

                    isScan = false;

                    print(snapshot.data);

                    //getDataSplitted(snapshot.data);

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text("Organ/Specialty :",style: TextStyle(color: primaryColor,fontSize: 12,fontWeight: FontWeight.bold),),

                            SizedBox(width: width/40,),

                            Text(covidModel.organ,style: TextStyle(color: fontColor,fontSize: 11,fontWeight: FontWeight.normal),),

                          ],
                        ),

                        Divider(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text("Status :",style: TextStyle(color: primaryColor,fontSize: 12,fontWeight: FontWeight.bold),),

                            SizedBox(width: width/40,),

                            Text(covidModel.status,style: TextStyle(color: fontColor,fontSize: 11,fontWeight: FontWeight.normal),),

                          ],
                        ),

                        Divider(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text("Diagnosis :",style: TextStyle(color: primaryColor,fontSize: 12,fontWeight: FontWeight.bold),),

                            SizedBox(width: width/40,),

                            Text(covidModel.diagnosis,style: TextStyle(color: fontColor,fontSize: 11,fontWeight: FontWeight.normal),),

                          ],
                        ),


                      ],

                    );


                  }

                  else if (snapshot.hasError){

                    isScan = false;

                    print ('Image error: ${snapshot.error.toString()}');

                    return Text('Oops, something went wrong',style: TextStyle(color: Colors.red,),);

                  }

                  else{

                    return SpinKitRing(
                      color: primaryColor,
                      size: width/10,
                    );

                  }



              }
            ),



          ),





          )],
      ),
    );

  }


  reScanButtons( width, height) {
    return GestureDetector(
      onTap: () {

        var covid_image_temp;

        setState(() {

          covid_image_temp = covid_image;

          covid_image="";

        });



        Future.delayed(Duration(milliseconds: 1), () {
          setState(() {

            print ("reloading ...");

            covid_image  =  covid_image_temp ;

            isScan = true;

          });
        });



      },
      child: Container(
            width:   width / 2.5,
            height: height / 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border:
              Border.all(color: primaryColor),
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
                  "Re-Scan",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(color: primaryColor,fontSize: 12),
                ))),

    );
  }



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;



    return Scaffold(
        backgroundColor: accentColor,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: height / 100),
          child: Center(

              child:covid_image != "" ?

              Column(

                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [


                  covidDataWidget(width,height),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){

                          setState(() {

                            covid_image="";

                          });

                        },
                        child: Container(
                          width: width/5,
                          height: height/25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: cancelBtnColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),

                            ),
                            boxShadow: [
                              BoxShadow(
                                color: searchbarIconColor,
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.close,color: accentColor,size: width/30,),
                              SizedBox(width: width/80,),
                              Text("Delete",textAlign: TextAlign.center,style: TextStyle(fontSize: 10,color: accentColor),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: width/30,),
                      GestureDetector(
                        onTap: (){


                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => AddDocumentDetails(image: File(covid_image),)
                          ));


                        },
                        child: Container(
                          width: width/5,
                          height: height/25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: callnowlBtnColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),

                            ),
                            boxShadow: [
                              BoxShadow(
                                color: searchbarIconColor,
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check,color: accentColor,size: width/30,),
                              SizedBox(width: width/80,),
                              Text("Approve",textAlign: TextAlign.center,style: TextStyle(fontSize: 10,color: accentColor),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),


                  !isScan?reScanButtons(width, height):Text(""),


                ],




              ) : Column(

            children: [
              SizedBox(height: 30,),

              GestureDetector(

                onTap: (){


                  setState(() {

                    isCovidClicked=true;

                  });


                },

                child: Stack(
                  children: [
                    Container(
                      width: width/2,
                      height: height/8,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],

                      ),
                    ),
                    Container(
                        width: width/2,
                        height: height/8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.only(

                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(50),
                              bottomLeft: Radius.circular(20)

                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],

                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "images/coronavirus.png",width: width/10,height: height/5,color: fontColor,),

                           Text(
                            "COVID- 19\nDetector",
                            style: TextStyle(color: titleColor, fontSize: 14
                            ),)

                            ],
                          ),
                        )),
                  ],
                ),
              ),

              SizedBox(height: 30,),

              GestureDetector(
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    barrierColor: Colors.black12.withOpacity(0.9), // background color
                    barrierDismissible: false, // should dialog be dismissed when tapped outside
//                    barrierLabel: "Dialog",label for barrier
                    transitionDuration: Duration(milliseconds: 400), // how long it takes to popup dialog after button click
                    pageBuilder: (_, __, ___) { // your widget implementation
                      return Material(
                        type: MaterialType.transparency,
                        child: SizedBox.expand( //// makes widget fullscreen
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height:50
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: height / 6,
                                    width: width / 1.1,

                                    child: Center(
                                        child: Column(
                                          children: [
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Orthopedics",
                                                  style: TextStyle(color: primaryColor, fontSize: 25
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "Choose the relevant Ortho-Filter:",
                                                style: TextStyle(color: fontColor, fontSize: 15
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),

                                    decoration: BoxDecoration(
                                      color: WHITE,
//                                    border: Border.all(color: SilverStartColor),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0) //
                                        //                 <--- border radius here
                                      ),
//              color: SilverStartColor,
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 50,
                                    child: Image.asset("images/brokenbone.png"),
                                  )
                                ],
                              ),
                              SizedBox(
                                  height:50
                              ),
                                  GestureDetector(
                                    onTap:(){
                                      //Go to Camera
                                    },
                                    child: Container(
                                      height: height / 9,
                                      width: width / 2,

                                      child: Center(
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 50,
                                              child: Image.asset("images/forearm.png"),
                                            ),
                                            Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Forearm",
                                                          style: TextStyle(color: fontColor, fontSize: 20
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                          ],
                                        ),
                                      ),

                                      decoration: BoxDecoration(
                                        color: WHITE,
//                                    border: Border.all(color: SilverStartColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0) //
                                          //                 <--- border radius here
                                        ),
//              color: SilverStartColor,
                                      ),
                                    ),
                                  ),
                              SizedBox(
                                  height:50
                              ),
                              Container(
                                height: height / 9,
                                width: width / 2,

                                child: Center(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 50,
                                        child: Image.asset("images/elbowpads.png"),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Elbow",
                                            style: TextStyle(color: fontColor, fontSize: 20
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                decoration: BoxDecoration(
                                  color: WHITE,
//                                    border: Border.all(color: SilverStartColor),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20.0) //
                                    //                 <--- border radius here
                                  ),
//              color: SilverStartColor,
                                ),
                              ),
                              SizedBox(
                                  height:50
                              ),
                              Container(
                                height: height / 9,
                                width: width / 2,

                                   child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Foot - Soon",
                                          style: TextStyle(color: fontColor, fontSize: 16
                                          ),
                                        ),
                                      ),
                                    ),

                                decoration: BoxDecoration(
                                  color: WHITE,
//                                    border: Border.all(color: SilverStartColor),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20.0) //
                                    //                 <--- border radius here
                                  ),
//              color: SilverStartColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Stack(
                  children: [

                          Container(
                            width: width/2,
                            height: height/8,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],

                            ),
                          ),
                          Container(
                              width: width/2,
                              height: height/8,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: accentColor,
                                borderRadius: BorderRadius.only(

                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(20)

                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],

                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/50),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      "images/brokenbone.png",width: width/10,height: height/5,color: fontColor,),

                                    Text(
                                      "Orthopedics Fracture\n          Detector",
                                      style: TextStyle(color: titleColor, fontSize: 14
                                      ),)

                                  ],
                                ),
                              )),
                        ],
                      ),



              ),
            ],
          )
          ),
        )

    );
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
