import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../helper/chat_modellist.dart';
import '../model/chat_model.dart';
import '../widgets/selectpeople.dart';

class SendTo extends StatefulWidget {
  @override
  _SendToState createState() => _SendToState();
}

class _SendToState extends State<SendTo> {

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


   buttonFunction(){


   }

    return Scaffold(
      backgroundColor: accentColor,
      appBar: AppBar(
        centerTitle: true,
        title:Text("Send To",style: TextStyle(color: fontColor,fontSize: 20),),

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


      body: SelectPeople(width,height,chatModel_List,"Send",buttonFunction),

    );
  }
}
