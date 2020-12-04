import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

import '../helper/chat_modellist.dart';
import '../model/chat_model.dart';
import 'conversation.dart';
import 'newaudiocall.dart';
import 'newconversation.dart';
import 'newgroup.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

  List<Chat_Model> chatModel_List = new List<Chat_Model>();
  bool isFabClicked=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    chatModel_List=getchatModelList();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: accentColor,

      body: Padding(
        padding: EdgeInsets.all(width/100),
        child: ListView.builder(

          itemCount: chatModel_List.length,
          itemBuilder: (context,position){

            return Padding(
              padding: EdgeInsets.all(width/50),
              child: Stack(
                children: [

                  Padding(
                    padding: EdgeInsets.only(left:width/12),
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
                        height: height/8,
                        child: Padding(
                          padding: EdgeInsets.only(left:width/10,top: height/80),
                          child: ListTile(

                                  title: Container(
                                    width: width/3,
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
                                    padding: EdgeInsets.only(top:width/80),
                                    child: Container(


                                    child:
                                    Stack(
                                      children: [
                                    chatModel_List[position].lastMessageType=="text"?Text(chatModel_List[position].lastMessage,
                                          maxLines: 1,
                                          style: TextStyle(color: fontColor),)
                                          : Row(
                                    children: [
                                    Icon(Icons.phone,size: width/30,color: searchbarIconColor,),
                                    SizedBox(width: width/80,),
                                    Text(chatModel_List[position].callTime,style: TextStyle(fontSize: 12),),
                                      SizedBox(height: height/80,),

                                    ],

                                  ),

                                        chatModel_List[position].newMessageNum!=0?Align(
                                          alignment: Alignment.topRight,
                                          child: CircleAvatar(
                                            radius: width/50,
                                            backgroundColor: newMessagesNumColor,
                                            child: Text(chatModel_List[position].newMessageNum.toString(),style: TextStyle(fontSize: 12,color: primaryColor),),),
                                        ):Text("")

                                      ],

                                    )

                                    ),
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: width/5.3,
                      height: height/8,
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


                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(width/70),
                      child: Text(chatModel_List[position].lastMessageTime,
                        style: TextStyle(fontSize: 12,color: chatsTimeColor),),
                    ),

                  )
                ],
              ),




            );


          },



        ),
      ),


      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          isFabClicked?FloatingActionButton(
            heroTag: "btn1",
            child: Icon(
                Icons.wifi_tethering,
                size: width/15,
                color:primaryColor
            ),
            backgroundColor: accentColor,
          ):Text(""),
          SizedBox(height: height/50,),
          isFabClicked?FloatingActionButton(
            heroTag: "btn2",
            child: Icon(
                Icons.phone,
                size: width/15,
                color:primaryColor
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>NewAudioCall())
              );
            },
            backgroundColor: accentColor,
          ):Text(""),
          SizedBox(height: height/50,),
          isFabClicked?FloatingActionButton(
            heroTag: "btn3",
            child: Image.asset(
                "images/group-chat.png",
                width: width/15,
                color:primaryColor
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>NewGroup())
              );
            },
            backgroundColor: accentColor,
          ):Text(""),
          SizedBox(height: height/50,),
          isFabClicked?FloatingActionButton(
            heroTag: "btn4",
            child: Image.asset(
                "images/interaction.png",
                width: width/15,
                color:primaryColor
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>NewConversation())
              );
            },
            backgroundColor: accentColor,
          ):Text(""),
          SizedBox(height: height/50,),
          FloatingActionButton(
            heroTag: "btn5",
            child: isFabClicked?Icon(
                Icons.close,
                size: width/15,
                color:unActiveTabbarColor
            ):Image.asset(
              "images/add.png",
              width: width/15,
              color:unActiveTabbarColor
              ),
            backgroundColor: primaryColor,
            onPressed: (){

              setState(() {

                isFabClicked?isFabClicked=false:isFabClicked=true;

              });

            },
          ),
        ],
      ),
    );
  }
}
