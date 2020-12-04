import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:umedmiscanner/features/Chat/helper/chat_modellist.dart';
import 'package:umedmiscanner/features/Chat/model/chat_model.dart';
import 'package:umedmiscanner/features/home/drawer/circular_image.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class CriticalPatients extends StatefulWidget {
  @override
  _CriticalPatientsState createState() => _CriticalPatientsState();
}

class _CriticalPatientsState extends State<CriticalPatients> {


  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";



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
                Icon(Icons.group_outlined,size: width/20,color: appColor,),


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

  showCriticalPatients(width,height){

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
        toolbarHeight: height / 3.5,
        backgroundColor: accentColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text("Filter",textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: fontColor),),

            RaisedButton(
                padding: const EdgeInsets.all(5),
                textColor: appColor,
                color: accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: appColor)
                ),
                onPressed: (){
                  setState(() {

                  });
                },
                child: Text("Include",textScaleFactor: 1,)
            ),

            RaisedButton(
                padding: const EdgeInsets.all(5),
                textColor: accentColor,
                color: appColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: appColor)
                ),
                onPressed: (){
                  setState(() {

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


                  searchbar(width),

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

      body: showCriticalPatients(width, height),

    );
  }
}
