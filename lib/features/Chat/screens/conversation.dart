
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:umedmiscanner/features/Chat/screens/camera_photo.dart';
import 'package:umedmiscanner/features/Chat/screens/choose_document.dart';
import 'package:umedmiscanner/features/Chat/screens/choose_photo_from_gallery.dart';
import 'package:umedmiscanner/features/Chat/widgets/conversationwidget.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../helper/clip_modellist.dart';
import '../helper/message_modellist.dart';
import '../model/clip_model.dart';
import '../model/message_model.dart';
import 'addpeopletochat.dart';
import 'createpoll.dart';
import 'starredmessage.dart';


class Conversation extends StatefulWidget {


  final String userName;
  final String userPhotoUrl;
  final bool showAppBar;
  final bool isGroup;

  const Conversation({Key key, this.userName, this.userPhotoUrl, this.showAppBar=true, this.isGroup=false}) : super(key: key);

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {



  List<Message_Model> messageModel_List = new List<Message_Model>();

  List<Clip_Model> clipModel_List = new List<Clip_Model>();


  List <PhotoGallery> photosGallery =[];

  DateTime _selectedValue = DateTime.now();

  DateTime _dateTime = DateTime.now();

  bool isFabClicked = false;

  bool isRecordingStart=false;

  bool isRecordingStop=false;

  bool isTyping = false;




  List <MenuButton> menuButtons =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    messageModel_List=getMessageModelList();

    clipModel_List=getclipModelList();

    menuButtons=getMenuButtons();

    photosGallery=getPhotosFromGallery();

  }



