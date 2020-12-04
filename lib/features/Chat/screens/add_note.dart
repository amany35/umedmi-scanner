import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: accentColor,

      appBar: AppBar(

        backgroundColor: accentColor,
        elevation: 0,
        toolbarHeight: height/20,
        centerTitle: true,


        title: Text("Add Note",style: TextStyle(fontSize: 18,color: fontColor),textAlign: TextAlign.center,),

        leading:

          GestureDetector(

              onTap: (){

                Navigator.pop(context);


              },
              child: Text("Cancel",style: TextStyle(fontSize: 14,color: cancelBtnColor),textAlign: TextAlign.start,)),



      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/40),
        child: ListView(

          children: [


            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/30,vertical: height/50),
              child: Container(
                height: height/1.5,
                alignment: Alignment.topLeft,
                decoration: new BoxDecoration(
                  color: searchbarIconColor.withOpacity(.3),
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)  //                 <--- border radius here
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
                child: Padding(
                  padding: EdgeInsets.all(height/100),
                  child: TextField(
                    maxLines: 50,
                    decoration: InputDecoration(
                        hintText:"Type here",
                        hintStyle: TextStyle(fontSize: 15,color: searchbarIconColor),
                        border: InputBorder.none

                    ),
                  ),
                ),


              ),
            ),



            GestureDetector(
            onTap: (){

            Navigator.pop(context);

            },
            child: Padding(
            padding: EdgeInsets.only(top:height/80,bottom:height/80),
            child: Container(
            width: width/1.3,
            height: height/20,
            alignment: Alignment.center,

            decoration: BoxDecoration(),

            child: Center(child: Text("Add Note",
            textAlign: TextAlign.center,style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 18),))),
            ),

            ),



          ],



        ),
      ),

    );
  }
}
