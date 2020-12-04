import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../helper/chat_modellist.dart';
import '../model/chat_model.dart';
import '../widgets/selectpeople.dart';

class NewAudioCall extends StatefulWidget {
  @override
  _NewAudioCallState createState() => _NewAudioCallState();
}

class _NewAudioCallState extends State<NewAudioCall> {

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


    callRequestButton(bool isMainButton){

      return GestureDetector(
        onTap: (){

          //buttonFunction();

          isMainButton?print(""):Navigator.pop(context);

        },
        child: Padding(
          padding: EdgeInsets.only(top:height/50,bottom:height/80),
          child: Container(
              width: width/1.3,
              height: height/20,
              alignment: Alignment.center,

              decoration: isMainButton?BoxDecoration(
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

              ):BoxDecoration(),

              child: Center(child: Text(isMainButton?"Submit Request":"Cancel",
                textAlign: TextAlign.center,style: TextStyle(color: isMainButton?accentColor:cancelBtnColor),))),
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
          padding: EdgeInsets.all(height/100),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              SizedBox(height: height/50,),

              Text("Call Request",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

              SizedBox(height: height/30,),

              Text("You are about to request a call with "+chatModel_List[0].userName+".\n "
                  "Once he accepted the request, you will be notified to join.",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(fontSize: 15),),


              callRequestButton(true),

              callRequestButton(false),

            ],
          ),
        ),);

    }




    return Scaffold(
      backgroundColor: accentColor,
      appBar: AppBar(
        centerTitle: true,
        title:Text("New Audio Call",style: TextStyle(color: fontColor,fontSize: 20),),

        //title: Text("Add people to chat",style: TextStyle(color: fontColor,fontSize: 20),),
        backgroundColor: accentColor,
        elevation: 0,
        toolbarHeight: height/15,
        leading: FlatButton(
          child: Icon(Icons.arrow_back_ios,size: width/30,),
          onPressed: (){

            Navigator.pop(context);

          },

        ),



      ),


      body: SelectPeople(width,height,chatModel_List,"Call",buttonFunction),

    );
  }
}
