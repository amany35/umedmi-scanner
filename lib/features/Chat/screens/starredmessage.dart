import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

import '../helper/message_modellist.dart';
import '../model/message_model.dart';
import '../widgets/staredmessages.dart';


class StarredMessages extends StatefulWidget {


  @override
  _StarredMessagesState createState() => _StarredMessagesState();
}

class _StarredMessagesState extends State<StarredMessages> {



  List<Message_Model> messageModel_List = new List<Message_Model>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    messageModel_List=getMessageModelList();


  }



  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(

      backgroundColor: accentColor,
      appBar: AppBar(

        backgroundColor: accentColor,
        elevation: 0,
        toolbarHeight: height/10,
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios,size: width/30,color: fontColor,),
          onTap: (){

            Navigator.pop(context);

          },

        ),

        title: Text("Stared Messages",style: TextStyle(fontSize: 18,color: fontColor),textAlign: TextAlign.center,)


      ),
      body:Stack(
        children: [
          staredMessages(width,height,messageModel_List,4),


        ],
      ),


    );
  }
}


