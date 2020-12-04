import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/resources/AppColors.dart';


class AddDocumentDetails extends StatefulWidget {

  final File image;

  const AddDocumentDetails({Key key, this.image}) : super(key: key);

  @override
  _AddDocumentDetailsState createState() => _AddDocumentDetailsState();
}

class _AddDocumentDetailsState extends State<AddDocumentDetails> {

  List <String> dropdownMenu = [];

  bool isAddNewPatientClicked = false;


  addDocumentDetailsButtons({bool isMainButton,width,height}){

    return GestureDetector(
      onTap: (){

        //isMainButton?showslidingbottomSheet(AddDocumentDetails(),width,height):Navigator.pop(context);

      },
      child: Padding(
        padding: EdgeInsets.only(top:height/50,bottom:height/80),
        child: Container(
            width: width/1.3,
            height: height/20,
            alignment: Alignment.center,

            decoration: isMainButton?BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],

            ):BoxDecoration(),

            child: Center(child: Text(isMainButton?"Save":"Cancel",
              textAlign: TextAlign.center,style: TextStyle(color: isMainButton?accentColor:primaryColor),))),
      ),

    );


  }




  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: accentColor,
        appBar: AppBar(

          title:Text("Add Document Details",style: TextStyle(color: fontColor,fontSize: 18,fontWeight: FontWeight.bold),),

          backgroundColor: accentColor,
          elevation: 0,
          toolbarHeight: height/15,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios,size: width/30,color: fontColor,),
            onTap: (){

              Navigator.pop(context);

            },

          ),



        ),

        body: ListView(
          children: [

            Padding(
              padding: EdgeInsets.only(bottom: height/50),
              child: Container(
                  width: width/20,
                  height: height/8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Image.asset("images/scan.png",width: width/12,height:height/10,color: primaryColor,)),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width/10,
                  height: height/20,
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

                  child: Text("#",style: TextStyle(color: primaryColor,fontSize: 18),textAlign: TextAlign.center,),

                ),
                Container(
                  width: width/1.2,
                  height: height/20,
                  alignment: Alignment.center,
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
                  child: Text("1365479231",style: TextStyle(color: fontColor,fontSize: 15),textAlign: TextAlign.center,),

                ),
              ],
            ),

            SizedBox(height: height/50,),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width/10,
                      height: height/20,
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

                      child: Image.asset("images/patientInfo.png",color: primaryColor,width: width/30,),

                    ),

                        Container(
                          width: width/1.2,
                          height: height/20,

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

                          child:Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Patient Name & ID",style: TextStyle(fontSize: 13,color: searchbarIconColor.withOpacity(.5)),),

                                GestureDetector(
                                    onTap: (){

                                        setState(() {

                                          isAddNewPatientClicked?isAddNewPatientClicked=false:isAddNewPatientClicked=true;


                                        });
                                    },
                                    child: Icon(Icons.arrow_drop_down,color: primaryColor,size: width/18,))
                              ],
                            ),


                          ),

                        ),


                  ],
                ),

                isAddNewPatientClicked?Padding(
                  padding: EdgeInsets.only(bottom: height/50),
                  child: Container(
                    height: height/5,
                    width: width/1.1,
                    decoration: new BoxDecoration(
                      color: searchbarIconColor.withOpacity(.3),

                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Stack(
                      children: [

                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: height/50,bottom: height/50,left: width/30),
                            child: Column(
                              children: [
                                SizedBox(height: height/100,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.add,color: primaryColor,size: width/30,),
                                    SizedBox(width: width/50,),
                                    Text("Add New Patient",style: TextStyle(fontSize: 12,color: fontColor),)
                                  ],
                                ),
                                SizedBox(height: height/100,),
                                Divider(),
                              ],
                            ),
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.only(top: height/15,bottom: height/50,left: width/30),
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder:(context,position){

                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: height/100,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor:accentColor,
                                          radius:width/35,
                                          child: Image.asset("images/patient.png",color: primaryColor,width: width/40,)),
                                      SizedBox(width: width/50,),
                                      Text("Tom Cruise",style: TextStyle(fontSize: 12,color: fontColor),)
                                    ],
                                  ),
                                  SizedBox(height: height/100,),
                                  Divider(),
                                ],
                              );


                            }



                          ),
                        ),
                      ],
                    ),
                  ),
                ):Text("")


              ],
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width/10,
                  height: height/20,
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

                  child: Icon(Icons.insert_drive_file,color: primaryColor,size: width/30,),

                ),
                Container(
                  width: width/1.2,
                  height: height/20,
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

                  child:Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Document Type",style: TextStyle(fontSize: 13,color: searchbarIconColor.withOpacity(.5)),),
                        Icon(Icons.arrow_drop_down,color: primaryColor,size: width/18,),
                      ],
                    ),


                  ),

                ),
              ],
            ),


            SizedBox(height: height/50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width/10,
                  height: height/20,
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

                  child: Icon(Icons.folder_open,color: primaryColor,size: width/30,),

                ),
                Container(
                  width: width/1.2,
                  height: height/20,
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

                  child:Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Document Name",style: TextStyle(fontSize: 13,color: searchbarIconColor.withOpacity(.5)),),
                        Icon(Icons.arrow_drop_down,color: primaryColor,size: width/18,),
                      ],
                    ),


                  ),

                ),
              ],
            ),


            SizedBox(height: height/50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width/10,
                  height: height/20,
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

                  child: Icon(Icons.folder_open,color: primaryColor,size: width/30,),

                ),
                Container(
                  width: width/1.2,
                  height: height/20,
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

                  child:Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Folder Name",style: TextStyle(fontSize: 13,color: searchbarIconColor.withOpacity(.5)),),
                        Icon(Icons.arrow_drop_down,color: primaryColor,size: width/18,),
                      ],
                    ),


                  ),

                ),
              ],
            ),


            SizedBox(height: height/50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width/10,
                  height: height/20,
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

                  child: Image.asset("images/patientInfo.png",color: primaryColor,width: width/30,),

                ),
                Container(
                  width: width/1.2,
                  height: height/20,
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

                  child:Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Save A Copy To",style: TextStyle(fontSize: 13,color: searchbarIconColor.withOpacity(.5)),),
                        Icon(Icons.arrow_drop_down,color: primaryColor,size: width/18,),
                      ],
                    ),

                  ),

                ),
              ],
            ),




            SizedBox(height: height/50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width/10,
                  height: height/20,
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
                          height: height/20,
                          alignment: Alignment.center,
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
                                    padding: EdgeInsets.symmetric(horizontal: width/50),
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Additional Links",style: TextStyle(fontSize: 13,color: searchbarIconColor.withOpacity(.5)),),

                                        Icon(Icons.add,color: primaryColor,size: width/30,),
                                      ],
                                    ),
                                  ),




                        ),



              ],
            ),




            SizedBox(height: height/50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width/10,
                  height: height/12,
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

                  child: Image.asset("images/patientInfo.png",color: primaryColor,width: width/30,),

                ),
                Container(
                  width: width/1.2,
                  height: height/12,
                  alignment: Alignment.center,
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

                  child:Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/50),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Notes (if any)",style: TextStyle(fontSize: 13,color: searchbarIconColor.withOpacity(.5)),

                        ),
                     ],
                   ),
                  ),

                ),
              ],
            ),




            SizedBox(height: height/50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width/10,
                  height: height/20,
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

                  child: Image.asset("images/patientInfo.png",color: primaryColor,width: width/30,),

                ),
                Container(
                  width: width/1.2,
                  height: height/20,
                  alignment: Alignment.center,
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

                  child:Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/80),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [

                         Text("Share with (enter email addresses)", textAlign: TextAlign.start,
                           style: TextStyle(fontSize: 13,color: searchbarIconColor.withOpacity(.5)),),

                         Icon(Icons.lock,color: primaryColor,size: width/30,)

                       ],

                    ),




                  ),

                ),
              ],
            ),


           SizedBox(height: height/20,),

           Column(

             mainAxisAlignment: MainAxisAlignment.end,
             children: [

               addDocumentDetailsButtons(isMainButton: true,width: width,height: height),

               addDocumentDetailsButtons(isMainButton: false,width: width,height: height),


             ],


           )



          ],
        ));
  }
}