  showslidingbottomSheet(route,width,height){


    showSlidingBottomSheet(
        context,
        builder: (context) {
          return SlidingSheetDialog(
            elevation: 0,
            cornerRadius: 16,
            color: accentColor,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.4, 0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                color: accentColor,
                height: height,
                child: Center(

                    child: route,
                  ),

              );
            },
          );
        }
    );


  }









  pickDate(width,height){

    return Container(
      width: width,
      height: height/7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            daysCount: 30,
            selectionColor: cancelBtnColor,
            selectedTextColor: Colors.white,
            dateTextStyle: TextStyle(color: searchbarIconColor),
            onDateChange: (date) {
              // New date selected
              setState(() {
                _selectedValue = date;
              });
            },
          ),
        ],
      )
    );

  }

  pickTime(width,height){

    return Container(
        width: width,
        height: height/7,
        child: TimePickerSpinner(
          time: _dateTime,
          is24HourMode: false,
          normalTextStyle: TextStyle(
              fontSize: 15,
              color: fontColor
          ),
          highlightedTextStyle: TextStyle(
              fontSize: 15,
              color: searchbarIconColor
          ),
          spacing: 10,
          itemHeight: 20,
          isForce2Digits: true,
          onTimeChange: (time) {
            setState(() {
              _dateTime = time;
            });
          },
        ),
    );

  }

  buttonCallFunction(width,height){

    return showDialog(context: context, child:
    new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Colors.transparent),

      ),
      title: Text("Request Audio Call",textAlign: TextAlign.center,),




      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          pickDate(width/2,height),
          pickTime(width/2,height),
          Container(
            height: height/8,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              color: accentColor,
              border: Border.all(
                  color: searchbarIconColor,
                  width: 2.0
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)  //                 <--- border radius here
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
                maxLines: 15,
                decoration: InputDecoration(
                    hintText:"Purpose",
                    hintStyle: TextStyle(fontSize: 15,color: searchbarIconColor),
                    border: InputBorder.none

                ),
              ),
            ),


          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: height/50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Call now",style: TextStyle(color: callnowlBtnColor,fontWeight: FontWeight.bold,fontSize: 15),),
                Text("Save",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 15),),
              ],
            ),
          )
        ],
      ),
    )
    );

  }


  buttonFunction(width,height,bool isButtonFileFunction){
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

            Text(isButtonFileFunction?"Attach":"Share Location",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

            SizedBox(height: height/30,),

            GestureDetector(
              onTap: (){

                if(isButtonFileFunction){

                  showslidingbottomSheet(CameraPhoto(),width, height);

                }

              },
              child: ListTile(
                leading: Icon(isButtonFileFunction?Icons.camera_alt:Icons.my_location,color: searchbarIconColor,size: width/18,),
                title: Text(isButtonFileFunction?"Camera":"Share live location",style: TextStyle(color: fontColor,fontSize: 15),),
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: (){

                if(isButtonFileFunction){

                  showslidingbottomSheet(ChoosePhotoFromGallery(),width, height);

                }

              },
              child: ListTile(
                leading: Icon(isButtonFileFunction?Icons.image:Icons.location_on,color: searchbarIconColor,size: width/18,),
                title: Text(isButtonFileFunction?"Gallery":"Your current location",style: TextStyle(color: fontColor,fontSize: 15),),
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: (){

                if(isButtonFileFunction){

                  showslidingbottomSheet(ChooseDocument(),width, height);

                }

              },
              child: ListTile(
                leading: Icon(isButtonFileFunction?Icons.insert_drive_file:Icons.location_city,color: searchbarIconColor,size: width/18,),
                title: Text(isButtonFileFunction?"Document":"Other Location",style: TextStyle(color: fontColor,fontSize: 15),),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top:height/50,bottom:height/80),
              child: Container(
                  width: width/1.3,
                  height: height/20,
                  alignment: Alignment.center,

                  decoration: BoxDecoration(),

                  child: Center(child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text("Cancel",
                      textAlign: TextAlign.center,style: TextStyle(color: cancelBtnColor),),
                  ))),
            ),

          ],
        ),
      ),);

  }



  buttonClipFunction(width,height){
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
          mainAxisSize: MainAxisSize.max,
          children: [

            Padding(
              padding: EdgeInsets.all(width/50),
              child: Text("Attach",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: height/50,),

            Container(
              height: height/3,
              child: ListView.builder(

                  itemCount: clipModel_List.length,
                  itemBuilder:(context,position){

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        ListTile(
                          leading: Image.asset(clipModel_List[position].iconPath,width: width/30,color: fontColor,),
                          title: Text(clipModel_List[position].text,style: TextStyle(color: fontColor,fontSize: 15),),
                          trailing: Icon(Icons.keyboard_arrow_right,color: searchbarIconColor,size: width/20,),
                        ),
                        position!=clipModel_List.length-1?Divider():Text(""),
                      ],
                    );

                  }),
            ),

            Padding(
              padding: EdgeInsets.only(top:height/50,bottom:height/80),
              child: Container(
                  width: width/1.3,
                  height: height/20,
                  alignment: Alignment.center,

                  decoration: BoxDecoration(),

                  child: Center(child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text("Cancel",
                      textAlign: TextAlign.center,style: TextStyle(color: cancelBtnColor),),
                  ))),
            ),

          ],
        ),
      ),);

  }




  /*_showPopupMenu(width,height) async {
    return showMenu(
      color: choicesColor,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.transparent),

      ),
      position: RelativeRect.fromLTRB(height/10, height/15, height/20, 0),
      items: [
        PopupMenuItem<String>(

            child: Column(
              children: [
                GestureDetector(
                  onTap: (){

                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>AddPeopleToChat())
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add,color: primaryColor,size: width/20,),
                      SizedBox(width: width/100,),
                      Text('Add people to chat',style: TextStyle(fontSize: 15,color: fontColor),),
                    ],
                  ),
                ),
                Divider(),
              ],
            ), value: 'Add people to chat',height: height/50,),

        PopupMenuItem<String>(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.volume_mute,color: primaryColor,size: width/20,),
                    SizedBox(width: width/100,),
                    Text('Mute Chat',style: TextStyle(fontSize: 15,color: fontColor),),
                  ],
                ),
                Divider(),
              ],
            ), value: 'Mute Chat',height: height/50,),
        PopupMenuItem<String>(
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){

                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>StarredMessages())
                    );

                  },
                  child: Row(
                    children: [
                      Icon(Icons.star,color: primaryColor,size: width/20,),
                      SizedBox(width: width/100,),
                      Text('Starred Messages',style: TextStyle(fontSize: 15,color: fontColor),),
                    ],
                  ),
                ),
                Divider(),
              ],
            ), value: 'Starred Messages',height: height/50,),

        PopupMenuItem<String>(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.delete,color: primaryColor,size: width/20,),
                    SizedBox(width: width/100,),
                    Text('Delete Chat',style: TextStyle(fontSize: 15,color: fontColor),),
                  ],
                ),
              ],
            ), value: 'Delete Chat',height: height/50,),
      ],
      elevation: 20.0,
    );
  }*/




  menuButtonFunction(width,height){
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
        child: Container(
              height: height/2,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                color: choicesColor,
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
                child: ListView.builder(
                    itemCount: widget.isGroup?menuButtons.length:menuButtons.length-1,

                    itemBuilder: (context,position){

                      return Column(

                        children: [

                          SizedBox(height: height/50,),

                          GestureDetector(

                          onTap: (){

                          if(position==0){

                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>AddPeopleToChat())
                            );

                          }

                          else if(position ==2){


                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>StarredMessages())
                            );

                          }


                        },

                            child: Row(

                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(menuButtons[position].icon,color: primaryColor,size: width/20,),
                                  SizedBox(width: width/100,),
                                  Text(menuButtons[position].title,style: TextStyle(fontSize: 15,color: fontColor),),
                                ],
                              ),
                            ),

                          SizedBox(height: height/50,),

                          Divider(),

                        ],


                      );


                    },


                ),
              ),


            ),



      ),);

  }


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(

      backgroundColor: accentColor,

      appBar: widget.showAppBar?AppBar(

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
        actions: [

          Padding(
            padding: EdgeInsets.all(width/80),
            child: GestureDetector(
                onTap: (){

                   buttonCallFunction(width,height);

                },
                child: Icon(Icons.call,size: width/20,color: primaryColor,)),
          ),

          Padding(
            padding: EdgeInsets.all(width/80),
            child: GestureDetector(
                onTap: (){

                  menuButtonFunction(width,height);

                },
                child: Icon(Icons.more_vert,size: width/20,color: primaryColor,)),
          ),



        ],
        title: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset(widget.userPhotoUrl),
              radius: width/30,
            ),
            title: Text(widget.userName,overflow: TextOverflow.ellipsis,
              style: TextStyle(color: fontColor,fontSize: 13,fontWeight: FontWeight.bold),),
            subtitle: Text("Online",style: TextStyle(color: primaryColor,fontSize: 12),),
        ),



      ):AppBar(backgroundColor: accentColor,elevation: 0,),
      body:Stack(
        children: [

          Padding(
            padding: EdgeInsets.only(bottom: height/8),
            child:ConversationWidget(length: messageModel_List.length,messageModel_List: messageModel_List,userName:widget.userName,userPhotoUrl: widget.userPhotoUrl,),
          ),

          !isRecordingStart?Align(
            alignment:Alignment.bottomCenter,
            child:
           Padding(
             padding: EdgeInsets.only(bottom:height/50,right: width/6),
             child: Container(
                    width: width/1.2,
                    height: height/15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){

                            if(!isTyping) {
                              setState(() {
                                isRecordingStart = true;
                              });
                            }else{


                            }
                          },
                          child: Container(
                            width: width/1.3,
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
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                GestureDetector(

                                  onTap:(){



                                 },
                                  child: Container(
                                    width: width/1.5,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal:width/100),
                                      child: TextFormField(
                                        onChanged: (value){

                                          setState(() {

                                            if(value.isEmpty){

                                              isTyping=false;

                                            }else{

                                              isTyping=true;

                                            }

                                          });

                                        },
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 30,
                                        decoration: InputDecoration(
                                            hintText:"Type a message",
                                            hintStyle: TextStyle(fontSize: 15,color: searchbarIconColor),
                                            border: InputBorder.none


                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.all(width/50),
                                  child: !isTyping?Icon(
                                    Icons.mic, size: width/20,color: primaryColor,
                                  ):Image.asset("images/send.png",width: width/20,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
           ),
            ):Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: !isRecordingStop?
                Text("01:02",style: TextStyle(fontSize: 15,color: fontColor),)
                :GestureDetector(
                    onTap: (){

                      if(isRecordingStop){

                        setState(() {

                          isRecordingStop=false;

                          isRecordingStart=false;

                        });

                      }

                    },
                    child: Icon(Icons.delete,size: width/15,color: cancelBtnColor,)),
                title: Padding(

                  padding: EdgeInsets.only(bottom: height/35),

                child: CircleAvatar(
                    radius: width/15,
                    backgroundColor: primaryColor,
                    child: ListTile(
                      title: GestureDetector(
                        onTap: (){

                          if(!isRecordingStop){

                            setState(() {

                              isRecordingStop=true;

                            });

                          }

                        },
                        child: Icon(!isRecordingStop?Icons.stop:Icons.play_circle_outline,
                          size: width/10,color: accentColor,),
                      ),
                      subtitle: isRecordingStop?Text("01:02",style: TextStyle(fontSize: 15,color: fontColor),):Text(""),
                    )

                ),

               ),

                trailing: !isRecordingStop?GestureDetector(
                    onTap: (){

                      setState(() {

                        isRecordingStart=false;

                      });

                    },
                    child: Text("Cancel",style: TextStyle(fontSize: 15,color: searchbarIconColor),))
                    :GestureDetector(
                    onTap: (){

                      if(isRecordingStop){

                        setState(() {

                          isRecordingStop=false;

                          isRecordingStart=false;

                        });

                      }

                    },
                    child: Image.asset("images/send.png",width: width/15,color: primaryColor,),

                ),

    ),
            ),

        ],
      ),

                floatingActionButton: !isRecordingStart?Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                isFabClicked?FloatingActionButton(
                heroTag: "btn1",

                  child: Image.asset(
                      "images/file.png",
                      width: width/15,
                      color:primaryColor
                  ),
                  onPressed: (){

                  buttonFunction(width, height,true);

                  },
                  backgroundColor: accentColor,
                ):Text(""),
            SizedBox(height: height/50,),
            isFabClicked?FloatingActionButton(
            heroTag: "btn2",
            child:Image.asset(
                "images/location.png",
                width: width/15,
                color:primaryColor
            ),
            onPressed: (){
            buttonFunction(width, height,false);
            },
            backgroundColor: accentColor,
            ):Text(""),
            SizedBox(height: height/50,),
            isFabClicked?FloatingActionButton(
            heroTag: "btn3",
            child: Image.asset(
                "images/poll.png",
                width: width/15,
                color:primaryColor
            ),
            onPressed: (){
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) =>CreatePoll())
            );
            },
            backgroundColor: accentColor,
            ):Text(""),
            SizedBox(height: height/50,),
            isFabClicked?FloatingActionButton(
            heroTag: "btn4",

            child: Image.asset(
                "images/clip.png",
                width: width/15,
                color:primaryColor
            ),
            onPressed: (){
            buttonClipFunction(width, height);
            },
            backgroundColor: accentColor,
            ):Text(""),
            SizedBox(height: height/50,),
            FloatingActionButton(
            heroTag: "btn5",

            child: isFabClicked?Icon(
            Icons.close,
            size: width/25,
            color:primaryColor
            ):Icon(
                Icons.attach_file,
                size: width/25,
                color:primaryColor
            ),
            backgroundColor: accentColor,
            onPressed: (){

            setState(() {

            isFabClicked?isFabClicked=false:isFabClicked=true;

            });

            },
            ),
         ]):Text("")
    );
  }
}


