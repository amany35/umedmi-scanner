import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:umedmiscanner/features/Chat/helper/chat_modellist.dart';
import 'package:umedmiscanner/features/Chat/model/chat_model.dart';
import 'package:umedmiscanner/features/home/drawer/circular_image.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class SharedPatients extends StatefulWidget {
  @override
  _SharedPatientsState createState() => _SharedPatientsState();
}

class _SharedPatientsState extends State<SharedPatients> {


  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";




  TextEditingController searchController = TextEditingController();

  bool includeIsClicked = false;

  bool excludeIsClicked = true;

  var searchTextList = [];


  List<Chat_Model> chatModel_List = new List<Chat_Model>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    chatModel_List=getchatModelList();
  }


  searchbar(width,height){

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



            title: TextFormField(
              cursorColor: appColor,
                  onChanged:(text) {

                      if(text.contains(" ")){

                        setState(() {

                          searchTextList.add(text.trim());

                          print("searchText $text");

                          print(searchController.text);


                        });

                        searchController=TextEditingController(text: "");

                       }



                    //print("First text field: $text");


                  },
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText:searchTextList.isEmpty?"Add filter ...":"Add more filters ...",
                      hintStyle: TextStyle(fontSize: 16,color: searchbarIconColor),
                      border: InputBorder.none

                  ),
                ),


            trailing: Container(
              width: width/10,
              child: Stack(
                children: [
                  Image.asset(
                    "images/qr_code.png",
                    color: appColor,
                    width: width / 30,
                  ),

                  Positioned(
                    right: width/100,
                    child: Image.asset(
                      "images/filter.png",
                      color: appColor,
                      width: width / 30,
                    ),
                  ),

                ],
              ),
            ),

          ),
        )
    );


  }


  showSharedWith(width,height){

    return showSlidingBottomSheet(context, builder: (context) {
      return SlidingSheetDialog(
        elevation: 0,
        cornerRadius: 16,
        color: Colors.white70,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.4, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return Container(
              height: height,
              color: Colors.white,
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 50, vertical: height / 50),
                      child: Scaffold(
                          appBar: AppBar(
                            backgroundColor: accentColor,
                            elevation: 0,
                            toolbarHeight: height/4,
                            leading: Text(""),

                            bottom: PreferredSize(
                                  child: Column(
                                    children: [

                                      patientCard(width, height, 0),

                                      SizedBox(height: height/50,),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          Text("Shared With ",style: TextStyle(fontSize: 20,
                                              fontWeight: FontWeight.bold,color: fontColor),),

                                          GestureDetector(
                                            child: Row(
                                              children: [

                                                Icon(Icons.delete_outline,color: Colors.red,size: width/15,),

                                                SizedBox(width: width/50,),

                                                Text("Delete All ",style: TextStyle(fontSize: 16,
                                                    fontWeight: FontWeight.bold,color: Colors.red),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: height/50,),
                                    ],
                                  ),
                                preferredSize: null),

                          ),
                          backgroundColor: Colors.white,
                          body: sharedDoctors(width, height, chatModel_List)
                        ),
                      )));
        },
      );
    });

  }


  sharedDoctors(width,height,chatModel_List){

    return ListView.builder(

      itemCount: chatModel_List.length,
      itemBuilder: (context,position){

        return Padding(
          padding: EdgeInsets.all(width/30),
          child: Stack(
            children: [

              Padding(
                padding: EdgeInsets.only(left:width/150),
                child: Stack(
                  children: [
                    Container(
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
                  ],
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
                          width: width / 25,
                        ),
                      ),

                      SizedBox(width: width/50,),

                      GestureDetector(
                        onTap: null,
                        child: Icon(Icons.edit_outlined,color: fontColor,size: width/20,),
                      ),

                      SizedBox(width: width/50,),

                      GestureDetector(
                        onTap: null,
                        child: Icon(Icons.delete_outline,color: Colors.red,size: width/20,),
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


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: null,
                    child: Icon(Icons.bookmark_border,color: PROGRESS_COLOR,size: width/20,),
                  ),
                ),
              ),

            ],
          ),





        );


      },





    );

  }


  patientCard(width,height,position){

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0),),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 1.0,
          ),
        ],
        color: accentColor,
      ),
      child: Stack(
        children: [
          ListTile(
            onTap: () {
              // return Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => PatientDataScreen()),
              // );
            },
            leading: Padding(
              padding: const EdgeInsets.only(right: 16),
              child:
              CircularImage(
                NetworkImage(imageUrl,scale: width/30),
              ),


            ),
            // title: RichText(
            //   InlineSpan: Text(
            //     "Diana Rockwell",
            //     style: TextStyle(color: titleColor),
            //   ),
            // ),
            title: RichText(
              // overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Diana Rockwell",
                      style: TextStyle(fontWeight: FontWeight.bold,color: titleColor),
                    ),
                    TextSpan(
                      text: "\n(#2585693)",
                    ),
                  ]

              ),

            ),
            subtitle: Text("M.23.Diabetic"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: null,
                  child: Image.asset(
                    "images/qr-code.png",
                    color: appColor,
                    width: width / 20,
                  ),
                ),
                SizedBox(
                  width: width / 15,
                ),

                Text(" ${position+2} ",style: TextStyle(fontSize: 10,color: appColor),),
                GestureDetector(

                  onTap: (){

                    showSharedWith(width, height);


                  },

                    child: Icon(Icons.group_outlined,size: width/20,color: appColor,)),


                SizedBox(
                  width: width / 15,
                ),
                position%2==0?Tab(
                  child: Icon(Icons.bookmark, color: PROGRESS_COLOR,),
                ):Tab(
                  child: Icon(Icons.bookmark_border, color: PROGRESS_COLOR,),
                ),
              ],
            ),
          ),

          Positioned(
            left: width/40,
            top: height/50,

            child: CircleAvatar(
              radius: 4,
              backgroundColor: position%2==0?Colors.green:position%3==0?Colors.grey:Colors.red,

            ),
          ),


        ],

      ),
    );

  }

  showSharedPatients(width,height){

    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, position) {

          return patientCard(width, height, position);

        }));


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
        toolbarHeight: searchTextList.isNotEmpty?(height/2.5):(height/3.3),
        backgroundColor: accentColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text("Filter",textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: fontColor),),

            RaisedButton(
                padding: const EdgeInsets.all(5),
                textColor: includeIsClicked?accentColor:appColor,
                color: includeIsClicked?appColor:accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: appColor)
                ),
                onPressed: (){
                  setState(() {

                    includeIsClicked = true;

                    excludeIsClicked = false;

                  });
                },
                child: Text("Include",textScaleFactor: 1,)
            ),

            RaisedButton(
                padding: const EdgeInsets.all(5),
                textColor: excludeIsClicked?accentColor:appColor,
                color: excludeIsClicked?appColor:accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: appColor)
                ),
                onPressed: (){
                  setState(() {

                    includeIsClicked = false;

                    excludeIsClicked = true;

                  });
                },
                child: Text("Exclude",textScaleFactor: 1,)
            ),

          ],
        ),
        bottom: PreferredSize(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 50, vertical: height / 50),
              child: Column(

                children: [


                  searchbar(width,height),

                  searchTextList.isNotEmpty?Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/50, vertical:height/50 ),
                    child: Container(
                      child: Wrap(
                        runSpacing: 2.0,
                        spacing: 2.0,
                        children: searchTextList.map<Widget>((searchText){

                          return Container(
                            width: width/5,
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                              color: appColor,
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.1),
                                  width: 2.0
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50.0)  //                 <--- border radius here
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],

                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  Text(searchText,style: TextStyle(color: accentColor,fontSize: 12),),

                                  SizedBox(width: width/50,),

                                  GestureDetector(
                                      onTap: (){

                                        searchTextList.remove(searchText);
                                        setState(() {

                                        });

                                      },
                                      child: Icon(Icons.close, color: accentColor, size: width / 40,)),

                                ],
                              ),
                            ),



                          );

                        }).toList(),),
                    ),
                  ):Text(""),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 50, vertical: height / 50),
                    child: Row(
                      children: [
                        Text("Patient",textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: fontColor),),
                      ],
                    ),
                  ),

                ],
              ),
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

      body: showSharedPatients(width, height),

    );
  }
}
