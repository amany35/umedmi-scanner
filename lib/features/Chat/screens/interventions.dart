import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class Interventions extends StatefulWidget {
  @override
  _InterventionsState createState() => _InterventionsState();
}

class _InterventionsState extends State<Interventions> {


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
        toolbarHeight: height/20,
        centerTitle: true,


        title: !shareFile?Text("Interventions",style: TextStyle(fontSize: 18,color: fontColor,fontWeight: FontWeight.bold)
          ,textAlign: TextAlign.center,)
        :Text(""),

        leading:

        GestureDetector(

            onTap: (){

              Navigator.pop(context);


            },
            child: Text("Cancel",style: TextStyle(fontSize: 14,color: cancelBtnColor),textAlign: TextAlign.start,)),



      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/30),
        child: Stack(

          children: [






            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/30,vertical: height/30),
              child: Container(
                width: width,
                height: height,
                child: !shareFile?ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context,position){

                      return Column(
                        children: [
                          Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Row(
                                children: [
                                  Icon(Icons.link,color: primaryColor,size: width/20,),

                                  SizedBox(width: width/40,),

                                  Text("Url Document",style: TextStyle(fontSize: 15,color: fontColor)),
                                ],
                              ),



                              Padding(
                                padding: EdgeInsets.only(top:width/20),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(Icons.radio_button_unchecked,size: width/30,color: searchbarIconColor,),

                                  ),
                                ),
                              ),

                            ],

                          ),

                          Divider(),

                        ],
                      );


                    })


                    : ListView(

                  children: [

                    Container(

                      width: width/3,
                      height: height/4,

                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.transparent,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],

                      ),

                      child: Icon(Icons.insert_drive_file,size: width/2,color: fontColor,),

                    ),


                    ListTile(

                      title: Text("File Name",
                        textAlign: TextAlign.center,style: TextStyle(color: fontColor,fontSize: 16),),

                      subtitle: Text("Made on 12/3/2020",
                      textAlign: TextAlign.center,style: TextStyle(color: fontColor.withOpacity(.5),fontSize: 14),),
                      
                      
                      trailing: Container(
                        width: width/3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Image.asset("images/note.png",color: primaryColor,width: width/25,),

                            Icon(Icons.share,color: primaryColor,size: width/20,),

                            Icon(Icons.bookmark_border,color: primaryColor,size: width/20,),


                          ],

                        ),
                      ),

                    )


                  ],

                )
              ),
            ),





            !shareFile?Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(top:height/50,bottom:height/80),
                child: GestureDetector(
                  onTap: (){

                    setState(() {

                      shareFile=true;

                    });


                  },
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

                      child: Center(child: Text("Share",
                        textAlign: TextAlign.center,style: TextStyle(color: accentColor),))),
                ),
              ),
            ):Text(""),






          ],



        ),
      ),

    );
  }
}
