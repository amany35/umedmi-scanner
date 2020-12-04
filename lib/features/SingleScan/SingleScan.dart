import 'dart:convert';
import 'dart:io';
import 'package:camerakit/CameraKitController.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_better_camera/camera.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:torch_compat/torch_compat.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/common/IDScanModel.dart';
import 'package:umedmiscanner/features/AddPatient/AddPatientScreen.dart';
import 'package:umedmiscanner/features/Chat/screens/choose_photo_from_gallery.dart';
import 'package:umedmiscanner/features/SingleScan/SpecialtiesScan.dart';
import 'package:umedmiscanner/features/SingleScan/CameraExampleHome.dart';
import 'package:umedmiscanner/features/SingleScan/IDScan.dart';
import 'package:umedmiscanner/features/SingleScan/ShowImages.dart';
import 'package:umedmiscanner/features/SingleScan/ConfirmScan.dart';
import 'package:umedmiscanner/features/SingleScan/models/IDScan_Model.dart';
import 'package:umedmiscanner/features/SingleScan/models/Image_Model.dart';
import 'package:umedmiscanner/resources/AppColors.dart';



String selectedOption="Single File";
List images = new List();
List id_images = new List();
var covid_image = "";


addGalleryImagestoImages(gallery_images){


    images.addAll(gallery_images);



}

class SingleScan extends StatefulWidget {
  @override
  _SingleScanState createState() => _SingleScanState();
}

class _SingleScanState extends State<SingleScan> with WidgetsBindingObserver {


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  CameraController cameraController;
  String imagePath;

  FlashMode flashMode = FlashMode.off;
  int selectedCameraIdx;

  CameraKitController cameraKitController;

  List cameras;


  bool isSettingsClicked = false;

  bool isAddURlClicked= false;

  bool isGridClicked = false;

  bool isFlashClicked = false;

  bool isZoomClicked = false;

  bool _camerakitOn = false;

  List <String> options= ["ID Scan","Specialties","Single File","Multiple Files","URL Link"];

  bool showDarkNotification;

  double zoom=0.0;

  TextEditingController urlLinkController = new TextEditingController();



  IDScan_Model idScan_Model = new IDScan_Model();

  bool idScan_Model_isLoading = false;


  int idscanprogress_Value = 12;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    availableCameras().then((availableCameras) {

      cameras = availableCameras;
      if (cameras.length > 0) {
        setState(() {
          // 2
          selectedCameraIdx = 0;
        });

        _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
      }else{
        print("No camera available");
      }
    }).catchError((err) {
      // 3
      print('Error: $err.code\nError Message: $err.message');
    });


    

    WidgetsBinding.instance.addObserver(this);

    cameraKitController = CameraKitController();

    gallery_images.clear();

    showDarkNotificationFunction();

    id_images=["",""];

    setState(() {

      isFrontClicked=false;
      isbackClicked=false;

    });

    covid_image ="";

    updating_isolate();

  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    TorchCompat.dispose();

