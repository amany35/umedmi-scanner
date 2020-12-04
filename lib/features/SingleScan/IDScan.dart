import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umedmiscanner/features/SingleScan/SingleScan.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/SingleScan/models/image_model.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:image/image.dart' as Img;
import 'package:async/async.dart';
import 'package:skeleton_text/skeleton_text.dart';


bool isFrontClicked = false;

bool isbackClicked = false;

bool isCheckedFirstSeen = false;

class IDScan extends StatefulWidget {
  @override
  _IDScanState createState() => _IDScanState();
}

class _IDScanState extends State<IDScan> {


  bool firstSeen = false;

  bool scannedImageHasError = false;

  Image_Model image_model = new Image_Model();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //id_images.clear();

      //checkFirstSeen();

  }

  Future checkFirstSeen() async {
    //SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSeen = (prefs.getBool('idscan_intro_seen') ?? false);

    print("Checking ..");

    if (isSeen) {

      setState(() {

        firstSeen = isSeen;

      });

    } else {
      await prefs.setBool('idscan_intro_seen', true);

      setState(() {

        firstSeen = isSeen;

      });

    }

  }


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    // Future<Image_Model> fetchImage(imageUrl) async {
    //
    //   var image = Img.decodeImage(File(imageUrl).readAsBytesSync());
    //
    //   var thumbnail = Img.copyResize(image, width: 120);
    //
    //
    //   var tempDir = await getTemporaryDirectory();
    //
    //   File imageFile = await File('${tempDir.path}/img_${DateTime.now().millisecondsSinceEpoch}.jpg')
    //     ..writeAsBytesSync(Img.encodeJpg(thumbnail));
    //
    //   print(imageFile.toString()+"888888888");
    //
    //   var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    //   // get file length
    //   var length = await imageFile.length();
    //
    //   // string to uri
    //   var uri = Uri.parse("http://3.139.34.137:8080/SCAN");
    //
    //   // create multipart request
    //   var request = new http.MultipartRequest("POST", uri);
    //   // multipart that takes file
    //   var multipartFile = new http.MultipartFile("Image", stream, length,
    //       filename: basename(imageFile.path));
    //   // add file to multipart
    //   request.files.add(multipartFile);
    //
    //   http.Response response = await http.Response.fromStream(await request.send());
    //   print("Result: ${response.statusCode}");
    //
    //   image_model = await Image_Model.fromJson(json.decode(response.body));
    //
    //   return image_model;
    //
    //
    // }
    //
    //
    // getImageFile(strURL) async {
    //
    //   print("7777777777");
    //
    //   final http.Response responseData = await http.get(strURL);
    //   var uint8list = responseData.bodyBytes;
    //   var buffer = uint8list.buffer;
    //   ByteData byteData = ByteData.view(buffer);
    //   var tempDir = await getTemporaryDirectory();
    //   File file = await File('${tempDir.path}/img_${DateTime.now().millisecondsSinceEpoch}.jpg').writeAsBytes(
    //       buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    //
    //   print("5555555555");
    //   return file;
    //
    // }
    //
    //
    //
    // getImage(image) async {
    //
    //
    //   Image_Model Imagemodel = await fetchImage(image);
    //
    //   File ImageFile = await getImageFile("http://3.139.34.137:8080${Imagemodel.imageUrl}");
    //
    //   print(ImageFile.path+"12255555555555");
    //
    //   return ImageFile;
    //
    // }


    frontId(){

      return GestureDetector(
          onTap: (){

            setState(() {

              isFrontClicked=true;

              isbackClicked=false;

            });

          },
          child:Container(
            height: height/5,
            width: width/2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(20.0)  //                 <--- border radius here
              ),
              image: DecorationImage(
                image: AssetImage("images/id-card.png"),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
          ));

    }


    backId(){

      return GestureDetector(
          onTap: (){ setState(() {

            isbackClicked=true;

            isFrontClicked=false;

          });},
          child: Container(
            height: height/5,
            width: width/2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(20.0)  //                 <--- border radius here
              ),
              image: DecorationImage(
                image: AssetImage("images/credit-card Back.png"),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
          ));

    }


   idscan_intro_seen(){
      return Padding(
        padding: EdgeInsets.symmetric(vertical: height/100),
        child: Stack(
          children: [
            Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [

                      id_images[0].contains("http")?
                      Container(
                        height: height/5,
                        width: width/2,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(
                              Radius.circular(20.0)  //                 <--- border radius here
                          ),
                          image: DecorationImage(
                            image: NetworkImage(id_images[0]),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ):
                      id_images[0]!=""?Container(
                                  height: height/5,
                                  width: width/2,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)  //                 <--- border radius here
                                    ),
                                    image: DecorationImage(
                                      image: FileImage(File(id_images[0])),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: BoxShape.rectangle,
                                  ),
                             ):
                      frontId(),

                      id_images[0]!=""?Positioned(
                        left: width/30,
                        bottom: height/7,
                        child: Container(
                          width: width/15,
                          height: height/25,
                          decoration: new BoxDecoration(
                            color: fontColor,
                            border: Border.all(
                                color: fontColor,
                                width: 0.0
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(50.0)  //                 <--- border radius here
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: searchbarIconColor.withOpacity(0.8),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2), // changes position of shadow
                              ),
                            ],),
                          child: GestureDetector(
                              onTap: (){
                                id_images.removeAt(0);
                                id_images.insert(0,"");

                                setState(() {

                                });

                              },
                              child: Icon(Icons.delete,color: cancelBtnColor,size: width/20,)),
                        ),
                      ):Text("")


                    ],
                  ),
                  //child:Image.asset("images/id-card.png",width: width/2.5,)),
                  // child: id_images[0]==""?Image.asset("images/id-card.png",width: width/2.5,):
                  // Image.file(File(id_images[0].toString()),width: width,height: height/5,)),
                  //SizedBox(height: height/100,),
                  Text("Scan ID FrontSide",style: TextStyle(color: fontColor.withOpacity(.7),fontSize: 14,fontWeight: FontWeight.w800),),


                  SizedBox(height: height/80,),

                  Stack(
                    children: [

                      id_images[1].contains("http")?
                      Container(
                        height: height/5,
                        width: width/2,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(
                              Radius.circular(20.0)  //                 <--- border radius here
                          ),
                          image: DecorationImage(
                            image: NetworkImage(id_images[1]),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ):id_images[1]!=""?Container(
                        height: height/5,
                        width: width/2,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(
                              Radius.circular(20.0)  //                 <--- border radius here
                          ),
                          image: DecorationImage(
                            image: FileImage(File(id_images[1])),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ):

                        backId(),

                      id_images[1]!=""?Positioned(
                        left: width/30,
                        bottom: height/7,
                        child: Container(
                          width: width/15,
                          height: height/25,
                          decoration: new BoxDecoration(
                            color: fontColor,
                            border: Border.all(
                                color: fontColor,
                                width: 0.0
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(50.0)  //                 <--- border radius here
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: searchbarIconColor.withOpacity(0.8),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2), // changes position of shadow
                              ),
                            ],),
                          child: GestureDetector(
                              onTap: (){
                                id_images.removeAt(1);
                                id_images.insert(1,"");

                                setState(() {

                                });

                              },
                              child: Icon(Icons.delete,color: cancelBtnColor,size: width/20,)),
                        ),
                      ):Text("")
                    ],
                  ),
                  //SizedBox(height: height/100,),
                  Text("Scan ID BackSide",style: TextStyle(color: fontColor.withOpacity(.7),fontSize: 14,fontWeight: FontWeight.w800),),

                ],
              ),
            ),

            Align(
                alignment:Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: new BoxDecoration(
                      color: fontColor.withOpacity(.5),
                      border: Border.all(
                          color: fontColor.withOpacity(.5),
                          width: 0.0
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(15.0)  //                 <--- border radius here
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: accentColor.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Text("Trail",
                        style: TextStyle(color: accentColor,fontSize: 12),
                      ),
                    ),


                  ),
                )
            ),


          ],
        ),
      );
   }


    idscan_intro_notseen(){

      return Padding(

        padding: EdgeInsets.symmetric(vertical: height/100),

        child: Center(

          child: Column(

            children: [

              Image.asset("images/id_scan_animation2.gif",width: width/1.8,),


              Container(
                width: width/2,
                child: Text("You can upload the front/back national id photo from gallery"
                    " or capture it directly with camera by clicking on the front/back icon."
                  ,style: TextStyle(fontSize: 12,color: Colors.black54),),
              ),

          SizedBox(height: height/40,),

          GestureDetector(
            onTap: (){

              setState(() {

                firstSeen=true;

              });

            },
            child: Container(
              width: width/4,
              height: height/15,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(
                    Radius.circular(50.0)  //                 <--- border radius here
                ),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],),

              child: Text("Got it",style: TextStyle(fontSize: 12,color: accentColor),),

            ),
          ),



            ],


          ),

        )
      );


    }

    return Scaffold(
        backgroundColor: accentColor,
        //body: !firstSeen && id_images[0]=="" && id_images[1]==""?idscan_intro_notseen():idscan_intro_seen(),
        body:idscan_intro_seen(),

    );
  }
}
