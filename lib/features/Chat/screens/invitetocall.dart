import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class InviteToCall extends StatefulWidget {
  @override
  _InviteToCallState createState() => _InviteToCallState();
}

class _InviteToCallState extends State<InviteToCall> {


  bool shareFile = false;



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

        title: Text("Choose Patient",style: TextStyle(fontSize: 18,color: fontColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

        leading:

        GestureDetector(

            onTap: (){

              Navigator.pop(context);


            },
            child: Text("Cancel",style: TextStyle(fontSize: 14,color: cancelBtnColor),textAlign: TextAlign.start,)),



      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            mainAxisSize: MainAxisSize.max,

            children: [

              SizedBox(height: height/30,),
              Text("Invite To Call",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: fontColor),),
              SizedBox(height: height/30,),

              Container(
                width: width/5,
                height: height/10,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  border: Border.all(
                      color: searchbarIconColor,
                      width: 2.0
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(30.0)  //                 <--- border radius here
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
                ),


              ),

              SizedBox(height: height/30,),


              Text("Share this QR Code with people to join the call",style: TextStyle(fontSize: 12,color: fontColor),),

              SizedBox(height: height/30,),


              Text("Share",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: primaryColor),),

              SizedBox(height: height/30,),

            ],

          ),
        )
      ),

    );
  }
}