class MenuButton {

  String title;
  IconData icon;


}

List <MenuButton> getMenuButtons(){

  List <MenuButton> menuButtons =[];

  MenuButton menuButton = new MenuButton();

  menuButton.title='Add people to chat';
  menuButton.icon=Icons.add;

  menuButtons.add(menuButton);


  menuButton = new MenuButton();
  menuButton.title='Mute Chat';
  menuButton.icon=Icons.volume_mute;

  menuButtons.add(menuButton);


  menuButton = new MenuButton();
  menuButton.title='Starred Messages';
  menuButton.icon=Icons.star;

  menuButtons.add(menuButton);

  menuButton = new MenuButton();
  menuButton.title='Delete Chat';
  menuButton.icon=Icons.delete;

  menuButtons.add(menuButton);

  menuButton = new MenuButton();
  menuButton.title='Leave Group';
  menuButton.icon=Icons.exit_to_app;

  menuButtons.add(menuButton);

  return menuButtons;
}


class PhotoGallery{

String url;
bool isChecked = false;


}


List <PhotoGallery> getPhotosFromGallery(){


  List <PhotoGallery> photosGallery =[];

  PhotoGallery photoGallery = new PhotoGallery();

  for(int i=0;i<10;i++){

    photoGallery = new PhotoGallery();

    photoGallery.url='images/doctorProfile.png';

    photosGallery.add(photoGallery);

  }






  return photosGallery;


}