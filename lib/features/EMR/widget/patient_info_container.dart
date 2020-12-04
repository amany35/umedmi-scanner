import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/icons/diabetes_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/female_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/insured_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/patient_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/pharmacy_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/share_purple_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/woman_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/years_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_prescriptions.dart';

import 'container_btn.dart';

class PatientInfoContainer extends StatefulWidget {

  final onTapQr;


  const PatientInfoContainer({Key key, this.onTapQr}) : super(key: key);

  @override
  _PatientInfoContainerState createState() => _PatientInfoContainerState();
}

class _PatientInfoContainerState extends State<PatientInfoContainer> {
  int iconNumber = 0;
  Icon bookmark = Icon(Icons.bookmark_outlined,
      size: 20.0, color: Color.fromRGBO(255, 108, 145, 1));

  Color activeShareColor = Color.fromRGBO(218, 191, 222, 1);

  Color unActiveShareColor = Color.fromRGBO(180, 177, 192, 1);

  int widgetNumber = 0;

  Widget gestureDetector = GestureDetector(
  child: Icon(SharePurpleIcon.shared_purple,
  size: 20.0, color: Color.fromRGBO(82, 9, 116, 1)),
  );
  // bool _selectedText = false;

  @override
  Widget build(BuildContext context) {
    Widget hrozintal = Container(
      height: 55.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ContainerBtn(
            color: Color.fromRGBO(218, 191, 222, 1),
            text: 'Female',
            colorText: Color.fromRGBO(82, 9, 116, 1),
            icon: FemaleIcon.female,
            colorIcon: Color.fromRGBO(0, 0, 0, 1),
            select: 0,
          ),
          ContainerBtn(
            color: Color.fromRGBO(255, 223, 231, 1),
            text: 'Pregnant',
            colorText: Color.fromRGBO(255, 108, 145, 1),
            icon: WomanIcon.woman,
            colorIcon: Color.fromRGBO(0, 0, 0, 1),
            select: 0,
          ),
          ContainerBtn(
            color: Color.fromRGBO(244, 222, 247, 1),
            text: 'Years',
            colorText: Color.fromRGBO(133, 45, 145, 1),
            icon: YearsIcon.year,
            colorIcon: Color.fromRGBO(82, 9, 116, 1),
            select: 0,
          ),
          ContainerBtn(
            color: Color.fromRGBO(222, 247, 224, 1),
            text: 'Insured',
            colorText: Color.fromRGBO(45, 145, 82, 1),
            icon: InsuredIcon.insured,
            colorIcon: Color.fromRGBO(45, 145, 82, 1),
            select: 0,
          ),
          ContainerBtn(
            color: Color.fromRGBO(255, 223, 231, 1),
            text: 'Salmonella',
            colorText: Color.fromRGBO(255, 108, 145, 1),
            icon: DiabetesIcon.diabetes,
            colorIcon: Color.fromRGBO(255, 108, 145, 1),
            select: 0,
          ),
          ContainerBtn(
            color: widgetNumber==1 ? unActiveShareColor : activeShareColor,
            text: 'Share',
            colorText: widgetNumber==1
                ? Colors.grey.withOpacity(0.9)
                : Color.fromRGBO(82, 9, 116, 1),
            icon: SharePurpleIcon.shared_purple,
            colorIcon: widgetNumber==1
                ? Colors.grey.withOpacity(0.9)
                : Color.fromRGBO(82, 9, 116, 1),
            onTap: () {
              setState(() {
               // _selected = true;
                // _selectedText = _selected;
                if (widgetNumber == 0) {
                  gestureDetector = Container(
                    width: 1.0,
                    height: 1.0,
                  );
                  widgetNumber = 1;

                } else {
                  gestureDetector = GestureDetector(
                    child: Icon(SharePurpleIcon.shared_purple,
                        size: 20.0, color: Color.fromRGBO(82, 9, 116, 1)),
                  );
                  widgetNumber = 0;
                }
              });
            },
            select: widgetNumber,
          ),
          ContainerBtn(
            color: Color.fromRGBO(222, 247, 224, 1),
            text: 'Prescripe',
            colorText: Color.fromRGBO(82, 9, 116, 1),
            icon: PharmacyIcon.pharmacy,
            colorIcon: Color.fromRGBO(82, 9, 116, 1),
            select: 0,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EmrPrescriptions()));
            },
          )
        ],
      ),
    );

    return Container(
      width: 374.0,
      height: 140.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 10,
              blurRadius: 15,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(81, 217, 14, 1),
                    radius: 5.0,
                  ),
                ),
                SizedBox(
                  width: 280.0,
                ),
                GestureDetector(
                  child: bookmark,
                  onTap: () {
                    setState(() {
                      if (iconNumber == 0) {
                        bookmark = Icon(Icons.bookmark_outlined,
                            size: 20.0,
                            color: Color.fromRGBO(255, 108, 145, 1));
                        iconNumber = 1;
                      } else {
                        bookmark = Icon(Icons.bookmark_border,
                            size: 20.0,
                            color: Color.fromRGBO(255, 108, 145, 1));
                        iconNumber = 0;
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/profile_image.jpg'),
                  radius: 18.0,
                ),
                Column(
                  children: [
                    Text(
                      'Basma Ali (#206541)',
                      style: TextStyle(
                        fontSize: 12.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Gilroy-Bold',
                        color: Color.fromRGBO(82, 9, 116, 1),
                      ),
                    ),
                    Text(
                      'Last Visiton 20/1/2019',
                      style: TextStyle(
                        fontSize: 8.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Gilroy-SemiBold',
                        color: Color.fromRGBO(197, 194, 213, 1),
                      ),
                    ),
                  ],
                ),
///////////////////////////////////////
                GestureDetector(
                  child: Icon(Icons.qr_code_outlined,
                      size: 25.0, color: Color.fromRGBO(82, 9, 116, 1)),
                  onTap: widget.onTapQr,
                ),
                Container(
                  width: 72.0,
                  height: 15.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromRGBO(255, 108, 145, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        PatientIcon.patientinfo,
                        size: 12.0,
                        color: Color.fromRGBO(174, 31, 67, 1),
                      ),
                      Text(
                        '6 Critical Points',
                        style: TextStyle(
                          fontSize: 7.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'Gilroy-Regular',
                          color: Color.fromRGBO(174, 31, 67, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                /*!_selected
                    ? GestureDetector(
                        child: Icon(SharePurpleIcon.shared_purple,
                            size: 20.0, color: Color.fromRGBO(82, 9, 116, 1)),
                      )
                    : Container(
                        width: 1.0,
                        height: 1.0,
                      ),*/
                gestureDetector,
                SizedBox(
                  width: 8.0,
                ),
               widgetNumber == 0? Text(
                        '3',
                        style: TextStyle(
                          fontSize: 10.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'Gilroy-Bold',
                          color: Color.fromRGBO(82, 9, 116, 1),
                        ),
                      ): Container(
                 width: 1.0,
                 height: 1.0,
               )

              ],
            ),
            Container(
              height: 55.0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[hrozintal],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
