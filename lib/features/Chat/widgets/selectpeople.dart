import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'searchbar.dart';

Widget SelectPeople(width,height,chatModel_List,buttontext,buttonFunction){

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width/50,vertical: height/30),
    child: Stack(
      children: [

        Padding(
          padding: EdgeInsets.all(height/100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: searchbar(height)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: height/10,bottom: height/10),
          child: ListView.builder(

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
                      padding: EdgeInsets.only(top:width/20),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(Icons.radio_button_unchecked,size: width/30,color: searchbarIconColor,),

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


                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(width/70),
                        child: Text(chatModel_List[position].lastMessageTime,
                          style: TextStyle(fontSize: 12,color: chatsTimeColor),),
                      ),

                    ),



                  ],
                ),





              );


            },



          ),
        ),



        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: (){

              buttonFunction();

            },
            child: Padding(
              padding: EdgeInsets.only(top:height/20,bottom:height/50),
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

                  child: Center(child: Text(buttontext,textAlign: TextAlign.center,style: TextStyle(color: accentColor),))),
            ),

          ),
        ),



      ],
    ),
  );

}