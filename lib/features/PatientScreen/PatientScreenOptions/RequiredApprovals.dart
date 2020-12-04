import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:umedmiscanner/features/Chat/helper/chat_modellist.dart';
import 'package:umedmiscanner/features/Chat/model/chat_model.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class RequiredApprovals extends StatefulWidget {
  @override
  _RequiredApprovalsState createState() => _RequiredApprovalsState();
}

class _RequiredApprovalsState extends State<RequiredApprovals> {


  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  List<Chat_Model> chatModel_List = new List<Chat_Model>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    chatModel_List=getchatModelList();
  }

  searchbar(width){

    return Container(

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
        child: Center(
          child: ListTile(

            leading: Icon(Icons.search,color: searchbarIconColor,),

            title: TextField(
              decoration: InputDecoration(
                  hintText:"Search ...",
                  hintStyle: TextStyle(fontSize: 15,color: searchbarIconColor),
                  border: InputBorder.none

              ),
            ),

            trailing: Image.asset(
              "images/filter.png",
              color: appColor,
              width: width / 30,
            ),

          ),
        )
    );


  }


  selectPeople(width,height,chatModel_List){

    return ListView.builder(

              itemCount: chatModel_List.length,
              itemBuilder: (context,position){

                return Padding(
                  padding: EdgeInsets.all(width/30),
                  child: Stack(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left:width/150),
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
                                        radius: width/30,
                                        child: Image.asset(chatModel_List[position].userPhotoUrl[0]))
                                        :Container(
                                      width: width/5,
                                      height: height/20,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:3,
                                          itemBuilder: (context,index){
                                            return CircleAvatar(
                                              backgroundColor: accentColor,
                                              radius: width/30,
                                              child: Image.asset(chatModel_List[position].userPhotoUrl[index]),
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
                                padding: EdgeInsets.only(top:width/100),
                                child: Container(


                                    child:
                                    Stack(
                                      children: [
                                        Row(

                                          children: [
                                            Text(chatModel_List[position].userTitle,
                                              maxLines: 1,
                                              style: TextStyle(color: fontColor),),

                                            SizedBox(width: width/50,),
                                            SmoothStarRating(
                                              rating: chatModel_List[position].userRating,
                                              isReadOnly: false,
                                              size: width/30,
                                              color: ratingColor,
                                              borderColor: searchbarIconColor,
                                              filledIconData: Icons.star,
                                              halfFilledIconData: Icons.star_half,
                                              defaultIconData: Icons.star,
                                              starCount: 5,
                                              allowHalfRating: true,
                                              spacing: 2.0,
                                              onRated: (value) {
                                                print("rating value -> $value");
                                                // print("rating value dd -> ${value.truncate()}");
                                              },
                                            )
                                          ],
                                        ),



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
                      Padding(
                        padding: EdgeInsets.only(top:height/20,right: width/20),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: null,
                                child: Image.asset(
                                  "images/qr-code.png",
                                  color: appColor,
                                  width: width / 20,
                                ),
                              ),

                              SizedBox(width: width/50,),

                              GestureDetector(
                                onTap: null,
                                child: Icon(Icons.check_circle_outline_rounded,color: appColor,size: width/15,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: width/100),
                          child: Container(
                            width: width/10,
                            height: height/12,
                            alignment: Alignment.center,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(80)
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





                );


              },





    );

  }



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;


    return Scaffold(

      backgroundColor: accentColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: height / 4.7,
        backgroundColor: accentColor,
        title: Text(
          "List of Required Approvals :", style: TextStyle(color: fontColor),),
        bottom: PreferredSize(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 50, vertical: height / 50),
              child: searchbar(width),
            ),
            preferredSize: null),

        leading: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 80, vertical: height / 80),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("images/close.png", color: appColor, width: width / 25,),



          ),
        ),

      ),

      body: selectPeople(width, height, chatModel_List),

    );
  }
}
