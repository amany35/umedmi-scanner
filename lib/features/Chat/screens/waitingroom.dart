import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class WaitingRoom extends StatefulWidget {
  @override
  _WaitingRoomState createState() => _WaitingRoomState();
}

class _WaitingRoomState extends State<WaitingRoom> {


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;




    return Scaffold(
      backgroundColor: accentColor,
      appBar: AppBar(
        centerTitle: true,
        title:Text("Waiting Room",style: TextStyle(color: fontColor,fontSize: 20),),

        //title: Text("Add people to chat",style: TextStyle(color: fontColor,fontSize: 20),),
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


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/30),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context,position){

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/80),
                    child: ListTile(

                      leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: width/15,
                          child: Image.asset("images/person.png",width: width/15,)),

                      title: Text("Peter Parker",style: TextStyle(fontSize: 16,color: fontColor)),

                      trailing: Text("Admit",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: callnowlBtnColor)),

                    ),
                  ),

                  Divider(),

                ],
              );


            }),
      ),

    );
  }
}
