import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/Chat/screens/invitetocall.dart';
import 'package:umedmiscanner/features/Chat/screens/waitingroom.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class ShowParticipants extends StatefulWidget {
  @override
  _ShowParticipantsState createState() => _ShowParticipantsState();
}

class _ShowParticipantsState extends State<ShowParticipants> {


  bool shareFile = false;



  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: accentColor,

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/100,vertical: height/100),
        child: Stack(
          children: [

            Padding(
              padding: EdgeInsets.only(top: height/30),
              child: Align(

                  alignment: Alignment.topCenter,
                  child: Text("Participants",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: fontColor),)),
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Align(

                  alignment: Alignment.topRight,
                  child: GestureDetector(

                    onTap: (){


                      Navigator.pop(context);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>InviteToCall()
                          ));

                    },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Icon(Icons.add,color: primaryColor,size: width/50,),
                        SizedBox(width: width/100,),
                        Text("Invite",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: primaryColor),),

                      ],
                    ),
                  )),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Align(

                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: (){

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>WaitingRoom()
                          ));

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Image.asset("images/hourglass.png",color: searchbarIconColor,width: width/50,),
                        SizedBox(width: width/100,),
                        Text("Waiting Room",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: searchbarIconColor),),

                      ],
                    ),
                  )),
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/30),
              child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context,position){

                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/80),
                          child: ListTile(

                            title: Text("Name",style: TextStyle(fontSize: 15,color: fontColor)),

                            trailing: Container(
                              width: width/3,
                              child: Row(

                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Image.asset("images/remove_from_call.png",color: cancelBtnColor,width: width/20,),

                                  Icon(Icons.mic_off,color: searchbarIconColor,size: width/20,),

                                  Icon(Icons.videocam_off,color: searchbarIconColor,size: width/20,),

                                  Image.asset("images/chat_bubble.png",color: primaryColor,width: width/20,)


                                ],
                              ),
                            ),

                          ),
                        ),

                        Divider(),

                      ],
                    );


                  }),
            ),
          ],
        ),
      ),

    );
  }
}
