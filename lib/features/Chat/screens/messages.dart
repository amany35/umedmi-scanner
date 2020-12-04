import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/Chat/widgets/conversationwidget.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

import '../helper/chat_modellist.dart';
import '../helper/message_modellist.dart';
import '../model/chat_model.dart';
import '../model/message_model.dart';
import 'conversation.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  List<Chat_Model> chatModel_List = new List<Chat_Model>();

  List<Message_Model> messageModel_List = new List<Message_Model>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    chatModel_List=getchatModelList();

    messageModel_List=getMessageModelList();


  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: accentColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height/50),
        child: ListView.builder(
          itemCount: chatModel_List.length,
          itemBuilder: (context,position){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: height/50),
              child: Column(
                children: [

                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:width/12),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/40),
                          child: GestureDetector(
                            onTap: (){

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>Conversation(
                                    userName: chatModel_List[position].userName,
                                    userPhotoUrl: chatModel_List[position].userPhotoUrl[0],isGroup: chatModel_List[position].isGroup,),
                                ),
                              );

                            },
                            child: Container(
                              width: width,
                              height: height/10,
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(left:width/10),
                                child: ListTile(

                                  title: Container(
                                    width: width/3,
                                    alignment: Alignment.center,
                                    child: Row(

                                      children: [
                                        chatModel_List[position].userPhotoUrl.length==1?
                                        CircleAvatar(
                                            backgroundColor: accentColor,
                                            child: Image.asset(chatModel_List[position].userPhotoUrl[0], width: width/10,height: height/10))
                                            :Container(
                                          width: width/5,
                                          height: height/20,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount:3,
                                              itemBuilder: (context,index){
                                                return CircleAvatar(
                                                  backgroundColor: accentColor,
                                                  child: Image.asset(chatModel_List[position].userPhotoUrl[index],
                                                    width: width/10,height: height/10,),
                                                );
                                              }),
                                        ),
                                        SizedBox(width: width/70,),
                                        Container(
                                          width: width/2.5,
                                          child: Text(chatModel_List[position].userName,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12,color: primaryColor),),
                                        ),

                                      ],


                                    ),
                                  ),

                                  subtitle: Padding(
                                    padding: EdgeInsets.all(0),

                                  ),

                                ),
                              ),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(20)
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/40),
                          child: Container(
                            width: width/6,
                            height: height/10,
                            alignment: Alignment.center,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(50)
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
                            child: Image.asset(
                              "images/"+chatModel_List[position].chatType+".png",
                              width: width/20,
                            ),

                          ),
                        ),
                      ),


                    ],
                  ),



                  Padding(
                    padding: EdgeInsets.only(top:height/50,bottom: height/50),
                    child: Container(
                        width: width/1.5,
                        height: height/50,
                        child: Text("This is the very beginning of this thread",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: chatsTimeColor,fontSize: 14),)),
                  ),


                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/50),
                    child: Container(
                          width: width/1,
                          height: height/2.5,

                          child: ConversationWidget(length: 3,messageModel_List: messageModel_List,
                            userName: chatModel_List[position].userName,userPhotoUrl:chatModel_List[position].userPhotoUrl[0],),

                        ),
                  ),



                    Padding(
                      padding: EdgeInsets.only(top:height/100),
                      child: Container(
                          width: width/1,
                          height: height/6,
                          child: Column(
                            children: [
                              FlatButton(
                          child: Text("Open Conversation",style: TextStyle(color: primaryColor,fontSize: 14),),
                          onPressed: (){

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) =>Conversation(
                                  userName: chatModel_List[position].userName,
                                    userPhotoUrl: chatModel_List[position].userPhotoUrl[0],isGroup: chatModel_List[position].isGroup,),
                            ),
                            );
                          },
                              ),
                              Container(
                                width: width/1.2,
                                height: height/15,
                                decoration: new BoxDecoration(
                                  color: Colors.white.withOpacity(.1),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(.1),
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
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width/30,vertical: height/80),
                                  child: Text("Reply to this thread..",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 15,color: searchbarIconColor),),
                                ),
                                ),

                            ],
                          )),
                    ),

                ],
              ),




            );




          },



        ),


      ),
    );
  }
}
