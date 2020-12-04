import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_vitalsignstable_newentry.dart';
import 'package:umedmiscanner/features/EMR/widget/container_table.dart';
import 'package:umedmiscanner/features/EMR/widget/gesture_detector_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/line_chart_sample.dart';
import 'package:umedmiscanner/features/EMR/widget/main_row_home.dart';
import 'package:umedmiscanner/features/EMR/widget/patient_info_container.dart';
import 'package:umedmiscanner/features/EMR/widget/row_item.dart';
import 'package:umedmiscanner/features/EMR/widget/row_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widget.dart';

import 'emr_vitalsigns_table_newentry_one.dart';

class EMRVitalSignsGraph extends StatefulWidget {
  @override
  _EMRVitalSignsGraphState createState() => _EMRVitalSignsGraphState();
}

class _EMRVitalSignsGraphState extends State<EMRVitalSignsGraph> {
  Color activeColor = Color.fromRGBO(82, 9, 116, 1);

  Color unActiveColor = Color.fromRGBO(180, 177, 192, 1);

  bool _selectedEdit = false;
  bool _selectedLine = false;
  bool _selectedTable = false;
  String text = 'Vital Sign';

  bool selectHeart = false;
  bool selectHeartDot = false;
  bool selectThermometers = false;
  bool selectLungs = false;

