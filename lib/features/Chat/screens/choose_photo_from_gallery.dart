import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/SingleScan/IDScan.dart';
import 'package:umedmiscanner/features/SingleScan/SingleScan.dart' as singlescan;
import 'package:flutter/material.dart';
import 'package:flutter_image_gallery/flutter_image_gallery.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:umedmiscanner/features/SingleScan/SpecialtiesScan.dart';

List allImage = new List();

List gallery_images = new List();


class ChoosePhotoFromGallery extends StatefulWidget {

  @override
  _ChoosePhotoFromGalleryState createState() => _ChoosePhotoFromGalleryState();
}

class _ChoosePhotoFromGalleryState extends State<ChoosePhotoFromGallery> {




  List <PhotoGallery> photosGallery =[];

  List <PhotoGallery> checkedPhotosGallery =[];






  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();

    //gallery_images.clear();

    loadImageList();

    getPhotosGallery();

    checkSelectedPhotos();


  }

  Future<void> loadImageList() async {
    Map<dynamic, dynamic> allImageTemp;
    allImageTemp = await FlutterImageGallery.getAllImages;
    //print(" call $allImageTemp.length");

    setState(() {
      allImage = allImageTemp['URIList'] as List;
    });
  }


  getPhotosGallery() async {

    photosGallery= await getPhotosFromGallery();

    return photosGallery;
  }

  checkSelectedPhotos(){

    for(var gallery_image in gallery_images){

      for(var photoGallery in photosGallery){

        if(gallery_image==photoGallery.url){

          //print("pp");

          setState(() {

            photoGallery.isChecked=true;


          });



        }


      }


    }


  }


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: accentColor,
      appBar: AppBar(

        backgroundColor: accentColor,
        centerTitle: true,
        elevation: 0,
        title: Container(
          width: width/3,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            color: appColor,
            border: Border.all(
                color: Colors.grey,
                width: 5.0
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)  //                 <--- border radius here
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],

          ),
        ),
        leading:Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 80, vertical: height / 80),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("images/close.png", color: appColor, width: width / 25,),



          ),
        ),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/30),
        child: Stack(

          children: [


            Align(

              alignment: Alignment.topLeft,

              child: Text("${gallery_images.length} Selected",
                style: TextStyle(color: primaryColor,fontSize: 14),),


            ),

            Align(

              alignment: Alignment.topCenter,

              child: Text("Choose Photos",style: TextStyle(color: fontColor,fontSize: 15,fontWeight: FontWeight.bold),),


            ),

          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(

              onTap: (){

                gallery_images.clear();

                for(var photoGallery in photosGallery){

                  if(photoGallery.isChecked){


                    gallery_images.add(photoGallery.url);

                  }


                }


                setState(() {


                  singlescan.addGalleryImagestoImages(gallery_images);

                });



                Navigator.pop(context);





              },

              child:  Text("Proceed",
                textAlign: TextAlign.center,style: TextStyle(color: primaryColor,fontSize: 15,fontWeight: FontWeight.bold),)
            ),
          ),


            Padding(
              padding: EdgeInsets.only(top: height/20),
              child: Align(

                alignment: Alignment.center,

                child: FutureBuilder(
                        future: getPhotosGallery(),
                        builder: (context, snapshot) {
                          if(snapshot.hasData) {
                            return GridView.count(
                                crossAxisCount: 3,
                                childAspectRatio: 1.0,
                                padding: const EdgeInsets.all(4.0),
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                                children: photosGallery.map((PhotoGallery photoGallery) {
                                  return GridTile(
                                      child: GestureDetector(
                                          onTap: (){

                                            setState(() {

                                              if (singlescan.selectedOption=="ID Scan"){

                                                if(isFrontClicked){

                                                  singlescan.id_images.insert(0, photoGallery.url);

                                                  setState(() {

                                                    isFrontClicked=false;
                                                    isbackClicked=false;


                                                  });


                                                  Navigator.pop(context);

                                                }else{


                                                  singlescan.id_images.insert(1, photoGallery.url);

                                                  setState(() {

                                                    isFrontClicked=false;
                                                    isbackClicked=false;


                                                  });


                                                  Navigator.pop(context);

                                                }


                                              }

                                              else if(singlescan.selectedOption=="Specialties"){

                                                print("oiytt");

                                                singlescan.covid_image=photoGallery.url;

                                                setState(() {

                                                  isCovidClicked = false;

                                                });

                                                Navigator.pop(context);


                                              }
                                              else{


                                                photoGallery.isChecked?photoGallery.isChecked=false:photoGallery.isChecked=true;

                                                photoGallery.isChecked?
                                                checkedPhotosGallery.add(photoGallery):checkedPhotosGallery.remove(photoGallery);

                                                photoGallery.isChecked? gallery_images.add(photoGallery.url)
                                                    :gallery_images.remove(photoGallery.url);


                                                photoGallery.isChecked?singlescan.images.add(photoGallery.url)
                                                    :singlescan.images.remove(photoGallery.url);

                                              }



                                            });


                                          },
                                          child: Stack(
                                            children: [

                                              Align(
                                                alignment: Alignment.center,
                                                child: Stack(
                                                  children: [
                                                    photoGallery!=null?SpinKitRotatingCircle(
                                                      color: primaryColor,
                                                      size: width/40,
                                                    ):Text(""),
                                                    Align(
                                                        alignment: Alignment.center,
                                                        child: Image.file(File(photoGallery.url), fit: BoxFit.fill)),
                                                  ],
                                                ),
                                              ),

                                              photoGallery.isChecked?Align(
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

                                                    child: Icon(Icons.check_circle,color: primaryColor,)),
                                              ):Text(""),


                                            ],
                                          )));
                                }).toList());
                          } else if(snapshot.hasError) {
                            return Text('Delivery error: ${snapshot.error.toString()}');
                          } else {
                            return SpinKitRotatingCircle(
                              color: primaryColor,
                              size: width/10,
                            );
                          }
                        }),




              ),
            ),






          ],

        ),
      ),
    );
  }
}


class PhotoGallery{

  String url;
  bool isChecked = false;


}


List <PhotoGallery> getPhotosFromGallery(){


  List <PhotoGallery> photosGallery =[];

  PhotoGallery photoGallery = new PhotoGallery();


  for(int i=0;i<allImage.length;i++){

    photoGallery = new PhotoGallery();

    photoGallery.url=allImage[i];

    photosGallery.add(photoGallery);

  }




  return photosGallery.reversed.toList();


}