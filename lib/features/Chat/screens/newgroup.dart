import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../helper/chat_modellist.dart';
import '../model/chat_model.dart';
import '../widgets/selectpeople.dart';
import 'conversation.dart';

class NewGroup extends StatefulWidget {
  @override
  _NewGroupState createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {

  List<Chat_Model> chatModel_List = new List<Chat_Model>();

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


    createGroupButton(){

      return GestureDetector(
        onTap: (){

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>Conversation(
                  userName: "Group Name",userPhotoUrl: chatModel_List[2].userPhotoUrl[0]),
            ),
          );

        },
        child: Padding(
          padding: EdgeInsets.only(top:height/80,bottom:height/80),
          child: Container(
              width: width/1.3,
              height: height/20,
              alignment: Alignment.center,

              decoration: BoxDecoration(),

              child: Center(child: Text("Create Group",
                textAlign: TextAlign.center,style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 18),))),
        ),

      );


    }



    buttonFunction(){
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
          padding: EdgeInsets.symmetric(vertical:height/50,horizontal: width/50),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              SizedBox(height: height/30,),

              Container(
                height: height/15,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  border: Border.all(
                      color: searchbarIconColor,
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
                  padding: EdgeInsets.all(height/100),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText:"Group Name",
                        hintStyle: TextStyle(fontSize: 15,color: searchbarIconColor),
                        border: InputBorder.none

                    ),
                  ),
                ),


              ),

              SizedBox(height: height/30,),
              createGroupButton(),

            ],
          ),
        ),);

    }


    return Scaffold(
      backgroundColor: accentColor,
      appBar: AppBar(
        centerTitle: true,
        title:Text("New Group",style: TextStyle(color: fontColor,fontSize: 20),),

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


      body: SelectPeople(width,height,chatModel_List,"Create Group",buttonFunction),

    );
  }
}
