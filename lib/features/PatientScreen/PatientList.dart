import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientDataScreen.dart';
import 'package:umedmiscanner/features/home/drawer/circular_image.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class PatientList extends StatefulWidget {
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  File _image;
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: backgroundColor,
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, position) {
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
                        return Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientDataScreen()),
                        );
                      },
                      leading: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: CircularImage(
                          NetworkImage(imageUrl),
                        ),
                      ),
                      title: Text(
                        "Diana Rockwell",
                        style: TextStyle(color: titleColor, fontWeight: FontWeight.w400),
                      ),
                      subtitle: Row(
                        children: [
                          Text("M",
                            style: TextStyle(
                                color: searchbarIconColor, fontSize: 12),),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: appColor,
                          ),
                          Text("23",
                            style: TextStyle(
                                color: searchbarIconColor, fontSize: 12),),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: appColor,
                          ),
                          Text("Diabetic",
                            style: TextStyle(
                                color: searchbarIconColor, fontSize: 12),),
                        ],
                      ),
                      trailing: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              GestureDetector(
                                onTap: null,
                                child: Image.asset(
                                  "images/qr-code.png",
                                  color: primaryColor,
                                  width: width / 15,
                                ),
                              ),
                              position % 5 == 0
                                  ?  Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5),
                                padding:
                                EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: POINTS_COLOR,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          5.0) //         <--- border radius here
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                                height: 10,
                                child: Row(
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage(
                                          'images/patientcritical.png'),
                                      width: 7,
                                      height: 10,
                                    ),
                                    Text(
                                      "6 Critical",
                                      style: TextStyle(
                                          color: Colors.pink,
                                          fontSize: 8),
                                    ),
                                  ],
                                ),
                              )
                                  : Container(),
                              position % 5 == 0
                                  ? Tab(
                                child: Icon(
                                  FontAwesomeIcons.users,
                                  size: 10.0,
                                  color: appColor,
                                ),
                              )
                                  : Text(""),
                              SizedBox(
                                width: 5,
                              ),
                              position % 5 == 0
                                  ? Text(
                                "3",
                                style: TextStyle(
                                    color: appColor, fontSize: 10),
                              )
                                  : Text(""),
                              SizedBox(
                                width: 5,
                              ),
                              Tab(
                                child: Icon(Icons.bookmark, color: PROGRESS_COLOR,),
                              ),
                            ],
                          ),
                          Text("Last viewed 1 day ago",
                            style: TextStyle(
                                color: searchbarIconColor, fontSize: 8),),
                        ],
                      )
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
              )
            );
          },
        ));
  }
}
