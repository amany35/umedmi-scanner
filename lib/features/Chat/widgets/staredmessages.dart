import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:umedmiscanner/resources/AppColors.dart';


pollMessage(width,height){

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: width/100),
        child: Container(
          height: height/20,
          width: width/3,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            color: searchbarIconColor.withOpacity(.5),
            border: Border.all(
                color: Colors.grey.withOpacity(.1),
                width: 2.0
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(50.0)  //                 <--- border radius here
            ),


          ),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width/80),
            child: Text("Poll Subject",overflow: TextOverflow.ellipsis,textAlign:TextAlign.center,style: TextStyle(fontSize: 13,color: fontColor),

            ),
          ),


        ),
      ),

      Padding(
        padding: EdgeInsets.only(top: height/50),
        child: ExpandChild(
          arrowColor: Colors.black,
          child: Container(
            width: width/2,
            height: height/4,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context,position){

                return  Container(
                    width: width/10,
                    height: height/13,
                    alignment: Alignment.center,

                    child: Padding(
                      padding: EdgeInsets.only(bottom: height/20),
                      child: ListTile(

                        title: LinearPercentIndicator(
                          width: width/3,
                          lineHeight: height/30,
                          percent: (position)*0.2,
                          center: Text(
                            "Option " +(position+1).toString(),style: TextStyle(fontSize: 13,color: fontColor),

                          ),
                          trailing:Padding(
                            padding: EdgeInsets.only(left: width/30),
                            child: Text(
                              ((position)*20).toString()+"%",
                              style: new TextStyle(fontSize: 12.0,color: fontColor),
                            ),
                          ),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          backgroundColor: searchbarIconColor.withOpacity(.5),
                          progressColor: primaryColor.withOpacity(.3),

                        ),


                      ),
                    )

                );

              },

            ),
          ),
        ),
      ),


    ],
  );



}

  Widget staredMessages(width,height,messageModel_List,length){
    return
      ListView.builder(

        itemCount: length,
        itemBuilder: (context,position){
          final align = messageModel_List[position].isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
          final color = messageModel_List[position].isMe?
          chatsTimeColor : messageNotMeColor;
          final radius = messageModel_List[position].isMe?
          BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(0)
          ):BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(50)
          );

          return Column(

            crossAxisAlignment: align,
            children: [

              Padding(
                padding: EdgeInsets.symmetric(horizontal:width/5,vertical: height/50),
                child: Column(
                  crossAxisAlignment: align,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: width/50),
                      child: Center(
                        child:  Text(messageModel_List[position].messageDate,style: TextStyle(fontSize: 15,color: chatsTimeColor),),
                      ),
                    ),

                    Container(

                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: radius,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(width/50),
                          child: messageModel_List[position].messageType=="text"?
                          Text(messageModel_List[position].message)

                              :messageModel_List[position].messageType=="file"?
                          ListTile(
                              title: Icon(Icons.insert_drive_file,color: accentColor,size: width/5,),
                              subtitle: Row(
                                children: [
                                  Icon(Icons.attach_file,color: primaryColor,size: width/20,),
                                  SizedBox(width: width/50,),
                                  Text(messageModel_List[position].message,style: TextStyle(fontSize: 13,color: fontColor),),
                                ],
                              )
                          )

                              :messageModel_List[position].messageType=="photo"?

                          Wrap(
                            runSpacing: 2.0,
                            spacing: 10.0,
                            children: messageModel_List[position].messagePhotos.map<Widget>((photo){

                              return Image.asset(photo,width: width/5,height: height/5,);

                            }).toList(),)


                              :messageModel_List[position].messageType=="poll"?

                          pollMessage(width, height)


                              :Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.pause_circle_outline, color: primaryColor,
                              ),
                              SizedBox(width: width/50,),
                              Image.asset(
                                "images/voice-alt.png", width: width/20,
                              ),
                              Image.asset(
                                "images/voice-alt-2.png", width: width/20,
                              ),
                              Image.asset(
                                "images/voice-alt-2.png", width: width/20,
                              )
                            ],
                          ),
                        )),


                    Padding(
                      padding:EdgeInsets.all(width/80),
                      child: Align(
                        child: Row(
                          mainAxisAlignment: messageModel_List[position].isMe?MainAxisAlignment.end:MainAxisAlignment.start,
                          children: [
                            Text(messageModel_List[position].time,style: TextStyle(fontSize: 12,color: chatsTimeColor),),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top:width/40,bottom: width/40),
                      child: Divider(),
                    ),

                  ],
                ),
              ),

            ],


          );



        },



      );

  }