  //int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  MainRowHome(
                    text: "Specialties",
                    icon: null,
                    onTapFilter: () {
                      /// Filter Action
                      print('Filter');
                    },
                    onTapQrBar: null,
                    onTapSearch: () {
                      /// Search Action
                      print('Search');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: PatientInfoContainer(
                      //horizontalList: HorizontalList(),
                      onTapQr: () {
                        /// Qr share
                        print('Share Qr');
                      },
                    ),
                  ),
                  Container(
                    //  height: 680.0,
                    height: MediaQuery.of(context).size.height * 0.65,

                    child: ListView(
                      children: [

                        //////////////
                        // /////////////////////////////end
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  RowItem(
                                    boxShadow: [
                                      selectHeart
                                          ? BoxShadow(
                                              color: Color.fromRGBO(82, 9, 116, 1),
                                              blurRadius: 15,
                                            )
                                          : BoxShadow()
                                    ],
                                    color: selectHeart
                                        ? Colors.white
                                        : Color.fromRGBO(238, 237, 242, 1),
                                    rowWidget: RowWidget(
                                      imagePath: "images/heart-attack.svg",
                                      text1: '102',
                                      text2: 'b/min',
                                    ),
                                    textWidget1: TextWidget(
                                      text: 'Heart Rate',
                                    ),
                                    child: TextWidget(
                                      text: '5/5/2020',
                                    ),
                                    onTap: () {
                                      // check == 0? unActiveColor:activeColor,
                                      setState(() {
                                        selectHeart = true;
                                        selectHeartDot = false;
                                        selectThermometers = false;
                                        selectLungs = false;
                                        _selectedTable = true;
                                        _selectedLine = false;
                                        _selectedEdit = false;
                                        text = 'Table View';
                                      });
                                    },
                                    onLong: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EMRVitalSignsTableNewEntryOne()));
                                    },
                                  ),
                                  RowItem(
                                    boxShadow: [
                                      selectHeartDot
                                          ? BoxShadow(
                                              color: Color.fromRGBO(82, 9, 116, 1),
                                              blurRadius: 15,
                                            )
                                          : BoxShadow()
                                    ],
                                    color: selectHeartDot
                                        ? Colors.white
                                        : Color.fromRGBO(238, 237, 242, 1),
                                    rowWidget: RowWidget(
                                      imagePath: "images/heartdot.svg",
                                      text1: '110/70',
                                      text2: 'mm/Hg',
                                    ),
                                    textWidget1: TextWidget(
                                      text: 'Blood Pressure',
                                    ),
                                    child: TextWidget(
                                      text: 'Mean Blood Pressure',
                                    ),
                                    onTap: () {
                                      setState(() {
                                        selectHeart = false;
                                        selectHeartDot = true;
                                        selectThermometers = false;
                                        selectLungs = false;
                                        _selectedTable = true;
                                        _selectedLine = false;
                                        _selectedEdit = false;
                                        text = 'Table View';
                                      });
                                    },
                                    onLong: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EMRVitalSignsTableNewEntryOne()));
                                    },
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    RowItem(
                                      boxShadow: [
                                        selectThermometers
                                            ? BoxShadow(
                                                color:
                                                    Color.fromRGBO(82, 9, 116, 1),
                                                blurRadius: 15,
                                              )
                                            : BoxShadow()
                                      ],
                                      color: selectThermometers
                                          ? Colors.white
                                          : Color.fromRGBO(238, 237, 242, 1),
                                      rowWidget: RowWidget(
                                        imagePath: "images/thermometers.svg",
                                        text1: '37',
                                        text2: '˚C',
                                      ),
                                      textWidget1: TextWidget(
                                        text: 'Temprature',
                                      ),
                                      child: TextWidget(
                                        text: '5/5/2020',
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectHeart = false;
                                          selectHeartDot = false;
                                          selectThermometers = true;
                                          selectLungs = false;
                                          _selectedTable = true;
                                          _selectedLine = false;
                                          _selectedEdit = false;
                                          text = 'Table View';
                                        });
                                      },
                                      onLong: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EMRVitalSignsTableNewEntryOne()));
                                      },
                                    ),
                                    RowItem(
                                      boxShadow: [
                                        selectLungs
                                            ? BoxShadow(
                                                color:
                                                    Color.fromRGBO(82, 9, 116, 1),
                                                blurRadius: 15,
                                              )
                                            : BoxShadow()
                                      ],
                                      color: selectLungs
                                          ? Colors.white
                                          : Color.fromRGBO(238, 237, 242, 1),
                                      rowWidget: RowWidget(
                                        imagePath: "images/Lungs.svg",
                                        text1: '25',
                                        text2: 'c/min',
                                      ),
                                      textWidget1: TextWidget(
                                        text: 'Respiratory Rate',
                                      ),
                                      child: TextWidget(
                                        text: '5/5/2020',
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectHeart = false;
                                          selectHeartDot = false;
                                          selectThermometers = false;
                                          selectLungs = true;
                                          _selectedTable = true;
                                          _selectedLine = false;
                                          _selectedEdit = false;
                                          text = 'Table View';
                                        });
                                      },
                                      onLong: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EMRVitalSignsTableNewEntryOne()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ////////////////////////end
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                text,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Gilroy-Bold',
                                  color: Color.fromRGBO(82, 9, 116, 1),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      child: Icon(
                                        Icons.edit,
                                        color: _selectedEdit
                                            ? activeColor
                                            : unActiveColor,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectedEdit = true;
                                          _selectedLine = false;
                                          _selectedTable = false;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EMRVitalSignsTableNewEntry()));
                                        });
                                      },
                                    ),
                                    GestureDetector(
                                      child: Icon(
                                        Icons.stacked_line_chart_outlined,
                                        color: _selectedLine
                                            ? activeColor
                                            : unActiveColor,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectedLine = true;
                                          _selectedEdit = false;
                                          _selectedTable = false;
                                          text = 'Graph View';
                                        });
                                      },
                                    ),
                                    GestureDetector(
                                      child: Icon(
                                        Icons.table_chart,
                                        color: _selectedTable
                                            ? activeColor
                                            : unActiveColor,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectedTable = true;
                                          _selectedEdit = false;
                                          _selectedLine = false;
                                          text = 'Table View';
                                        });
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        //  LineCharts(),
                        _selectedLine
                            ? LineChartSample()
                            : Text(
                                "",
                                style: TextStyle(fontSize: 1.0),
                              ),
                        _selectedTable
                            ? ContainerTable()
                            : Text(
                                "",
                                style: TextStyle(fontSize: 1.0),
                              ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: GestureDetectorWidget(
                              text: 'Edit',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EMRVitalSignsTableNewEntry()));
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
