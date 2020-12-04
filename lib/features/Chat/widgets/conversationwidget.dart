import 'dart:async';

import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_anywhere_menus/flutter_anywhere_menus.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/Chat/screens/callnow.dart';
import 'package:umedmiscanner/features/Chat/screens/sendto.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../model/message_model.dart';
final String baseUrl="images/";



class ConversationWidget extends StatefulWidget {


  final int length;
  final List<Message_Model> messageModel_List;
  final String userName,userPhotoUrl;

  const ConversationWidget({Key key, this.length, this.messageModel_List, this.userName, this.userPhotoUrl}) : super(key: key);


  @override
  _ConversationWidgetState createState() => _ConversationWidgetState();
}

class _ConversationWidgetState extends State<ConversationWidget> {



  bool isSwitched_one=false;
  bool isSwitched_two=false;

  int messagePosition;

  var messageRadius,messageColor;

  bool isReplied=false;

  ScrollController _listViewController = new ScrollController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    SchedulerBinding.instance.addPostFrameCallback((_) {
     // _listViewController.jumpTo(_listViewController.position.maxScrollExtent);

      _listViewController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
      );

    });


  }


  
  pollMessage(width,height){

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width/100),
          child: Container(
            height: height/20,
            width: width/1,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              color: searchbarIconColor.withOpacity(.5),
              border: Border.all(
                  color: Colors.grey.withOpacity(.1),
                  width: 2.0
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(50.0)  //                 <--- border radius here
              ),


            ),

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width/80),
                child: Text("Poll Subject",overflow: TextOverflow.ellipsis,textAlign:TextAlign.center,style: TextStyle(fontSize: 12
                    ,color: fontColor),

            ),
              ),


          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: height/50),
          child: ExpandChild(
            arrowColor: Colors.black,
            child: Container(
                width: width/1,
                height: height/4,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context,position){

                    return  Container(
                        width: width/10,
                          height: height/13,
                          alignment: Alignment.center,

                          child: Padding(
                            padding: EdgeInsets.only(bottom: height/20),
                            child: ListTile(

                              /*leading: Container(
                                width: width/20,
                                height: height/30,
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
                                ),
                                child: Text((position+1).toString(),
                                  style: TextStyle(color: fontColor),
                                ),
                              ),*/




                              title: LinearPercentIndicator(
                                width: width/3,
                                lineHeight: height/30,
                                percent: (position)*0.2,
                                center: Text(
                                 "Option " +(position+1).toString(),style: TextStyle(fontSize: 12
                                    ,color: fontColor),

                                ),
                                trailing:Padding(
                                  padding: EdgeInsets.only(left: width/30),
                                  child: Text(
                                    ((position)*20).toString()+"%",
                                    style: new TextStyle(fontSize: 12.0,color: fontColor),
                                  ),
                                ),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor: searchbarIconColor.withOpacity(.5),
                                progressColor: primaryColor.withOpacity(.3),

                              ),


                            ),
                          )

                    );

                  },

                ),
              ),
          ),
        ),


      ],
    );
    
    
    
  }

  handleLikeMessage(position){


    bool _isLiked = widget.messageModel_List[position].isLiked == true;

    if(_isLiked){

      setState(() {

        _isLiked=false;
        widget.messageModel_List[position].isLiked = false;

      });

    }


    else if(!_isLiked){

      setState(() {

        _isLiked=true;
        widget.messageModel_List[position].isLiked = true;

        //showHeart =true;
      });



    }

  }

  handlePinMessage(position){


    bool _isPinned = widget.messageModel_List[position].isPinned == true;

    if(_isPinned){

      setState(() {

        _isPinned=false;
        widget.messageModel_List[position].isPinned = false;

      });

    }


    else if(!_isPinned){

      setState(() {

        _isPinned=true;
        widget.messageModel_List[position].isPinned = true;

        //showHeart =true;
      });



    }

  }





  handleStarMessage(position){


    bool _isStarted = widget.messageModel_List[position].isStarred == true;

    if(_isStarted){

      setState(() {

        _isStarted=false;
        widget.messageModel_List[position].isStarred = false;

      });

    }


    else if(!_isStarted){

      setState(() {

        _isStarted=true;
        widget.messageModel_List[position].isStarred = true;

        //showHeart =true;
      });


    }

  }


  handleEditMessage(position){


    bool _isEdited = widget.messageModel_List[position].isEdited == true;

    if(_isEdited){

      setState(() {

        _isEdited=false;
        widget.messageModel_List[position].isEdited = false;

      });

    }


    else if(!_isEdited){

      setState(() {

        _isEdited=true;
        widget.messageModel_List[position].isEdited = true;

      });

      Timer(Duration(milliseconds:2000),(){

        setState(() {
          setState(() {

            _isEdited=false;
            widget.messageModel_List[position].isEdited = false;

          });
        });

      });

    }

  }


  handleResponseToCall(position,callResponse){



 if(callResponse) {

   setState(() {
     widget.messageModel_List[position].isCallResponsed = true;

     widget.messageModel_List[position].isCallAccepted = true;
   });

 }else{

   setState(() {
     widget.messageModel_List[position].isCallResponsed = true;

     widget.messageModel_List[position].isCallAccepted = false;
   });

 }




  }


  handleCancelCall(position){



      setState(() {
        widget.messageModel_List[position].isCallResponsed = true;

        widget.messageModel_List[position].isCallRequestCanceled = true;
      });



      Navigator.pop(context);


  }



  handleReplyToMessage(width,height,position){


    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: Container(
        width: width,

        decoration: new BoxDecoration(
          color: accentColor,
          border: Border.all(
              color: accentColor,
              width: 2.0
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(20.0)  //                 <--- border radius here
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/80),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(widget.messageModel_List[position].isMe?"You":widget.userName,textAlign:TextAlign.start,
                          style: TextStyle(fontSize: 12
                              ,color: primaryColor,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),

                  !widget.messageModel_List[position].isReplied?Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(

                        onTap: (){

                          setState(() {

                            isReplied=false;

                          });

                        },

                        child: Icon(Icons.close,color: primaryColor,size: width/20,),
                        ),
                    ],
                  ):Text(""),

                ],
              ),
            ),
            GestureDetector(

                        child: widget.messageModel_List[position].messageType!="call_request"?Container(
                            width: width/1.2,

                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal:width/20,vertical: height/50),
                              child:  Container(
                                child: widget.messageModel_List[position].messageType=="text"?
                                Text(widget.messageModel_List[position].message,style: TextStyle(fontSize: 12
                                    ,color: fontColor)
                                  ,overflow: TextOverflow.ellipsis,maxLines: 1,)

                                :widget.messageModel_List[position].messageType=="file"?
                              Row(
                                  children: [
                                    Icon(Icons.attach_file,color: primaryColor,size: width/20,),
                                    SizedBox(width: width/50,),
                                    Text(widget.messageModel_List[position].message,style: TextStyle(fontSize: 12
                                        ,color: fontColor),),
                                  ],

                            )
                                    :widget.messageModel_List[position].messageType=="photo"?


                                    Row(

                                      children: [

                                        Icon(Icons.photo,color: searchbarIconColor,size: width/13,),

                                        SizedBox(width: width/50,),

                                        Text("Photo",style: TextStyle(fontSize: 12
                                            ,color: searchbarIconColor)
                                          ,overflow: TextOverflow.ellipsis,maxLines: 1,),

                                      ],

                                    )



                                    :widget.messageModel_List[position].messageType=="poll"?

                                Text("Poll Subject",style: TextStyle(fontSize: 12
                                    ,color: fontColor)
                                  ,overflow: TextOverflow.ellipsis,maxLines: 1,)


                                    :widget.messageModel_List[position].messageType=="voice_note"?Row(

                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.pause_circle_outline, color: primaryColor,
                                    ),
                                    SizedBox(width: width/50,),
                                    Image.asset(
                                      "images/voice-alt.png", width: width/20,
                                    ),
                                    Image.asset(
                                      "images/voice-alt-2.png", width: width/20,
                                    ),
                                    Image.asset(
                                      "images/voice-alt-2.png", width: width/20,
                                    )
                                  ],
                                ):Row(
                                  children: [
                                    Icon(Icons.location_on,color: primaryColor,size: width/20,),
                                    SizedBox(width: width/50,),
                                    Text(widget.messageModel_List[position].message,style: TextStyle(fontSize: 12
                                        ,color: fontColor),),
                                  ],
                                )
                              ),
                            )
                        ):Text("")




                    ),
          ],
        ),
      ),
    );

  }


  @override
  Widget build(BuildContext context) {


    var width = MediaQuery.of(context).size.width;

    var height = MediaQuery.of(context).size.height;


    callCancelRequestButtons(bool isMainButton,position){

      return GestureDetector(
        onTap: (){

          isMainButton?handleCancelCall(position):Navigator.pop(context);

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

              child: Center(child: Text(isMainButton?"Cancel Request":"Keep it",
                textAlign: TextAlign.center,style: TextStyle(color: isMainButton?accentColor:cancelBtnColor),))),
        ),

      );


    }

    cancelRequestButtonFunction(position){
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
        builder: (context) =>  Padding(
          padding: EdgeInsets.all(height/100),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              SizedBox(height: height/50,),

              Text("Cancel Request",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

              SizedBox(height: height/30,),

              Text("Are you sure you want to cancel your call request with "+widget.userName+" ?",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(fontSize: 12
                ),),


              callCancelRequestButtons(true,position),

              callCancelRequestButtons(false,position),

            ],
          ),
        ),);

    }



    return Stack(
      children: [
      ListView.builder(

        controller: _listViewController,

        itemCount: widget.length,

        reverse: true,
        shrinkWrap: true,

        itemBuilder: (context,position){


          final align = widget.messageModel_List[position].isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
          final color = widget.messageModel_List[position].isEdited?
          cancelBtnColor:widget.messageModel_List[position].isStarred?
          ratingColor:widget.messageModel_List[position].isMe?
          chatsTimeColor : messageNotMeColor;
          final radius = widget.messageModel_List[position].isMe?
          BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(0)
          ):BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(50)
          );

          final menuItems = [

            MenuItem(child: GestureDetector(
              onTap: (){

                handleLikeMessage(position);



              },
              child: Icon(Icons.thumb_up,color: widget.messageModel_List[position].isLiked?
                  Colors.blue:searchbarIconColor,size: width/30,),
            )),

            MenuItem(child: GestureDetector(
              onTap: (){

                handleStarMessage(position);

              },

              child: Image.asset(baseUrl+"star_grey.png",width: width/30,),
            )),

            MenuItem(child: GestureDetector(
                onTap: (){

                    handleEditMessage(position);

                },
                child: Icon(Icons.edit,color: primaryColor,size: width/30,))),

            MenuItem(child: GestureDetector(

                onTap: (){

                  handlePinMessage(position);


                },

                child: Image.asset(baseUrl+"tack.png",width: width/30,))),

            MenuItem(child: GestureDetector(

                onTap:(){

                  setState(() {

                    isReplied=true;

                    messagePosition=position;

                    messageRadius=radius;

                    messageColor=color;


                  });


                  },

                child: Image.asset(baseUrl+"reply_grey.png",width: width/30,))),

            MenuItem(child: GestureDetector(

                onTap:(){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>SendTo()
                      ));

               },

                child: Image.asset(baseUrl+"forward_grey.png",width: width/30,))),

          ];

          return Column(

            crossAxisAlignment: align,


            children: [

              Padding(

                padding: EdgeInsets.all(width/40),
                child: Column(

                  crossAxisAlignment: align,
                  mainAxisSize: MainAxisSize.min,

                  children: [
                        Menu(
                          menuBar: widget.messageModel_List[position].messageType!="call_request"?MenuBar(
                              drawArrow: true,
                              drawDivider: true,

                              backgroundColor: searchbarShadowColor,
                              itemPadding: EdgeInsets.all(width/60),
                              menuItems: menuItems
                          ):MenuBar(
                             menuItems: []
                          ),
                          child: Padding(
                            padding: widget.messageModel_List[position].isMe?EdgeInsets.only(left:width/4):EdgeInsets.only(right:width/4),
                            child: Container(
                              decoration:  widget.messageModel_List[position].isReplied?BoxDecoration(
                                color:color,
                                borderRadius: radius,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ):BoxDecoration(),

                              child: Column(

                                children: [

                                  widget.messageModel_List[position].isReplied?Padding(

                                    padding: EdgeInsets.symmetric(horizontal: width/20,vertical: height/50),
                                    child: handleReplyToMessage(width, height, 3),

                                  ):Text(""),

                                  GestureDetector(

                                    child: widget.messageModel_List[position].messageType!="call_request"?Container(


                                        decoration: BoxDecoration(
                                          color: color,
                                          borderRadius: radius,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal:width/20,vertical: height/50),
                                          child:  Container(
                                            width:width/1.2,
                                            child: widget.messageModel_List[position].messageType=="text"?
                                            Text(widget.messageModel_List[position].message,
                                              style: TextStyle(fontSize: 12
                                                  ,color: fontColor),)

                                            :widget.messageModel_List[position].messageType=="file"?
                                                ListTile(
                                                title: Icon(Icons.insert_drive_file,color: accentColor,size: width/5,),
                                                subtitle: Row(
                                                children: [
                                                Icon(Icons.attach_file,color: primaryColor,size: width/20,),
                                                SizedBox(width: width/50,),
                                                Text(widget.messageModel_List[position].message,style: TextStyle(fontSize: 12
                                                    ,color: fontColor),),
                                                ],
                                                )
                                                )

                                                :widget.messageModel_List[position].messageType=="photo"?

                                                 Padding(
                                                   padding: EdgeInsets.symmetric(horizontal: width/80),
                                                   child: Wrap(
                                                     runSpacing: 2.0,
                                                     spacing: 10.0,
                                                   children: widget.messageModel_List[position]
                                                       .messagePhotos.map<Widget>((photo){

                                                     return Image.asset(photo,width: width/7);

                                               }).toList(),),
                                                 )


                                                :widget.messageModel_List[position].messageType=="poll"?

                                                  pollMessage(width, height)



                                                :widget.messageModel_List[position].messageType=="voice_note"?Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.pause_circle_outline, color: primaryColor,
                                                ),
                                                SizedBox(width: width/50,),
                                                Image.asset(
                                                  "images/voice-alt.png", width: width/20,
                                                ),
                                                Image.asset(
                                                  "images/voice-alt-2.png", width: width/20,
                                                ),
                                                Image.asset(
                                                  "images/voice-alt-2.png", width: width/20,
                                                )
                                              ],
                                            ):ListTile(
                                              title: Image.asset("images/location_image.png"),
                                              subtitle: Row(
                                                children: [
                                                  Icon(Icons.location_on,color: primaryColor,size: width/20,),
                                                  SizedBox(width: width/50,),
                                                  Text(widget.messageModel_List[position].message,style: TextStyle(fontSize: 12
                                                      ,color: fontColor),),
                                                ],
                                              )
                                            ),
                                          ),
                                        )
                                    ):

                                        ListTile(

                                          title:  !widget.messageModel_List[position].isCallResponsed?Container(

                                              decoration: BoxDecoration(
                                              color: accentColor,
                                              borderRadius: radius,
                                                border: Border.all(
                                                    color: color,
                                                    width: 2.0
                                                ),
                                              boxShadow: [
                                              BoxShadow(
                                              color: accentColor,
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: Offset(0, 3), // changes position of shadow
                                              ),
                                              ],
                                              ),

                                            child:Padding(
                                              padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/50),
                                              child:  ListTile(
                                                leading: Icon(Icons.call,color: searchbarIconColor,size: width/20,),
                                                title:Text(widget.messageModel_List[position].messageType=="call_request"
                                                   && widget.messageModel_List[position].isMe?
                                                "You sent a call request to "+widget.userName:widget.userName+" sent you a call request."
                                                ,style: TextStyle(fontSize: 12
                                                      ,color: chatsPhoneIconColor),),
                                              ),
                                            ),
                                          ):Text(""),

                                          subtitle: Padding(

                                            padding: EdgeInsets.only(top: height/70),
                                            child: widget.messageModel_List[position].messageType=="call_request"&&widget.messageModel_List[position].isMe?
                                            !widget.messageModel_List[position].isCallResponsed?Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    cancelRequestButtonFunction(position);
                                                  },
                                                  child: Container(
                                                    width: width/3,
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
                                                        Text("Cancel Request",textAlign: TextAlign.center,style: TextStyle(fontSize: 10,color: accentColor),),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ):Container(

                                                decoration: BoxDecoration(
                                                color: accentColor,
                                                borderRadius: radius,
                                                border: Border.all(
                                                color: color,
                                                width: 2.0
                                                ),
                                                boxShadow: [
                                                BoxShadow(
                                                color: accentColor,
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: Offset(0, 3), // changes position of shadow
                                                ),
                                                ],
                                                ),

                                                child:Padding(
                                                padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/50),
                                                child:  ListTile(
                                                leading: Icon(Icons.call,color: searchbarIconColor,size: width/20,),
                                                title:Text(widget.messageModel_List[position].messageType=="call_request"&& widget.messageModel_List[position].isMe
                                                && widget.messageModel_List[position].isCallResponsed&& widget.messageModel_List[position].isCallRequestCanceled?
                                                "You canceled the call request from "
                                                    +widget.userName+" .":
                                                widget.messageModel_List[position].messageType=="call_request"&& widget.messageModel_List[position].isMe&&
                                                widget.messageModel_List[position].isCallResponsed && widget.messageModel_List[position].isCallAccepted?
                                                "You accepted the call request. "
                                                    +widget.userName+" will call you shortly."
                                                    :"You rejected the call request from "
                                                    +widget.userName+" ."
                                                ,style: TextStyle(fontSize: 12
                                                      ,color: chatsPhoneIconColor),),
                                                ),
                                                ),
                                                )
                                                :!widget.messageModel_List[position].isCallResponsed?Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                  onTap: (){

                                                    handleResponseToCall(position, false);
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
                                                        Text("Reject",textAlign: TextAlign.center,style: TextStyle(fontSize: 10,color: accentColor),),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: width/30,),
                                                GestureDetector(
                                                  onTap: (){

                                                    handleResponseToCall(position, true);
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
                                                        Text("Accept",textAlign: TextAlign.center,style: TextStyle(fontSize: 10,color: accentColor),),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ):ListTile(
                                              title: Container(

                                                decoration: BoxDecoration(
                                                  color: accentColor,
                                                  borderRadius: radius,
                                                  border: Border.all(
                                                      color: color,
                                                      width: 2.0
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: accentColor,
                                                      spreadRadius: 2,
                                                      blurRadius: 7,
                                                      offset: Offset(0, 3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),

                                                child:Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/50),
                                                  child:  ListTile(
                                                    leading: Icon(Icons.call,color: searchbarIconColor,size: width/20,),
                                                    title:Text(widget.messageModel_List[position].isCallAccepted?
                                                    widget.userName+
                                                    " accepted your call request.":widget.userName+" rejected your call request."
                                                      ,style: TextStyle(fontSize: 12
                                                          ,color: chatsPhoneIconColor),),

                                                  ),
                                                ),
                                              ),
                                      subtitle: Padding(
                                      padding: EdgeInsets.only(top: height/70),
                                      child: widget.messageModel_List[position].isCallAccepted?Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                      GestureDetector(
                                      onTap: (){

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>CallNow(
                                                userName: widget.userName,userPhotoUrl:widget.userPhotoUrl,messageModel_List: widget.messageModel_List,
                                          ),
                                        ));



                                      },
                                      child: Container(
                                      width: width/3,
                                      height: height/25,
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
                                      Text("Call now",textAlign: TextAlign.center,style: TextStyle(fontSize: 10,color: accentColor),),
                                      ],
                                      ),
                                      ),
                                      )
                                      ],
                                      ):Text(""))
                                            ),
                                          )
                                        )


                                  ),
                                ],
                              ),
                            )
                          ),
                        ),





                    widget.messageModel_List[position].isLiked||widget.messageModel_List[position].isPinned?Padding(
                      padding:EdgeInsets.all(width/80),
                      child: Align(
                        child: Row(
                          mainAxisAlignment: widget.messageModel_List[position].isMe?MainAxisAlignment.end:MainAxisAlignment.start,
                          children: [
                           widget.messageModel_List[position].isLiked?
                           Icon(Icons.thumb_up,color: Colors.blue,size: width/20,):Text(""),
                            widget.messageModel_List[position].isLiked?SizedBox(width: width/50,):Text(""),
                           widget.messageModel_List[position].isPinned?Image.asset(baseUrl+"tack.png",width: width/30,):Text(""),
                          ],
                        ),
                      ),
                    ):Text(""),


                    Padding(
                      padding:EdgeInsets.all(width/80),
                      child: Align(
                        child: Row(
                          mainAxisAlignment: widget.messageModel_List[position].isMe?MainAxisAlignment.end:MainAxisAlignment.start,
                          children: [
                            Text(widget.messageModel_List[position].time,style: TextStyle(fontSize: 12,color: chatsTimeColor),),
                            SizedBox(width: width/100,),
                            widget.messageModel_List[position].isseen?Icon(Icons.done_all,color: primaryColor,size: width/30,):Text(""),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],


          );



        },


      ),

        isReplied?Align(
          alignment: Alignment.bottomCenter,
          child:


                handleReplyToMessage(width, height, messagePosition),

        ):Text(""),



    ]);
  }
}
