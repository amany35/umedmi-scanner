import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class CreatePoll extends StatefulWidget {


  @override
  _CreatePollState createState() => _CreatePollState();
}

class _CreatePollState extends State<CreatePoll> {


  var arrow_downText = "Voting";



  @override
  void initState() {
    // TODO: implement initState
    super.initState();




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

        title: Text("Create Poll",style: TextStyle(fontSize: 18,color: fontColor),textAlign: TextAlign.center,)


      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.all(width/40),
              child: Container(
                alignment: Alignment.center,
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
                  padding: EdgeInsets.symmetric(horizontal: width/40),
                  child: ListTile(
                    title: TextField(
                      decoration: InputDecoration(
                          hintText:arrow_downText,
                          hintStyle: TextStyle(fontSize: 15,color: fontColor),
                          border: InputBorder.none

                      ),

                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.keyboard_arrow_down,color: searchbarIconColor,size: width/30,),
                      onPressed: (){

                        setState(() {

                          arrow_downText=="Voting"?arrow_downText="Appointment Choice":arrow_downText="Voting";


                        });

                      },
                    ),
                  ),
                ),


              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width/40),
              child: Container(
                  alignment: Alignment.center,
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
                    padding: EdgeInsets.symmetric(horizontal: width/40),
                    child: TextField(
                        decoration: InputDecoration(
                            hintText:"Poll Subject",
                            hintStyle: TextStyle(fontSize: 15,color: searchbarIconColor),
                            border: InputBorder.none

                        ),
                      ),
                  ),


              ),
            ),

            Padding(
              padding: EdgeInsets.only(top:height/50),
              child: Container(
                width: width/1.2,
                height: height/2,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context,position){

                    return Padding(
                      padding: EdgeInsets.only(bottom:height/50),
                      child: Container(
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            color: Colors.grey.withOpacity(.1),
                            border: Border.all(
                                color: Colors.white.withOpacity(.1),
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
                          child: ListTile(

                            leading: Container(
                              width: width/15,
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
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],

                              ),
                              child: Text((position+1).toString(),
                                style: TextStyle(color: fontColor),
                                ),
                              ),




                            title: TextField(
                              decoration: InputDecoration(
                                  hintText:"Option " +(position+1).toString(),
                                  hintStyle: TextStyle(fontSize: 15,color: fontColor),
                                  border: InputBorder.none

                              ),
                            ),


                          )
                      ),
                    );

                  },

                ),
              ),
            ),

        GestureDetector(
        onTap: (){

      //buttonFunction();

    },
    child: Padding(
    padding: EdgeInsets.only(top:height/50,bottom:height/100),
    child: Container(
    width: width/1.2,
    height: height/15,
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

    child: Center(child: Text("Create Poll",
    textAlign: TextAlign.center,style: TextStyle(color: accentColor),))),
    ),

    ),

          ],
        ),
      ),


    );
  }
}


