
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:umedmiscanner/features/Chat/screens/add_note.dart';
import 'package:umedmiscanner/features/Chat/screens/choose_patient.dart';
import 'package:umedmiscanner/features/Chat/screens/interventions.dart';
import 'package:umedmiscanner/features/Chat/screens/share_files.dart';
import 'package:umedmiscanner/features/Chat/screens/show_participants.dart';
import 'package:umedmiscanner/features/Chat/screens/waitingroom.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

import 'conversation.dart';

class CallNow extends StatefulWidget {

  final String userPhotoUrl,userName;


  final List messageModel_List;

  final bool isShareFile;

  const CallNow({Key key, this.userPhotoUrl,this.userName, this.messageModel_List, this.isShareFile=false}) : super(key: key);
  @override
  _CallNowState createState() => _CallNowState();
}

class _CallNowState extends State<CallNow> {


  bool startCallisSwitched_one=false;
  bool startCallisSwitched_two=false;

  bool showSettingisSwitched_one=false;
  bool showSettingisSwitched_two=false;
  bool showSettingisSwitched_three=false;

  bool _startCall = false;

  bool _startVideoCall = false;

  bool _mic_on = false;

  bool showMore = false;

  bool _open_chat=false;

  List <ShareFileMenuButton> shareFileMenuButtons =[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    shareFileMenuButtons=getShareFileMenuButtons();

  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;




    showSetting(){

      showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0)
            ),
          ),
          context: context,
          builder: (context) =>
              Container(

                height: height/2,
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),

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

                child:Padding(
                  padding: EdgeInsets.symmetric(vertical: height/100),
                  child:Container(
                    width: width,
                    height: height/3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        SizedBox(height: height/50,),


                        ListTile(

                          title: Text("Participants can invite others",style: TextStyle(fontSize: 15,color: fontColor),),

                          trailing: FlutterSwitch(
                            height: height/35,
                            width: width/10,
                            padding: 4.0,
                            toggleSize: 20.0,
                            borderRadius: 50.0,
                            inactiveColor: switchinactiveColor,
                            activeColor: primaryColor,
                            value: showSettingisSwitched_one,
                            onToggle: (value) {
                              setState(() {
                                showSettingisSwitched_one= value;
                              });
                            },
                          ),

                        ),


                        SizedBox(height: height/50,),

                        ListTile(

                          title: Text("Allow Waiting Room",style: TextStyle(fontSize: 15,color: fontColor),),

                          trailing: FlutterSwitch(
                            height: height/35,
                            width: width/10,
                            padding: 4.0,
                            toggleSize: 20.0,
                            borderRadius: 50.0,
                            inactiveColor: switchinactiveColor,
                            activeColor: primaryColor,
                            value: showSettingisSwitched_two,
                            onToggle: (value) {
                              setState(() {
                                showSettingisSwitched_two = value;
                              });
                            },
                          ),

                        ),

                        SizedBox(height: height/50,),

                        ListTile(

                          title: Text("Allow Waiting Room",style: TextStyle(fontSize: 15,color: fontColor),),

                          trailing: FlutterSwitch(
                            height: height/35,
                            width: width/10,
                            padding: 4.0,
                            toggleSize: 20.0,
                            borderRadius: 50.0,
                            inactiveColor: switchinactiveColor,
                            activeColor: primaryColor,
                            value: showSettingisSwitched_three,
                            onToggle: (value) {
                              setState(() {
                                showSettingisSwitched_three = value;
                              });
                            },
                          ),

                        ),


                        Padding(
                          padding: EdgeInsets.only(top:height/50,bottom:height/80),
                          child: Container(
                              width: width/1.3,
                              height: height/20,
                              alignment: Alignment.center,

                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],

                              ),

                              child: Center(child: Text("Save",
                                textAlign: TextAlign.center,style: TextStyle(color: accentColor),))),
                        ),




                      ],
                    ),
                  ),
                ),
              )

      );



    }



    showslidingbottomSheet(route){


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
                      padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/40),
                      child: route,
                    ),
                  ),
                );
              },
            );
          }
      );


    }









   callIsStarted(){

     return Padding(
       padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/30),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         mainAxisSize: MainAxisSize.min,
         children: [


           Row(

             mainAxisAlignment: MainAxisAlignment.end,

             children: [

               showMore?Padding(
                 padding: EdgeInsets.symmetric(horizontal: width/50),
                 child: Column(
                         children: [

                           GestureDetector(

                             onTap:(){

                               showSetting();

                             },

                             child: Container(
                                 width: width/12,
                                 height: height/25,
                                 decoration: BoxDecoration(
                                   color: Colors.white70.withOpacity(0.2),
                                   borderRadius: BorderRadius.all(
                                     Radius.circular(50),

                                   ),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.white70.withOpacity(0.3),
                                       spreadRadius: 2,
                                       blurRadius: 7,
                                       offset: Offset(0, 3), // changes position of shadow
                                     ),
                                   ],
                                 ),

                                 child:Icon(Icons.settings,color: fontColor,size: width/20,)),
                           ),

                           SizedBox(height: height/50,),

                           GestureDetector(

                             onTap: (){

                               showslidingbottomSheet(ChoosePatient());

                             },

                             child: Container(
                                 width: width/12,
                                 height: height/25,
                                 decoration: BoxDecoration(
                                   color: Colors.white70.withOpacity(0.2),
                                   borderRadius: BorderRadius.all(
                                     Radius.circular(50),

                                   ),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.white70.withOpacity(0.3),
                                       spreadRadius: 2,
                                       blurRadius: 7,
                                       offset: Offset(0, 3), // changes position of shadow
                                     ),
                                   ],
                                 ),

                                 child:Image.asset("images/patientInfo.png",color: fontColor,width: width/30,)),
                           ),

                           SizedBox(height: height/50,),


                           GestureDetector(

                             onTap: (){

                               showslidingbottomSheet(ShareFiles(userName: widget.userName,
                                 userPhotoUrl: widget.userPhotoUrl,messageModel_List: widget.messageModel_List,));

                             },

                             child: Container(
                                 width: width/12,
                                 height: height/25,
                                 decoration: BoxDecoration(
                                   color: Colors.white70.withOpacity(0.2),
                                   borderRadius: BorderRadius.all(
                                     Radius.circular(50),

                                   ),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.white70.withOpacity(0.3),
                                       spreadRadius: 2,
                                       blurRadius: 7,
                                       offset: Offset(0, 3), // changes position of shadow
                                     ),
                                   ],
                                 ),

                                 child:Icon(Icons.insert_drive_file,color: fontColor,size: width/20,)),
                           ),

                         ],
                       ),

               ):Text(""),

             ],
           ),

           Padding(
             padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/50),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [

                 GestureDetector(
                   onTap:(){

                     showslidingbottomSheet(AddNote());

                     },
                   child: Container(
                     width: width/8,
                     height: height/15,
                     decoration: BoxDecoration(
                       color: Colors.black12.withOpacity(0.2),
                       borderRadius: BorderRadius.all(
                         Radius.circular(20),

                       ),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.white70.withOpacity(0.3),
                           spreadRadius: 2,
                           blurRadius: 7,
                           offset: Offset(0, 3), // changes position of shadow
                         ),
                       ],
                     ),
                     child: CircleAvatar(
                         backgroundColor: Colors.transparent,
                         child: Image.asset("images/note.png",width: width/15,color: accentColor,)),
                   ),
                 ),

       GestureDetector(

         onTap: (){

           Navigator.pop(context);

         },

         child: Container(
         width: width/5,
           height: height/10,
           decoration: BoxDecoration(
               color: cancelBtnColor,
               borderRadius: BorderRadius.all(
                 Radius.circular(50),

               ),

           ),
               child: Icon(Icons.call_end,color: accentColor,size: width/10,),
               ),
       ),


                     GestureDetector(
                         onTap: (){

                           setState(() {

                             showMore?showMore=false:showMore=true;

                           });

                         },
                         child: Container(

                             width: width/9,
                             height: height/15,

                             child: Image.asset("images/Robot2.png",width: width/5,))),


               ],
             ),
           ),



           Padding(
             padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/50),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [

                 GestureDetector(
                   onTap:(){

                     setState(() {

                       _startVideoCall?_startVideoCall=false:_startVideoCall=true;

                     });

                   },
                   child: Container(
                     width: width/8,
                     height: height/15,
                     decoration: BoxDecoration(
                       color: Colors.black12.withOpacity(0.2),
                       borderRadius: BorderRadius.all(
                         Radius.circular(20),

                       ),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.white70.withOpacity(0.3),
                           spreadRadius: 2,
                           blurRadius: 7,
                           offset: Offset(0, 3), // changes position of shadow
                         ),
                       ],
                     ),
                     child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                         child: Icon(_startVideoCall?Icons.videocam:Icons.videocam_off,size: width/15,color: accentColor,)),
                   ),
                 ),

                 GestureDetector(
                   onTap: (){

                     setState(() {

                       _mic_on?_mic_on=false:_mic_on=true;

                     });

                   },
                   child: Container(
                     width: width/8,
                     height: height/15,
                     decoration: BoxDecoration(
                       color: Colors.black12.withOpacity(0.2),
                       borderRadius: BorderRadius.all(
                         Radius.circular(20),

                       ),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.white70.withOpacity(0.3),
                           spreadRadius: 2,
                           blurRadius: 7,
                           offset: Offset(0, 3), // changes position of shadow
                         ),
                       ],
                     ),
                     child: CircleAvatar(
                         backgroundColor: Colors.transparent,
                         child: Icon(_mic_on?Icons.mic:Icons.mic_off,size: width/15,color: accentColor,)),
                   ),
                 ),

                 Container(
                   width: width/8,
                   height: height/15,
                   decoration: BoxDecoration(
                     color: Colors.black12.withOpacity(0.2),
                     borderRadius: BorderRadius.all(
                       Radius.circular(20),

                     ),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.white70.withOpacity(0.3),
                         spreadRadius: 2,
                         blurRadius: 7,
                         offset: Offset(0, 3), // changes position of shadow
                       ),
                     ],
                   ),
                   child: CircleAvatar(
                       backgroundColor: Colors.transparent,
                       child: Image.asset("images/smartphone.png",width: width/20,color: accentColor,)),
                 ),

                 GestureDetector(
                   onTap: (){

                     showslidingbottomSheet(Conversation(
                       userName: widget.userName,userPhotoUrl: widget.userPhotoUrl),
                     );


                   },
                   child: Container(
                     width: width/8,
                     height: height/15,
                     decoration: BoxDecoration(
                       color: Colors.black12.withOpacity(0.2),
                       borderRadius: BorderRadius.all(
                         Radius.circular(20),

                       ),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.white70.withOpacity(0.3),
                           spreadRadius: 2,
                           blurRadius: 7,
                           offset: Offset(0, 3), // changes position of shadow
                         ),
                       ],
                     ),
                     child: CircleAvatar(
                         backgroundColor: Colors.transparent,
                         child: Image.asset("images/chat_bubble.png",width: width/15,color: accentColor,)),
                   ),
                 ),




                 GestureDetector(
                   onTap: (){



                     showslidingbottomSheet(ShowParticipants());


                   },
                   child: Container(
                     width: width/8,
                     height: height/15,
                     decoration: BoxDecoration(
                       color: Colors.black12.withOpacity(0.2),
                       borderRadius: BorderRadius.all(
                         Radius.circular(20),

                       ),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.white70.withOpacity(0.3),
                           spreadRadius: 2,
                           blurRadius: 7,
                           offset: Offset(0, 3), // changes position of shadow
                         ),
                       ],
                     ),
                     child: CircleAvatar(
                         backgroundColor: Colors.transparent,
                         child: Image.asset("images/room.png",width: width/15,color: accentColor,)),
                   ),
                 ),





               ],
             ),
           )

         ],

       ),
     );


   }



    startCall(){

      return Container(

        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
            bottomRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),

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

        child:Padding(
          padding: EdgeInsets.symmetric(vertical: height/100),
          child:Container(
            width: width,
            height: height/3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [

                SizedBox(height: height/50,),


                ListTile(

                  title: Text("Participants can invite others",style: TextStyle(fontSize: 15,color: fontColor),),

                  trailing: FlutterSwitch(
                    height: height/35,
                    width: width/10,
                    padding: 4.0,
                    toggleSize: 20.0,
                    borderRadius: 50.0,
                    inactiveColor: switchinactiveColor,
                    activeColor: primaryColor,
                    value: startCallisSwitched_one,
                    onToggle: (value) {
                      setState(() {
                        startCallisSwitched_one = value;
                      });
                    },
                  ),

                ),


                SizedBox(height: height/50,),

                ListTile(

                  title: Text("Allow Waiting Room",style: TextStyle(fontSize: 15,color: fontColor),),

                  trailing: FlutterSwitch(
                    height: height/35,
                    width: width/10,
                    padding: 4.0,
                    toggleSize: 20.0,
                    borderRadius: 50.0,
                    inactiveColor: switchinactiveColor,
                    activeColor: primaryColor,
                    value: startCallisSwitched_two,
                    onToggle: (value) {
                      setState(() {
                        startCallisSwitched_two = value;
                      });
                    },
                  ),

                ),



                GestureDetector(
                  onTap: (){

                    setState(() {
                      _startCall=true;
                    });


                  },
                  child: Padding(
                    padding: EdgeInsets.only(top:height/50,bottom:height/80),
                    child: Container(
                        width: width/1.3,
                        height: height/20,
                        alignment: Alignment.center,

                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],

                        ),

                        child: Center(child: Text("Start Call",
                          textAlign: TextAlign.center,style: TextStyle(color: accentColor),))),
                  ),

                )


              ],
            ),
          ),
        ),
      );

    }


    return Stack(
      children: [

        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage(widget.userPhotoUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: new BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: new Container(
              decoration: new BoxDecoration(color: Colors.black.withOpacity(0.3)),
            ),
          ),
        ),


        Scaffold(

          backgroundColor: widget.isShareFile?accentColor:Colors.transparent,
          body: Stack(
            children: [
              Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  !widget.isShareFile?ListTile(
                    title: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(widget.userPhotoUrl),
                      radius: width/5,
                    ),

                    subtitle: Padding(
                      padding: EdgeInsets.symmetric(vertical: height/50),
                      child: Text(
                          widget.userName,style: TextStyle(fontSize: 24,color: accentColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                      ),
                    ),)
                      :   Center(
                        child: Wrap(
                    runSpacing: 20.0,
                    spacing: 20.0,
                    children: shareFileMenuButtons.map<Widget>((buttonPhoto){

                        return GestureDetector(

                          onTap: (){

                            showslidingbottomSheet(Interventions());


                          },

                          child: Stack(
                            children: [
                              Container(
                                  width: width/4,
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
                                  width: width/4,
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
                                    child: Image.asset(
                                      buttonPhoto.imageUrl,width: width/5,height: height/5,color: fontColor,),
                                  )),
                            ],
                          ),
                        );

                    }).toList(),),
                      ),





                ],



              ),


              Align(
                alignment: Alignment.bottomCenter,
                child: widget.isShareFile?callIsStarted():_startCall?callIsStarted():startCall(),
              ),


              Align(
                alignment: Alignment.topRight,
                child: _startVideoCall?Padding(
                  padding: EdgeInsets.symmetric(vertical: height/30,horizontal: width/40),
                  child: Container(
                      width: width/3,
                      height: height/4,
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],

                      ),
                    child: Stack(
                      children: [

                        Align(
                            alignment: Alignment.topCenter,
                            child:CircleAvatar(
                              backgroundColor: searchbarIconColor,
                              child: Image.asset("images/switch-camera.png",width: width/20,),
                            )
                            ),

                        Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: height/50,horizontal: width/50),
                              child: Icon(Icons.close,size: width/30,color: accentColor,),
                            )),

                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: height/50,horizontal: width/50),
                              child: Text("Your camera is turned off",textAlign: TextAlign.center,style: TextStyle(color: accentColor,fontSize: 15),),
                            )),
                      ],
                    ),
              ),
                ):Text(""))

            ],
          ),

        ),
      ],
    );
  }
}


