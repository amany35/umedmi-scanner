import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';


class DoctorClinicsDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DoctorClinicsDetailsState();
  }
}

class _DoctorClinicsDetailsState extends State<DoctorClinicsDetails>
    with SingleTickerProviderStateMixin {
  List<Tab> tabList = List();
  TabController _tabController;
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  initState() {
    tabList.add(new Tab(
      text: 'About',
    ));
    tabList.add(new Tab(
      text: 'Clinics',
    ));
    tabList.add(new Tab(
      text: 'Reviews',
    ));
    _tabController = new TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget clinicContainer = Row(
      children: <Widget>[
        IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: FONT_COLOR, size: 14,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(
                20.0) //         <--- border radius here
            ),
            boxShadow: [
              BoxShadow(
                color: SHADOW,
                offset: Offset(0.0, 10.0), //(x,y)
                blurRadius: 15.0,
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width / 1.4,
          height: 211,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    'images/clinicPicture.png',
                    width: 81,
                    height: 81,
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Clinic Name",
                            style: TextStyle(
                                color: titleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                          SizedBox(width: 25,),
                          IconButton(
                            icon: Image.asset(
                              'images/editIcon.png',
                              width: 12,
                              height: 12,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lorem ipsum dolor sit amet, consetetur.",
                          style: TextStyle(
                              color: HINT_COLOR,
                              fontSize: 9.0),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                          padding: EdgeInsets.only(right: 52),
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: greyColor,
                              border: Border.all(
                                color: greyColor,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),//
                                bottomLeft: Radius.circular(5.0),//        <--- border radius here
                              ),
                            ),
                            width: 17,
                            height: 18,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'images/googleMap.png',
                              width: 7,
                              height: 8,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: greyColor,
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),//
                                bottomRight: Radius.circular(5.0),//        <--- border radius here
                              ),
                            ),
                            width: 90,
                            height: 18,
                            alignment: Alignment.center,
                            child: Text("View on Google Maps",
                              style: TextStyle(
                                  color: titleColor,
                                  fontSize: 8.0),),
                          ),
                        ],
                      ),),
                      SizedBox(height: 10,),
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: greyColor,
                              border: Border.all(
                                color: greyColor,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),//
                                bottomLeft: Radius.circular(5.0),//        <--- border radius here
                              ),
                            ),
                            width: 17,
                            height: 18,
                            alignment: Alignment.center,
                            child: Icon(Icons.phone, size: 7, color: COVID_DASH,),
                          ),
                          Container(
                            margin: EdgeInsets.only(right:10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: greyColor,
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),//
                                bottomRight: Radius.circular(5.0),//        <--- border radius here
                              ),
                            ),
                            width: 60,
                            height: 18,
                            alignment: Alignment.center,
                            child: Text("013265478103",
                              style: TextStyle(
                                  color: titleColor,
                                  fontSize: 8.0),),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: greyColor,
                              border: Border.all(
                                color: greyColor,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),//
                                bottomLeft: Radius.circular(5.0),//        <--- border radius here
                              ),
                            ),
                            width: 17,
                            height: 18,
                            alignment: Alignment.center,
                            child: Icon(Icons.phone, size: 7, color: COVID_DASH,),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: greyColor,
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),//
                                bottomRight: Radius.circular(5.0),//        <--- border radius here
                              ),
                            ),
                            width: 60,
                            height: 18,
                            alignment: Alignment.center,
                            child: Text("013265478103",
                              style: TextStyle(
                                  color: titleColor,
                                  fontSize: 8.0),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Country",
                      style: TextStyle(
                          color: titleColor,
                          fontSize: 12.0),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    "Region",
                    style: TextStyle(
                        color: titleColor,
                        fontSize: 12.0),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Female",
                      style:
                      TextStyle(color: LIGHT_GREY, fontSize: 10.0),
                    ),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    "20/10/1986",
                    style:
                    TextStyle(color: LIGHT_GREY, fontSize: 10.0),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Date Established",
                      style: TextStyle(
                          color: titleColor,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Date here",
                      style:
                      TextStyle(color: LIGHT_GREY, fontSize: 10.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

    Widget branchesContainers = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 5, right: 5, left: 2, bottom: 15),
          decoration: BoxDecoration(
            color: LIGHT_COLOR,
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.all(Radius.circular(
                10.0) //         <--- border radius here
            ),
          ),
          width: MediaQuery.of(context).size.width / 3.7,
          height: 67,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                "Nasr City",
                style: TextStyle(
                    color: titleColor, fontWeight: FontWeight.bold, fontSize: 8.0),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 15.0,
                  child: FlatButton(
                  onPressed: () {
//                    return Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => DoctorClinicsDetails()),
//                    );
                  },
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "See Info",
                      style: TextStyle(
                          color: LIGHT_PURPLE, fontWeight: FontWeight.bold, fontSize: 8.0),
                    ),
                    Icon(Icons.arrow_forward_ios, color: LIGHT_PURPLE, size: 8,),
                  ],
                )
                  )),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 15),
          decoration: BoxDecoration(
            color: LIGHT_COLOR,
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.all(Radius.circular(
                10.0) //         <--- border radius here
            ),
          ),
          width: MediaQuery.of(context).size.width / 3.7,
          height: 67,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                "Nasr City",
                style: TextStyle(
                    color: titleColor, fontWeight: FontWeight.bold, fontSize: 8.0),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 15.0,
                  child: FlatButton(
                      onPressed: () {
//                    return Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => DoctorClinicsDetails()),
//                    );
                      },
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "See Info",
                            style: TextStyle(
                                color: LIGHT_PURPLE, fontWeight: FontWeight.bold, fontSize: 8.0),
                          ),
                          Icon(Icons.arrow_forward_ios, color: LIGHT_PURPLE, size: 8,),
                        ],
                      )
                  )),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, top: 10, bottom: 15),
          decoration: BoxDecoration(
            color: LIGHT_COLOR,
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.all(Radius.circular(
                10.0) //         <--- border radius here
            ),
          ),
          width: MediaQuery.of(context).size.width / 3.7,
          height: 67,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                "Nasr City",
                style: TextStyle(
                    color: titleColor, fontWeight: FontWeight.bold, fontSize: 8.0),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 15.0,
                  child: FlatButton(
                      onPressed: () {
//                    return Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => DoctorClinicsDetails()),
//                    );
                      },
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "See Info",
                            style: TextStyle(
                                color: LIGHT_PURPLE, fontWeight: FontWeight.bold, fontSize: 8.0),
                          ),
                          Icon(Icons.arrow_forward_ios, color: LIGHT_PURPLE, size: 8,),
                        ],
                      )
                  )),
            ],
          ),
        ),
      ],
    );

    Widget workingHoursContainers = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 5, right: 3, bottom: 15),
          decoration: BoxDecoration(
            color: LIGHT_COLOR,
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.all(Radius.circular(
                10.0) //         <--- border radius here
            ),
          ),
          width: MediaQuery.of(context).size.width / 6,
          height: 67,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                "Sunday",
                style: TextStyle(
                    color: titleColor, fontWeight: FontWeight.bold, fontSize: 8.0),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              Text(
                "6 PM - 11 PM",
                style: TextStyle(
                    color: LIGHT_PURPLE, fontWeight: FontWeight.bold, fontSize: 8.0),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, right: 3, left: 3, bottom: 15),
          decoration: BoxDecoration(
            color: LIGHT_COLOR,
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.all(Radius.circular(
                10.0) //         <--- border radius here
            ),
          ),
          width: MediaQuery.of(context).size.width / 6,
          height: 67,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                "Sunday",
                style: TextStyle(
                    color: titleColor, fontWeight: FontWeight.bold, fontSize: 8.0),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              Text(
                "6 PM - 11 PM",
                style: TextStyle(
                    color: LIGHT_PURPLE, fontWeight: FontWeight.bold, fontSize: 8.0),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, right: 3, left: 3, bottom: 15),
          decoration: BoxDecoration(
            color: LIGHT_COLOR,
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.all(Radius.circular(
                10.0) //         <--- border radius here
            ),
          ),
          width: MediaQuery.of(context).size.width / 6,
          height: 67,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                "Sunday",
                style: TextStyle(
                    color: titleColor, fontWeight: FontWeight.bold, fontSize: 8.0),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              Text(
                "6 PM - 11 PM",
                style: TextStyle(
                    color: LIGHT_PURPLE, fontWeight: FontWeight.bold, fontSize: 8.0),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, right: 3, left: 3, bottom: 15),
          decoration: BoxDecoration(
            color: LIGHT_COLOR,
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.all(Radius.circular(
                10.0) //         <--- border radius here
            ),
          ),
          width: MediaQuery.of(context).size.width / 6,
          height: 67,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                "Sunday",
                style: TextStyle(
                    color: titleColor, fontWeight: FontWeight.bold, fontSize: 8.0),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              Text(
                "6 PM - 11 PM",
                style: TextStyle(
                    color: LIGHT_PURPLE, fontWeight: FontWeight.bold, fontSize: 8.0),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, left: 3, bottom: 15),
          decoration: BoxDecoration(
            color: LIGHT_COLOR,
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.all(Radius.circular(
                10.0) //         <--- border radius here
            ),
          ),
          width: MediaQuery.of(context).size.width / 6,
          height: 67,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                "Sunday",
                style: TextStyle(
                    color: titleColor, fontWeight: FontWeight.bold, fontSize: 8.0),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              Text(
                "6 PM - 11 PM",
                style: TextStyle(
                    color: LIGHT_PURPLE, fontWeight: FontWeight.bold, fontSize: 8.0),
              ),
            ],
          ),
        ),
      ],
    );


    final body = ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Profile progress\n        75%",
              style: TextStyle(color: LIGHT_GREY, fontSize: 12.0),
            ),
            SizedBox(
              width: 45,
            ),
            CircularPercentIndicator(
              radius: 52.0,
              lineWidth: 5.0,
              percent: 0.75,
              center: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('images/doctorPhoto3.png'),
              ),
              progressColor: PROGRESS_COLOR,
              backgroundColor: GREY_BORDER,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Jessica Parker",
            style: TextStyle(
                color: titleColor, fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 30,
            ),
            Text(
              "About",
              style: TextStyle(
                  color: HINT_COLOR, fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
            SizedBox(
              width: 25,
            ),
            Container(height: 12, child: VerticalDivider(color: HINT_COLOR)),
            SizedBox(
              width: 25,
            ),
            Text(
              "Clinics",
              style: TextStyle(
                  color: COVID_DASH, fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
            SizedBox(
              width: 25,
            ),
            Container(height: 12, child: VerticalDivider(color: HINT_COLOR)),
            SizedBox(
              width: 25,
            ),
            Text(
              "Reviews",
              style: TextStyle(
                  color: HINT_COLOR, fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ],
        ),
        Divider(
          color: COVID_DASH,
          thickness: 2,
          indent: MediaQuery.of(context).size.width / 2.4,
          endIndent: MediaQuery.of(context).size.width / 2.4,),
        SizedBox(
          height: 5,
        ),
        clinicContainer,
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Branches",
              style: TextStyle(
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0),
            ),
            IconButton(
              icon: Image.asset(
                'images/editIcon.png',
                width: 12,
                height: 12,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        branchesContainers,
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Working Hours",
              style: TextStyle(
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0),
            ),
            IconButton(
              icon: Image.asset(
                'images/editIcon.png',
                width: 12,
                height: 12,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        workingHoursContainers,
      ],
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: appColor),
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(color: titleColor, fontSize: 20.0),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
        color: backgroundColor,
        child: body,
      ),
    );
  }
}
