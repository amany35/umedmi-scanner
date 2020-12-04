import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class CameraPhoto extends StatefulWidget {
  @override
  _CameraPhotoState createState() => _CameraPhotoState();
}

class _CameraPhotoState extends State<CameraPhoto> {


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    return Stack(
      children: [


        Scaffold(

          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-1.2.1&ixid="
                    "eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/30),
              child: Stack(

                children: [


                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      child: Icon(Icons.arrow_back_ios,size: width/30,color: fontColor,),
                      onTap: (){

                        Navigator.pop(context);

                      },

                    ),


                  ),

                  Padding(
                    padding: EdgeInsets.only(top:height/20),
                    child: Align(

                      alignment: Alignment.topCenter,

                      child: Container(
                        color: accentColor,
                        width: width/1,
                        height: height/15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.crop,color: primaryColor,size: width/30,),
                                Text("Crop",style: TextStyle(fontSize: 10,color: primaryColor),),
                               ],
                                 ),

                            SizedBox(width: width/10,),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.compare_arrows,color: primaryColor,size: width/30,),
                                Text("Resize",style: TextStyle(fontSize: 10,color: primaryColor),),
                              ],
                            ),

                            SizedBox(width: width/10,),


                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.rotate_left,color: primaryColor,size: width/30,),
                                Text("Rotate Left",style: TextStyle(fontSize: 10,color: primaryColor),),
                              ],
                            ),

                            SizedBox(width: width/10,),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.rotate_right,color: primaryColor,size: width/30,),
                                Text("Rotate Right",style: TextStyle(fontSize: 10,color: primaryColor),),
                              ],
                            ),



                          ],
                        ),
                      ),


                    ),
                  ),



                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top:height/50,bottom:height/80),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Container(
                              height: height/15,
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                color: accentColor,
                                border: Border.all(
                                    color: Colors.white.withOpacity(.1),
                                    width: 2.0
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(50.0)  //                 <--- border radius here
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],

                              ),
                              child: ListTile(


                                title: TextField(
                                  decoration: InputDecoration(
                                      hintText:"",
                                      hintStyle: TextStyle(fontSize: 15,color: searchbarIconColor),
                                      border: InputBorder.none

                                  ),
                                ),

                                trailing: Image.asset("images/send.png",color: primaryColor,width: width/25,),

                              )
                          ),

                          SizedBox(height: height/30,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: [

                                      Image.network("https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-1.2.1&ixid="
                                          "eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",width: width/5,),

                                      SizedBox(width: width/50,),

                                      Image.network("https://images.unsplash.com/photo-1555041469-a586c61ea9bc?ixlib=rb-1.2.1&ixid="
                                          "eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",width: width/5,),

                                      SizedBox(width: width/50,),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right:10.0),
                                    child: Container(
                                      width: width/5,
                                      alignment: Alignment.center,
                                      child:IconButton(
                                        icon:Icon(Icons.add,size: width/20,color: primaryColor,),
                                        onPressed: (){},

                                      ),
                                      decoration: new BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border.all(
                                            color: primaryColor,
                                            width: 2.0
                                        ),


                                      ),
                                    ),
                                  )
                                ],
                              )
                          )


                        ],
                      ),
                    ),
                  ),





                ],

              ),
            ),
          ),
        ),
      ],
    );
  }
}