class ShareFileMenuButton {

  String imageUrl;


}

List <ShareFileMenuButton> getShareFileMenuButtons(){

  String baseUrl="images/";

  List <ShareFileMenuButton> shareFileMenuButtons =[];

  ShareFileMenuButton shareFileMenuButton = new ShareFileMenuButton();

  shareFileMenuButton.imageUrl= baseUrl+"patientInfo.png";

  shareFileMenuButtons.add(shareFileMenuButton);


  shareFileMenuButton = new ShareFileMenuButton();

  shareFileMenuButton.imageUrl= baseUrl+"stethoscope.png";

  shareFileMenuButtons.add(shareFileMenuButton);


  shareFileMenuButton = new ShareFileMenuButton();

  shareFileMenuButton.imageUrl= baseUrl+"doctor.png";

  shareFileMenuButtons.add(shareFileMenuButton);


  shareFileMenuButton = new ShareFileMenuButton();

  shareFileMenuButton.imageUrl= baseUrl+"referral.png";

  shareFileMenuButtons.add(shareFileMenuButton);


  shareFileMenuButton = new ShareFileMenuButton();

  shareFileMenuButton.imageUrl= baseUrl+"intervention.png";

  shareFileMenuButtons.add(shareFileMenuButton);

  shareFileMenuButton = new ShareFileMenuButton();

  shareFileMenuButton.imageUrl= baseUrl+"report.png";

  shareFileMenuButtons.add(shareFileMenuButton);

  return shareFileMenuButtons;
}