    super.dispose();
  }




  handleChooseFromGallery(context) async{

     Navigator.pop(context);

    // ignore: deprecated_member_use

      // ignore: deprecated_member_use
      File file = await ImagePicker.pickImage(source: ImageSource.gallery,);

      if(file !=null) {

        if (selectedOption=="ID Scan"){

          if(isFrontClicked){

            id_images.insert(0, file.path);

            setState(() {

              isFrontClicked=false;
              isbackClicked=false;


            });

          }else{


            id_images.insert(1, file.path);

            setState(() {

              isFrontClicked=false;
              isbackClicked=false;


            });


          }


        }

        else if(selectedOption=="Specialties"){

          print("oiytt");

          covid_image=file.path;

          setState(() {

            isCovidClicked = false;

          });



        }
        else{


          images.add(file.path);

        }


      }





  }

  showDarkNotificationFunction(){

    showDarkNotification=true;

    Timer(Duration(seconds: 10),(){

      setState(() {

          showDarkNotification=false;

      });

    });


  }


  setStateImages(){

    setState(() {

        images=images.toSet().toList();

    });


  }



  showslidingbottomSheet(route,context,width,height){


    showSlidingBottomSheet(
        context,
        builder: (context) {
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
                    padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/100),
                    child: route,
                  ),
                ),
              );
            },
          );
        }
    );


  }

  Widget cameraPreviewWidget() {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {

      return AspectRatio(
        aspectRatio: 2/3,
        child: CameraPreview(cameraController),
      );
    }
  }



  update(){

    if(mounted) {
      setStateImages();
    }
  }

  checktimer(){

    const tenSeconds = const Duration(seconds: 2);
    Timer.periodic(tenSeconds, (Timer t) => update());

  }

  updating_isolate() async {

    await FlutterIsolate.spawn(checktimer(), print("updated"));
  }




  Future _initCameraController(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }

    // 3
    //cameraController = CameraController(cameraDescription, ResolutionPreset.high);

    cameraController = CameraController(cameraDescription, ResolutionPreset.high);

    // If the cameraController is updated then update the UI.
    // 4
    cameraController.addListener(() {
      // 5
      if (mounted) {
        setState(() {});
      }

      if (cameraController.value.hasError) {
        print('Camera error ${cameraController.value.errorDescription}');
      }
    });



    // 6
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      //_showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }






  Widget _flashButton(width,height) {
    IconData iconData = Icons.flash_off;
    Color color = searchbarIconColor;
    if (flashMode == FlashMode.alwaysFlash) {
      iconData = Icons.flash_on;
      color = primaryColor;
    } else if (flashMode == FlashMode.autoFlash) {
      iconData = Icons.flash_auto;
      color = primaryColor;
    }
    return GestureDetector(

        onTap: (){
         cameraController != null && cameraController.value.isInitialized
              ? _onFlashButtonPressed()
              : null;
        },
        child: Container(

            width:width/10,
            height: height/20,
            decoration: new BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Colors.white,
                  width: 2.0
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),

            child: Icon(iconData, color: color,size: width/20,)));


  }


  Future<void> _onFlashButtonPressed() async {
    bool hasFlash = false;
    if (flashMode == FlashMode.off || flashMode == FlashMode.torch) {
      // Turn on the flash for capture
      flashMode = FlashMode.alwaysFlash;
    } else if (flashMode == FlashMode.alwaysFlash) {
      // Turn on the flash for capture if needed
      flashMode = FlashMode.autoFlash;
    } else {
      // Turn off the flash
      flashMode = FlashMode.off;
    }
    // Apply the new mode
    await cameraController.setFlashMode(flashMode);

    // Change UI State
    setState(() {});
  }

  Widget _cameraTogglesRowWidget(width) {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;


    return Container(

      child: GestureDetector(
        onTap: _onSwitchCamera,
        child: Image.asset("images/switch-camera(2).png",color: accentColor,width: width/12,),
      ),

    );
  }


  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }


  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }
    cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
    );

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) setState(() {});
      if (cameraController.value.hasError) {
        showInSnackBar('Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }


  void toogleAutoFocus() {
    cameraController.setAutoFocus(!cameraController.value.autoFocusEnabled);
    showInSnackBar('Toogle auto focus');
  }


  Future<String> takePicture() async {
    if (!cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await cameraController.takePicture(filePath);
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    if(selectedOption!="ID Scan"){
      images.add(filePath);}
    else if(selectedOption=="ID Scan" && isFrontClicked){

      id_images.removeAt(0);
      id_images.insert(0, filePath);
      print("front");

      setState(() {

        isFrontClicked=false;
        isbackClicked=false;


      });

    }else if(selectedOption=="ID Scan" && isbackClicked){

      id_images.removeAt(1);
      id_images.insert(1, filePath);

      setState(() {

        isFrontClicked=false;
        isbackClicked=false;


      });

    }

    else if(selectedOption=="Specialties" && isCovidClicked){

      covid_image=filePath;

      setState(() {

        isCovidClicked = false;

      });

    }

    return filePath;
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }




  showZoomToolTip(){

    Timer(Duration(milliseconds:2000),(){

      setState(() {
        setState(() {

          isZoomClicked=false;

        });
      });

    });


  }




  void onTakePictureButtonPressed(context) {

    String file_Path;

    takePicture().then((String filePath) {
      if (mounted) {
        setState(() {
          imagePath = filePath;
          file_Path = filePath;

          print(imagePath);

          if(file_Path!=null && selectedOption != "ID Scan"){

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  ConfirmScan(image: File(file_Path),)),
            );

          }

        });
        //if (filePath != null) showInSnackBar('Picture saved to $filePath');
      }
    });



  }


  void _onSwitchCamera() {
    selectedCameraIdx =
    selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    _initCameraController(selectedCamera);
  }


  SelectImage(context){

    return showDialog(context: context,

        builder: (parentContext){

          return SimpleDialog(

            title: Text("Add Image"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("Image from Gallery"),
                onPressed: ()=> handleChooseFromGallery(context),
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              )
            ],

          );

        });


  }



  Future<Image_Model> fetchImage(imageUrl,index) async {

    print(imageUrl.toString());

     var imageFile = imageUrl;

    //
    // var thumbnail = Img.copyResize(image, width: 120);
    //
    Image_Model image_model = new Image_Model();
    //
    // File imageFile = new File('img_${DateTime.now().millisecondsSinceEpoch}.png')..writeAsBytesSync(Img.encodePng(thumbnail));


    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://3.139.34.137:8080/SCAN");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);
    // multipart that takes file
    var multipartFile = new http.MultipartFile("Image", stream, length,
        filename: basename(imageFile.path));
    // add file to multipart
    request.files.add(multipartFile);


    http.Response response = await http.Response.fromStream(await request.send());
    print("Result: ${response.statusCode}");

    image_model = await Image_Model.fromJson(json.decode(response.body));

    id_images.removeAt(index);

    id_images.insert(index, "http://3.139.34.137:8080${image_model.imageUrl}");

    print(image_model.imageUrl);

    setState(() {

    });

    return image_model;


  }


  getImageFile(strURL) async {

    final http.Response responseData = await http.get(strURL);
    var uint8list = responseData.bodyBytes;
    var buffer = uint8list.buffer;
    ByteData byteData = ByteData.view(buffer);
    var tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/img.jpg').writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;

  }


  Future<File> testCompressAndGetFile(File file, String targetPath) async {
    print("testCompressAndGetFile");
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 100,
      minWidth: 300,
      minHeight: 300,
      rotate: 0,
    );

    print(file.lengthSync());
    print(result.lengthSync());

    return result;
  }


  fetchIDScan(context) async {



      idScan_Model_isLoading=true;




    // Image_Model frontImage=await fetchImage(id_images[0]);
    //
    //
    // File frontImageFile = await getImageFile("http://3.138.110.129:8080${frontImage.imageUrl}");
    //
    // Image_Model backImage=await fetchImage(id_images[1]);
    //
    // File backImageFile = await getImageFile("http://3.138.110.129:8080${backImage.imageUrl}");


    // var imagefront = Img.decodeImage(File(id_images[0]).readAsBytesSync());
    //
    // var thumbnailfront = Img.copyResize(imagefront, width: 120);
    //
    // var tempDir = await getTemporaryDirectory();
    //
    // File frontImageFile = await File('${tempDir.path}/img_${DateTime.now().millisecondsSinceEpoch}0.jpg')
    //   ..writeAsBytesSync(Img.encodeJpg(thumbnailfront));
    //
    // var imageback = Img.decodeImage(File(id_images[1]).readAsBytesSync());
    //
    // var thumbnailback = Img.copyResize(imageback, width: 120);
    //
    // File backImageFile = await File('${tempDir.path}/img_${DateTime.now().millisecondsSinceEpoch}1.jpg')
    //   ..writeAsBytesSync(Img.encodeJpg(thumbnailback));

    setState(() {

      idscanprogress_Value = 24;

    });

    var tempDir = await getTemporaryDirectory();


    var frontImageFile = await testCompressAndGetFile(File(id_images[0]), '${tempDir.path}/img_${DateTime.now().millisecondsSinceEpoch}0.jpg');

    await fetchImage(frontImageFile, 0);

      setState(() {

        idscanprogress_Value = 40;

      });

    var backImageFile = await testCompressAndGetFile(File(id_images[1]), '${tempDir.path}/img_${DateTime.now().millisecondsSinceEpoch}1.jpg');

    await fetchImage(backImageFile, 1);

      setState(() {

        idscanprogress_Value = 60;

      });

    // print(frontImageFile.path+" is the front");
    //
    // print(frontImageFile.path+" is the back");

    var frontstream = new http.ByteStream(DelegatingStream.typed(frontImageFile.openRead()));
    // get file length
    var frontlength = await frontImageFile.length();

    var backstream = new http.ByteStream(DelegatingStream.typed(backImageFile.openRead()));
    // get file length
    var backlength = await backImageFile.length();

    // string to uri
    var uri = Uri.parse("http://3.139.34.137:8080/IDOCR");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);
    // multipart that takes file
    var multipartFile = new http.MultipartFile("Front", frontstream, frontlength,
        filename: basename(frontImageFile.path));

    request.files.add(multipartFile);

    multipartFile = new http.MultipartFile("Back", backstream, backlength,
        filename: basename(backImageFile.path));
    // add file to multipart
    request.files.add(multipartFile);
    // send


      setState(() {

        idscanprogress_Value = 70;

      });

    http.Response response = await http.Response.fromStream(await request.send());
    print("Result2: ${response.statusCode}");
    print(response.body);

      setState(() {

        idscanprogress_Value = 75;

      });

    if(response.statusCode==200){


      setState(() {

        idscanprogress_Value = 85;

      });

      IDScanModel.idScanModel = IDScan_Model.fromJson(json.decode(response.body));

      print(idScan_Model.fullNameArabic);

      print("ppp");

      idScan_Model_isLoading=false;

      setState(() {

        idscanprogress_Value = 99;

      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            AddPatientScreen()),
      );



    }
    else{

      print("error");

      return showDialog(context: context,

          builder: (parentContext) {
            return AlertDialog(
              title: Text('Error'),
              content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 85,
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline, color: Colors.red, size: 40,),

                          SizedBox(height: 20,),

                          Text("Oops, something went wrong.\nPlease, check your network and try again.",
                            style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),)

                        ],
                      )
                  )),
              actions: [

                RaisedButton(
                  onPressed: () {
                    id_images.removeAt(0);
                    id_images.insert(0, "");

                    id_images.removeAt(1);
                    id_images.insert(1, "");

                    setState(() {

                    });

                    Navigator.pushReplacement(context,MaterialPageRoute(
                        builder: (context) => SingleScan()
                    ));

                  },
                  textColor: Colors.white,
                  color: appColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: appColor)
                  ),
                  child: Text(
                    'Ok',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),

                ),

              ],
            );
          });}



  }


  urllinkWidget(width,height){

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

            child: Icon(Icons.link,color: primaryColor,size: width/30,),

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
              child:Stack(
                children: [
                  TextField(
                    controller: urlLinkController,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    maxLength: 250,
                    style: TextStyle(decoration: TextDecoration.underline, color: primaryColor),
                    decoration: InputDecoration(
                        hintText: "Add URL",
                        hintStyle: TextStyle(fontSize: 15,color: Colors.grey,decoration: TextDecoration.none),
                        border: InputBorder.none
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                          onTap: (){

                            FlutterClipboard.paste().then((value) {
                              // Do what ever you want with the value.
                              setState(() {
                                urlLinkController.text = value;
                              });
                            });


                          },

                          child: Icon(Icons.paste,size: width/30,color: primaryColor,)),
                    ),


                ],
              ),
            ),



          ),





        ],
      ),
    );

  }





  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(

        //backgroundColor: accentColor,

        key: _scaffoldKey,

        appBar: AppBar(
          centerTitle: true,
          backgroundColor: fontColor,
          elevation: 0,
          toolbarHeight: height/10,
          automaticallyImplyLeading: false,

          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _cameraTogglesRowWidget(width),
            ],
          ),

          leading: GestureDetector(
                child: Icon(Icons.arrow_back_ios,size: width/30,color: accentColor,),
                onTap: (){

                  Navigator.pop(context);

                },

          ),


          actions: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/50),
              child: Row(
                children: [

                  // isSettingsClicked?Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: width/30),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       GestureDetector(
                  //         onTap:(){
                  //
                  //           setState(() {
                  //
                  //             isZoomClicked?isZoomClicked=false:isZoomClicked=true;
                  //
                  //             print(isZoomClicked);
                  //
                  //             showZoomToolTip();
                  //
                  //             print("Zoom");
                  //
                  //           });
                  //
                  //         },
                  //         child: Container(
                  //           width:width/10,
                  //           height: height/20,
                  //           decoration: new BoxDecoration(
                  //             color: Colors.white,
                  //             border: Border.all(
                  //                 color: Colors.white,
                  //                 width: 2.0
                  //             ),
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(50.0),
                  //             ),
                  //           ),
                  //           child: Icon(Icons.zoom_out_map,color: primaryColor,size: width/20,),
                  //         ),
                  //       ),
                  //       SizedBox(height: height/80,),
                  //       Text("Zoom",style: TextStyle(fontSize: 10,color: searchbarIconColor),),
                  //     ],
                  //   ),
                  // ):Text(""),

                  isSettingsClicked?Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap:(){

                            setState(() {

                              isGridClicked?isGridClicked=false:isGridClicked=true;

                             print("Grid");

                            });

                            },
                           child: Container(
                            width:width/10,
                            height: height/20,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.white,
                                  width: 2.0
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            child: Icon(Icons.grid_on,color: isGridClicked?primaryColor:searchbarIconColor,size: width/20,),
                          ),
                        ),
                        SizedBox(height: height/80,),
                        Text("Grid",style: TextStyle(fontSize: 10,color: searchbarIconColor),),
                      ],
                    ),
                  ):Text(""),

                  isSettingsClicked?Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _flashButton(width,height),

                        SizedBox(height: height/80,),
                        Text("Flash",style: TextStyle(fontSize: 10,color: searchbarIconColor),),
                      ],
                    ),
                  ):Text(""),



                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/50),
                    child: GestureDetector(
                      child: Icon(Icons.settings,size: width/15,color: isSettingsClicked?accentColor:searchbarIconColor,),
                      onTap: (){

                        setState(() {

                          // ImagePicker.pickImage(source: ImageSource.camera
                          //     ,maxHeight: 675
                          //     ,maxWidth: 960);

                          isSettingsClicked?isSettingsClicked=false:isSettingsClicked=true;

                        });

                      },

                    ),
                  ),
                ],
              ),
            ),

          ],

        ),

        body: Stack(
          children: [

            Align(

              alignment: Alignment.topCenter,
              child:Stack(
                children: [


                  Container(
                          width:width,
                          height: selectedOption=="ID Scan" && !isFrontClicked && !isbackClicked?height/1.8
                              :selectedOption=="URL Link"?height/1.8
                              :selectedOption=="Specialties" && !isCovidClicked?height/1.8:height,
                          child: selectedOption=="ID Scan" && !isFrontClicked && !isbackClicked?
                          Center(child: IDScan()):
                          selectedOption=="URL Link"?

                             urllinkWidget(width, height)

                          :selectedOption=="Specialties" && !isCovidClicked?

                          Center(child: SpecialtiesScan())

                          // :ZoomableWidget(
                          //     child: Container(
                          //         width:width,
                          //         height: height,
                          //         child:cameraPreviewWidget(),
                          //          ),
                          //     onTapUp: (scaledPoint) {
                          //       cameraController.setPointOfInterest(scaledPoint);
                          //     },
                          //     onZoom: (zoom) {
                          //       //print('zoom');
                          //       if (zoom < 5) {
                          //
                          //         cameraController.zoom(zoom);
                          //
                          //
                          //         setState(() {});
                          //       }
                          //     })),

                          :Stack(
                            children: [
                              Container(
                                  width:width,
                                  height: height,
                                  child:cameraPreviewWidget(),
                                   ),


                              Visibility(

                                  visible: selectedOption=="ID Scan",
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child:Padding(
                                        padding: EdgeInsets.only(top:height/5),
                                        child: Container(
                                          height: height/3,
                                          width: width/1.2,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(.3),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)  //                 <--- border radius here
                                            ),
                                            shape: BoxShape.rectangle,
                                          ),
                                        ),
                                      ))

                              ),


                              Visibility(
                                visible: selectedOption=="ID Scan",
                                child: Align(
                                  alignment:Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: width/1.2,
                                      decoration: new BoxDecoration(
                                        color: fontColor.withOpacity(.5),
                                        border: Border.all(
                                            color: fontColor.withOpacity(.5),
                                            width: 0.0
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)  //                 <--- border radius here
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
                                        padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                                        child: ListTile(
                                          leading: Icon(Icons.info,color: accentColor,size: width/20,),
                                          title: Text("It's a trial, so please make sure to scan inside the frame & against dark background.",
                                            style: TextStyle(color: accentColor,fontSize: 12),),
                                        ),
                                      ),


                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          ),
                          //_cameraPreviewWidget()),


                  isZoomClicked?
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top:height/10),
                        child: Icon(Icons.zoom_out_map,color: searchbarIconColor.withOpacity(.5),size: width/2,),
                      )):Text(""),

                  // showDarkNotification?Align(
                  //   alignment:Alignment.center,
                  //   child: Container(
                  //     width: width/1.5,
                  //     decoration: new BoxDecoration(
                  //       color: fontColor.withOpacity(.5),
                  //       border: Border.all(
                  //           color: fontColor.withOpacity(.5),
                  //           width: 0.0
                  //       ),
                  //       borderRadius: BorderRadius.all(
                  //           Radius.circular(50.0)  //                 <--- border radius here
                  //       ),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: accentColor.withOpacity(0.5),
                  //           spreadRadius: 2,
                  //           blurRadius: 5,
                  //           offset: Offset(0, 2), // changes position of shadow
                  //         ),
                  //       ],),
                  //     child: Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                  //       child: ListTile(
                  //         leading: Icon(Icons.info,color: accentColor,size: width/20,),
                  //         title: Text("Please, make sure to scan against dark background.",
                  //           style: TextStyle(color: accentColor,fontSize: 12),),
                  //       ),
                  //     ),
                  //
                  //
                  //   ),
                  // ):Text(""),


                  isGridClicked?Column(
                    children: [

                      SizedBox(height: height/5,),

                      Divider(thickness: 2),
                      SizedBox(height: height/5,),
                      Divider(thickness: 2),

                    ],
                  ):Text(""),


                  isGridClicked?Row(
                    children: [

                      SizedBox(width: width/3.4,),

                      VerticalDivider(thickness: 3,),

                      SizedBox(width: width/3.4,),

                      VerticalDivider(thickness: 3,),


                    ],
                  ):Text(""),

                ],
              ),


            ),



            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Container(
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                        color: selectedOption=="ID Scan" && !isFrontClicked && !isbackClicked?fontColor
                            :selectedOption=="URL Link"?fontColor
                            :selectedOption=="Specialties" && !isCovidClicked?fontColor:fontColor.withOpacity(.1),
                        border: Border.all(
                            color: fontColor.withOpacity(.5),
                            width: 0.0
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(0.0)  //                 <--- border radius here
                        ),
                        ),
                      height: height/3.5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: height/50),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Row(

                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                              children: [


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [


                                    GestureDetector(
                                      child: Image.asset("images/qr-code.png",width: width/15,color: accentColor,),
                                      onTap: (){

                                        setState(() {


                                        });

                                      },

                                    ),


                                    SizedBox(width: width/10,),

                                    !(selectedOption=="ID Scan" && !isFrontClicked && !isbackClicked)
                                     && !(selectedOption=="URL Link") && !(selectedOption=="Specialties" && !isCovidClicked)?

                                    GestureDetector(
                                      child: Icon(Icons.photo_library,size: width/15,color: accentColor,),

                                      onTap: (){


                                        // Navigator.pop(context);

                                        //showslidingbottomSheet(ChoosePhotoFromGallery(),context,width,height);

                                         //handleChooseFromGallery(context);

                                         SelectImage(context);

                                        // Navigator.push(context,MaterialPageRoute(
                                        //     builder: (context) => MyImagePickerView()
                                        // ));



                                         // return loadAssets;


                                         },

                                         )
                                        :Text(""),




                                  ],
                                ),



                                GestureDetector(
                                    child: Container(
                                      width: width/6,
                                        decoration: new BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.white,
                                              width: 2.0
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50.0),
                                          ),
                                        ),
                                        child: Image.asset("images/scan.png",width: width/12,color: primaryColor,)),
                                    onTap: () async {

                                      setState(() {
                                        isAddURlClicked=false;
                                      });

                                      if(!(selectedOption=="ID Scan" && !isFrontClicked && !isbackClicked)
                                          && !(selectedOption=="URL Link") && !(selectedOption=="Specialties" && !isCovidClicked)){

                                      if(selectedOption=="URL Link" && urlLinkController.text.isNotEmpty){


                                        try {
                                          var imageId = await ImageDownloader.downloadImage(urlLinkController.text.toString());
                                          var path = await ImageDownloader.findPath(imageId);
                                          images.add(path);
                                          urlLinkController.clear();
                                          setState(() {

                                          });
                                        } catch (error) {
                                          print(error);
                                        }



                                      }else {
                                        cameraController != null &&
                                            cameraController.value
                                                .isInitialized &&
                                            !cameraController.value
                                                .isRecordingVideo
                                            ? onTakePictureButtonPressed(
                                            context)
                                            : null;
                                      }




                                     if(images.length >0 && images[0]!=null) {
                                       Navigator.push(
                                         context,
                                         MaterialPageRoute(builder: (context) =>
                                             ConfirmScan(image: File(images[0]),)),
                                       );
                                     }

                                     else{

                                       //getImage();


                                      /* _scaffoldKey.currentState.showSnackBar(
                                           SnackBar(content: Text('No Image Selected',
                                             textAlign: TextAlign.center, style: TextStyle(fontSize: 12.0, fontWeight:
                                             FontWeight.bold),), duration: Duration(seconds: 2), backgroundColor: Colors.black54,)
                                       );*/

                                     }
                                    }
                                      else{


                                      SnackBar snackBar = SnackBar(
                                      elevation: 6.0,
                                      backgroundColor: appColor,
                                      behavior: SnackBarBehavior.floating,
                                      content: Text(
                                      "Camera is off",
                                      style: TextStyle(color: Colors.white),
                                      ),
                                      );

                                      _scaffoldKey.currentState.showSnackBar(
                                      snackBar);
                                      }


                                      }



                                  ),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      child: selectedOption=="Single File" && images.length>0?
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 0),
                                        child: Stack(
                                                  children: [

                                                    Container(width: width/10,height: height/12,),

                                                    Positioned(
                                                        top: height/50,
                                                        child: Stack(
                                                          children: [
                                                            SpinKitRotatingCircle(
                                                              color: accentColor,
                                                              size: width/40,
                                                            ),
                                                            Image.file(File(images[0].toString()),width: width/15,),
                                                          ],
                                                        )),

                                                    Positioned(
                                                        left: width/28,
                                                        bottom: height/20,
                                                      child: Container(
                                                        decoration: new BoxDecoration(
                                                          color: fontColor.withOpacity(.5),
                                                          border: Border.all(
                                                              color: fontColor,
                                                              width: 0.0
                                                          ),
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(50.0)  //                 <--- border radius here
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: searchbarIconColor.withOpacity(0.3),
                                                              spreadRadius: 2,
                                                              blurRadius: 5,
                                                              offset: Offset(0, 2), // changes position of shadow
                                                            ),
                                                          ],),
                                                        child: GestureDetector(
                                                            onTap: (){
                                                           images.remove(images[0]);
                                                           setState(() {

                                                           });

                                                            },
                                                            child: Icon(Icons.delete,color: cancelBtnColor,size: width/20,)),
                                                      ),
                                                    )

                                                  ],
                                                )

                                      ):Row(
                                        children: [
                                          selectedOption=="Multiple Files" && images.length>0?
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: width/50),
                                            child: Stack(
                                              children: [

                                                Container(width: width/10,height: height/12,),

                                                Positioned(
                                                    top: height/50,
                                                    child: Stack(
                                                      children: [
                                                        SpinKitRotatingCircle(
                                                          color: accentColor,
                                                          size: width/40,
                                                        ),
                                                        Image.file(File(images[0].toString()),width: width/15,),
                                                      ],
                                                    )),

                                                Positioned(
                                                  left: width/20,
                                                  bottom: height/18,
                                                  child: Container(
                                                    decoration: new BoxDecoration(
                                                      color: fontColor.withOpacity(.5),
                                                      border: Border.all(
                                                          color: fontColor,
                                                          width: 0.0
                                                      ),
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(50.0)  //                 <--- border radius here
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: searchbarIconColor.withOpacity(0.2),
                                                          spreadRadius: 2,
                                                          blurRadius: 5,
                                                          offset: Offset(0, 2), // changes position of shadow
                                                        ),
                                                      ],),
                                                    child: GestureDetector(
                                                        onTap: (){
                                                          images.remove(images[0]);
                                                          setState(() {

                                                          });

                                                        },
                                                        child: Icon(Icons.close,color: cancelBtnColor,size: width/30,)),
                                                  ),
                                                )

                                              ],
                                            )
                                          ):Text(""),

                                          selectedOption=="Multiple Files" && images.length>1?
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: width/50),
                                                child: GestureDetector(

                                                  onTap: (){

                                                    //showslidingImages(context,width,height);

                                                    showslidingbottomSheet(ShowImages(), context, width, height);


                                                  },

                                                  child: Padding(
                                                    padding: EdgeInsets.only(top:height/50),
                                                    child: Container(
                                                        width: width/15,
                                                        height: height/15,
                                                        alignment: Alignment.center,
                                                        decoration: new BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.white70,
                                                              width: 0.0
                                                          ),
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(0.0)  //                 <--- border radius here
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.black.withOpacity(0.2),
                                                              spreadRadius: 5,
                                                              blurRadius: 7,
                                                              offset: Offset(0, 3), // changes position of shadow
                                                            ),
                                                          ],),
                                                        child: Text("+${images.length-1}",style: TextStyle(fontSize: 15,color: accentColor),)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ):Text("")
                                        ],
                                      ),


                                    ),



                                    SizedBox(width: width/10,),

                                    images.length>0 || (id_images[0]!="" && id_images[1]!="")?GestureDetector(
                                      child: idScan_Model_isLoading?
                                          Container(
                                            width: width/6,
                                            height: height/10,
                                            alignment: Alignment.center,
                                            decoration: new BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.white.withOpacity(.1),
                                                  width: 2.0
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50.0)  //                 <--- border radius here
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.white.withOpacity(0.2),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 3), // changes position of shadow
                                                ),
                                              ],

                                            ),
                                            child: SleekCircularSlider(
                                              appearance: CircularSliderAppearance(
                                                  customColors: CustomSliderColors(
                                                    shadowColor: Colors.white,
                                                  ),
                                                  size: 80.0,
                                                  customWidths: CustomSliderWidths(progressBarWidth: 5)),
                                              initialValue: idscanprogress_Value.toDouble(),
                                            ),
                                          )

                                        :Icon(Icons.cloud_upload,size: width/10,
                                        color:accentColor,),
                                      onTap: (){

                                        fetchIDScan(context);

                                      },

                                    ):Text(""),
                                  ],
                                ),

                              ],

                            ),


                            SizedBox(height: height/30,),


                                Container(
                                  width: width,
                                  height: height/12,
                                  alignment: Alignment.center,
                                  child: Center(
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: options.length,
                                        itemBuilder: (context,position){

                                          return Padding(
                                            padding: EdgeInsets.symmetric(horizontal: width/30),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  child: Text(options[position],style: TextStyle(fontSize: 12,

                                                      color: selectedOption==options[position]?accentColor:searchbarIconColor.withOpacity(.9),
                                                       fontWeight: selectedOption==options[position]?FontWeight.bold:FontWeight.normal),),

                                                  onTap: (){

                                                    setState(() {

                                                      selectedOption=options[position];

                                                    });


                                                    //Navigator.pop(context);

                                                  },

                                                ),

                                                selectedOption==options[position]?
                                                Text(".",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: accentColor),):Text(""),
                                              ],
                                            )
                                          );

                                        }),
                                  ),
                                ),

                                //







                                //selectedOption=="Multiple Files"?Icon(Icons.photo,color: accentColor,size: width/10,):Text(""),

                              ],
                            ),



                        ),
                      ),

                  ],
                )),
          ],
        ),



    );


  }
}


