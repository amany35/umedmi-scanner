import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/icons/doc_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/intervision_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/patient_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/refer_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/report_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/scan_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/steth_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_patient_information.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_specialties.dart';

import 'column_floating_widget.dart';

class RowOFBtns extends StatelessWidget {


  final color;
  final bool check ;

  const RowOFBtns({Key key, this.color, this.check}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RowItem(
              icon: PatientIcon.patientinfo,
              text: 'Personal Information',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EmrPatientInformation()));
              },
              color: color,
            ),
            RowItem(
              icon: StethIcon.stethoscope__1_,
              text: 'Specialties',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EmrSpecialties()));
              },
              color: color,
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RowItem(
              icon: DocIcon.doctor__4_,
              text: 'Investigations',
              color: color,
            ),
            RowItem(
              icon: IntervisionIcon.intervention,
              text: 'Interventions',
              color: color,
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RowItem(
              icon: ReferIcon.referral,
              text: 'Referrals',
              color: color,
            ),
            RowItem(
              icon: ReportIcon.report,
              text: 'Reports',
              color: color,
            ),
          ],
        ),
       // ColumnFloatingWidget()
      ],
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem({
    Key key,
    @required this.icon,
    @required this.text, this.onTap, this.color,
  }) : super(key: key);

  final icon;
  final text;
  final onTap;
  final color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 150.0,
        height: 148.0,
        decoration: BoxDecoration(
            color: Color.fromRGBO(85, 24, 114, 1),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                // spreadRadius: 10,
                blurRadius: 15,
              ),
            ]),
        child: Container(
          width: 150.0,
          height: 148.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(80.0),
              bottomLeft: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(child: Icon(icon, size: 50.0, color: Color.fromRGBO(82, 9, 116, 1),),
                  onTap: onTap,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 10.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Gilroy-SemiBold',
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
