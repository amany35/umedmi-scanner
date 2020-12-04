
import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/common/StarDisplay.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class DoctorReviews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DoctorReviewsState();
  }
}

class _DoctorReviewsState extends State<DoctorReviews> {

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final reviews = Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * .02),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 10,),
              CircleAvatar(
                radius: 20,
                backgroundColor: backgroundColor,
                backgroundImage: AssetImage('images/doctorPhoto3.png'),
              ),
              SizedBox(width: 10,),
              Column(
                children: <Widget>[
                  Text(
                    "Lina Rose",
                    style: TextStyle(
                        color: titleColor, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  IconTheme(
                    data: IconThemeData(
                      color: ratingColor,
                      size: 12,
                    ),
                    child: StarDisplay(value: 5),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 60,top: 2),
              child: Text(
                "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete",
                style: TextStyle(color: BIOGRAPHY_COLOR, fontSize: 10),
              ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );

    final body = ListView(
      children: <Widget>[
        SizedBox(height: 10,),
        Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .075),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: ratingColor,
                      size: 12,
                    ),
                    Text(
                      "(5/5)",
                      style: TextStyle(
                        color: ratingColor,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .2),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: ratingColor,
                      size: 12,
                    ),
                    Text(
                      "(4.5/5)",
                      style: TextStyle(
                        color: ratingColor,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .15),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star_half,
                      color: ratingColor,
                      size: 12,
                    ),
                    Text(
                      "(3/5)",
                      style: TextStyle(
                        color: ratingColor,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                )),
          ],
        ),
        SizedBox(height: 5,),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .03),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * .03),
                child: Text(
                  "Personnel Rating",
                  style: TextStyle(fontSize: 12.0, color: titleColor,),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .03),
                child: Text(
                  "Clinic Rating",
                  style: TextStyle(fontSize: 12.0, color: titleColor,),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .03),
                child: Text(
                  "Doctor Rating",
                  style: TextStyle(fontSize: 12.0, color: titleColor,),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * .03,
            bottom: MediaQuery.of(context).size.width * .02,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "Reviews",
                style: TextStyle(
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
              SizedBox(width: 5,),
              Text(
                "(325 Reviews)",
                style: TextStyle(
                    color: MESSAGE_BACKGROUND_COLOR,
                    fontSize: 10.0),
              ),
            ],
          ),
        ),
        reviews,
        Divider(),
        reviews,
        Divider(),
        reviews,
        Divider(),
        reviews,
      ],
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: backgroundColor,
        child: body,
      ),
    );
  }
}

