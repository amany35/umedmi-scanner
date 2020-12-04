import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/common/StarDisplay.dart';
import 'package:umedmiscanner/features/subscription/subscriptionSteps/SubscriptionPlans.dart';


import 'AboutDoctor.dart';
import 'DoctorClinics.dart';
import 'DoctorReviews.dart';

class DoctorProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DoctorProfileScreenState();
  }
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen>
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
    final body = Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Profile progress\n        75%",
              style: TextStyle(color: LIGHT_GREY, fontSize: 12.0),
            ),
            SizedBox(
              width: 20,
            ),
            CircularPercentIndicator(
              radius: 102.0,
              lineWidth: 5.0,
              percent: 0.75,
              center: CircleAvatar(
                radius: MediaQuery.of(context).size.width * .13,
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
            "Dr. Mostafa Alaa",
            style: TextStyle(
                color: titleColor, fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
            child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "Dentist",
                style: TextStyle(color: titleColor, fontSize: 12),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .35),
              child: Row(
                children: <Widget>[
                  IconTheme(
                    data: IconThemeData(
                      color: ratingColor,
                      size: 15,
                    ),
                    child: StarDisplay(value: 5),
                  ),
                  Text(
                    "(4.6)",
                    style: TextStyle(
                        color: MESSAGE_BACKGROUND_COLOR, fontSize: 10.0),
                  ),
                  Text(
                    "Overall Rating",
                    style: TextStyle(
                        color: MESSAGE_BACKGROUND_COLOR, fontSize: 10.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width * .1),
              child: Row(
                children: <Widget>[
                  CircularPercentIndicator(
                    radius: 111.0,
                    lineWidth: 5.0,
                    percent: 0.6,
                    center: Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "60%",
                            style: TextStyle(color: titleColor, fontSize: 20.0),
                          ),
                          Text(
                            "Total bookings to\ntotal profile views",
                            style: TextStyle(
                                color: LIGHT_GREY_TEXT, fontSize: 8.0),
                          ),
                        ],
                      ),
                    ),
                    progressColor: PROGRESS_COLOR,
                    backgroundColor: GREY_BORDER,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  CircularPercentIndicator(
                    radius: 111.0,
                    lineWidth: 5.0,
                    percent: 0.2,
                    center: Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "20%",
                            style: TextStyle(color: titleColor, fontSize: 20.0),
                          ),
                          Text(
                            "Total critical patients\nfrom total patients",
                            style: TextStyle(
                                color: LIGHT_GREY_TEXT, fontSize: 8.0),
                          ),
                        ],
                      ),
                    ),
                    progressColor: PROGRESS_COLOR,
                    backgroundColor: GREY_BORDER,
                  ),
                ],
              ),
            ),
            Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * .03),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * .04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(12.0) //         <--- border radius here
                      ),
                  boxShadow: [
                    BoxShadow(
                      color: SHADOW,
                      offset: Offset(0.0, 10.0), //(x,y)
                      blurRadius: 15.0,
                    ),
                  ],
                ),
                // color: Colors.white,
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * .6),
                      child: Text(
                        "Biography",
                        style: TextStyle(
                            color: titleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * .02),
                      child: Text(
                        "Dentist Specialied in Adult detnistry pediatric Dentistry, Endodntics, Cosmitic Dentistry, Implantology Oral and maxifictoral surgery",
                        style:
                            TextStyle(color: BIOGRAPHY_COLOR, fontSize: 14.0),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 160.0,
              height: 42.0,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(85, 24, 114, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(85, 24, 114, 1),
                      blurRadius: 5.0,
                      // changes position of shadow
                    ),
                  ]),
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubscriptionPlans()),
                    );
                  },
                  child: Text('Upgrade now!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 14.0,
                        fontFamily: 'GilroyLight',
                        decoration: TextDecoration.none,
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            new Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: new BoxDecoration(color: backgroundColor),
              child: new TabBar(
                  controller: _tabController,
                  indicatorColor: TAPS_COLOR,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: TAPS_COLOR,
                  unselectedLabelColor: HINT_COLOR,
                  tabs: tabList),
            ),
            new Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              height: MediaQuery.of(context).size.height,
              child: new TabBarView(
                controller: _tabController,
                children: <Widget>[
                  AboutDoctor(),
                  DoctorClinics(),
                  DoctorReviews(),
                ],
              ),
            ),
          ],
        )),
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
