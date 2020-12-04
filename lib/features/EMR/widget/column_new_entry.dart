import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/widget/row_item.dart';
import 'package:umedmiscanner/features/EMR/widget/row_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widget.dart';

import 'close_container.dart';
import 'container_blood.dart';
import 'container_new_entry.dart';

class ColumnNewEntry extends StatefulWidget {
  @override
  _ColumnNewEntryState createState() => _ColumnNewEntryState();
}

class _ColumnNewEntryState extends State<ColumnNewEntry> {
  Color activeColor = Colors.white;

  Color unActiveColor = Color.fromRGBO(238, 237, 242, 1);

  bool selectHeart = false;

  bool selectHeartDot = false;

  bool selectThermometers = false;

  bool selectLungs = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Select Vital Signs :',
                style: TextStyle(
                  fontSize: 15.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'Gilroy-Bold',
                  color: Color.fromRGBO(82, 9, 116, 1),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
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
                color: selectHeart ? activeColor : unActiveColor,
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
                  setState(() {
                    selectHeart = true;
                    selectHeartDot = false;
                    selectThermometers = false;
                    selectLungs = false;
                  });
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
                color: selectHeartDot ? activeColor : unActiveColor,
                rowWidget: RowWidget(
                  imagePath: "images/blood-pressure-gauge.svg",
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
                  /// animated  action
                  setState(() {
                    selectHeart = false;
                    selectHeartDot = true;
                    selectThermometers = false;
                    selectLungs = false;
                  });
                },
              ),
            ],
          ),
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
                          color: Color.fromRGBO(82, 9, 116, 1),
                          blurRadius: 15,
                        )
                      : BoxShadow()
                ],
                color: selectThermometers ? activeColor : unActiveColor,
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
                  /// animated  action
                  setState(() {
                    selectHeart = false;
                    selectHeartDot = false;
                    selectThermometers = true;
                    selectLungs = false;
                  });
                },
              ),
              RowItem(
                boxShadow: [
                  selectLungs
                      ? BoxShadow(
                          color: Color.fromRGBO(82, 9, 116, 1),
                          blurRadius: 15,
                        )
                      : BoxShadow()
                ],
                color: selectLungs ? activeColor : unActiveColor,
                rowWidget: RowWidget(
                  imagePath: "images/heartrate.svg",
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
                  /// animated  action
                  setState(() {
                    selectHeart = false;
                    selectHeartDot = false;
                    selectThermometers = false;
                    selectLungs = true;
                  });
                },
              ),
            ],
          ),
        ),
        ////////////////////////////////////////

        ContainerNewEntry(
          select: selectHeart,
          imagePath: 'images/heart-attack.svg',
          textDef: 'Heart Rate :',
          textOne: 'beats/min',
          textDate: 'Made on 15/1/2019',
        ),

        ContainerBlood(
          select: selectHeartDot,
        ),

        //  ContainerNewEntryNew(select: selectHeartDot),
        ContainerNewEntry(
          select: selectThermometers,
          imagePath: 'images/thermometers.svg',
          textDef: ' Temperature :',
          textOne: '˚C',
          textDate: 'Made on 20/2/2019',
        ),
        ContainerNewEntry(
          select: selectLungs,
          imagePath: 'images/Lungs.svg',
          textDef: ' Respiratory Rate :',
          textOne: 'Cycle/min',
          textDate: 'Made on 20/2/2019',
        ),
      ],
    );
  }
}
