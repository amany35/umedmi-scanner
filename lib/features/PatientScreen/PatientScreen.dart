import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:umedmiscanner/common/CustomTextWidget.dart';
import 'package:umedmiscanner/features/AddPatient/AddPatientScreen.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientFilter.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientGridView.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientList.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientScreenOptions/CriticalPatients.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientScreenOptions/PendingRequests.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientScreenOptions/RequiredApprovals.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientScreenOptions/SharedPatients.dart';
import 'package:umedmiscanner/features/PatientScreen/PatientSearch.dart';
import 'package:umedmiscanner/features/SingleScan/SingleScan.dart';
import 'package:umedmiscanner/resources/AppColors.dart';


class PatientScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PatientScreenState();
  }
}

class _PatientScreenState extends State<PatientScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  bool isShowGridView = false;

  TabController _tabController;

  File _image;
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    WidgetsBinding.instance.addObserver(this);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tabController.dispose();
    super.dispose();
  }

  showMyPatient(width, height) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: accentColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: height / 6,
          title: optionsContainer(width, height),
        ),
        body: !isShowGridView ? PatientList() : PatientGridView());
  }
  showSharedPatient(width, height) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: accentColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: height / 6,
          title: optionsContainer(width, height),
        ),
        body: !isShowGridView ? PatientList() : PatientGridView());
  }

  addNewPatient(width, height) {
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
                      child: Padding(
                        padding: EdgeInsets.only(top: height / 20),
                        child: Scaffold(
                          backgroundColor: Colors.white,
                          body: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: width / 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          20.0) //         <--- border radius here
                                      ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                width: width / 2.5,
                                height: height / 5,
                                child: ListTile(
                                  onTap: () {
                                    return Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddPatientScreen()),
                                    );
                                  },
                                  title: Padding(
                                    padding:
                                        EdgeInsets.only(bottom: height / 40),
                                    child: Icon(
                                      Icons.add,
                                      color: primaryColor,
                                      size: width / 10,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Add Manually",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width / 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          20.0) //         <--- border radius here
                                      ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                width: width / 2.5,
                                height: height / 5,
                                child: ListTile(
                                  onTap: () {
                                    return Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SingleScan()),
                                    );
                                  },
                                  title: Padding(
                                    padding:
                                        EdgeInsets.only(bottom: height / 40),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          "images/id-card.png",
                                          color: fontColor,
                                          width: width / 10,
                                        ),
                                        SizedBox(
                                          width: width / 30,
                                        ),
                                        Image.asset(
                                          "images/qr-code.png",
                                          color: fontColor,
                                          width: width / 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Scan/Import",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))));
        },
      );
    });
  }

  optionsContainer(width, height) {
    return Container(
        alignment: Alignment.center,
        width: width,
        height: height / 6,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            GestureDetector(

              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PendingRequests()),
                );

              },

              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(20.0) //         <--- border radius here
                      ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                width: width / 5,
                height: height / 10,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/medical-prescription.png",
                        width: width / 20,
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Text(
                        "15",
                        style: TextStyle(
                            fontSize: 12,
                            color: fontColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Text(
                        "Pending \nRequests",
                        style: TextStyle(
                          fontSize: 10,
                          color: fontColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RequiredApprovals()),
                );

              },
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(20.0) //         <--- border radius here
                      ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                width: width / 5,
                height: height / 10,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/drug.png",
                        width: width / 20,
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Text(
                        "6",
                        style: TextStyle(
                            fontSize: 12,
                            color: fontColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Text(
                        "Pending\n Approvals",
                        style: TextStyle(
                          fontSize: 10,
                          color: fontColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SharedPatients()),
                );

              },
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(20.0) //         <--- border radius here
                      ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                width: width / 5,
                height: height / 10,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/Flat.png",
                        width: width / 20,
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Text(
                        "10",
                        style: TextStyle(
                            fontSize: 12,
                            color: fontColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Text(
                        "Shared\n Patients",
                        style: TextStyle(
                          fontSize: 10,
                          color: fontColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CriticalPatients()),
                );

              },
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(20.0) //         <--- border radius here
                      ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                width: width / 5,
                height: height / 10,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/consultation.png",
                        width: width / 20,
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Text(
                        "10",
                        style: TextStyle(
                            fontSize: 12,
                            color: fontColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Text(
                        "Critical\n Patients",
                        style: TextStyle(
                          fontSize: 10,
                          color: fontColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  showPatientSearch(width, height) {
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
                child: PatientSearch(),
              ));
        },
      );
    });
  }

  showPatientFilter(width, height) {
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
              alignment: Alignment.center,
              child: Center(
                child: PatientFilter(),
              ));
        },
      );
    });
  }

  Widget _itemsTab(width) {
    return Container(
      height: 25 + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.all(0),
      width: width,
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(
                  color: chatsMessagesDividerColor,
                  width: 3,
                  style: BorderStyle.solid))),
      child: Tab(
        child: Container(
          width: width / 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person,
                  size: width / 15,
                  color: _tabController.index == 0
                      ? primaryColor
                      : unActiveTabbarColor),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: Material(
          type: MaterialType.transparency,
          //Makes it usable on any background color, thanks @IanSmith
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 4.0),
              color: accentColor,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              //This keeps the splash effect within the circle
              borderRadius: BorderRadius.circular(1000.0),
              //Something large to ensure a circle
              onTap: () {
                addNewPatient(width, height);
              },
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.add,
                  color: primaryColor,
                  size: 25,
                ),
              ),
            ),
          )),
      appBar: AppBar(
        backgroundColor: accentColor,
        elevation: 0,
        toolbarHeight: height / 5,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: primaryColor,
              size: width / 20,
            )),
        title: Container(
          width: width / 1.5,
          height: height / 15,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            color: Colors.white,
            border: Border.all(color: primaryColor, width: 2.0),
            borderRadius: BorderRadius.all(
                Radius.circular(10.0) //                 <--- border radius here
                ),
          ),
          child: Center(
            child: ListTile(
              title: Text(
                _tabController.index == 0 ?  "Patients" : "Shared Patients",
                style: TextStyle(color: fontColor),
                textAlign: TextAlign.center,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "images/qr-code.png",
                    color: primaryColor,
                    width: width / 30,
                  ),
                  SizedBox(
                    width: width / 50,
                  ),
                  GestureDetector(
                      onTap: () {
                        showPatientSearch(width, height);
                      },
                      child: Icon(
                        Icons.search,
                        color: primaryColor,
                        size: width / 30,
                      ))
                ],
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                showPatientFilter(width, height);
              },
              child: Image.asset(
                "images/filter.png",
                color: primaryColor,
                width: width / 30,
              )),
          SizedBox(
            width: width / 50,
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  isShowGridView
                      ? isShowGridView = false
                      : isShowGridView = true;
                });
              },
              child: Icon(
                isShowGridView ? Icons.list : Icons.grid_view,
                color: primaryColor,
                size: width / 25,
              )),
          SizedBox(
            width: width / 50,
          ),
        ],
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 30),
            child: TabBar(
              controller: _tabController,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: primaryColor),
                insets: EdgeInsets.symmetric(horizontal: width / 4.5),
                //  insets: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width* 0.1)
              ),
              unselectedLabelColor: unActiveTabbarColor,
              labelColor: primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: EdgeInsets.all(0),
              indicatorPadding: EdgeInsets.all(0),
              tabs: <Widget>[
                _itemsTab(width),
                Tab(
                  child: Container(
                    width: width / 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.users,
                            size: width / 15,
                            color: _tabController.index == 1
                                ? primaryColor
                                : unActiveTabbarColor),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          showMyPatient(width, height),
          showSharedPatient(width, height),
        ],
      ),
    );
  }
}
