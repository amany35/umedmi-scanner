import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/icons/diabetes_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/female_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/insured_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/male_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/patient_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/pharmacy_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/share_purple_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/woman_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/years_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_prescriptions.dart';

import 'container_btn.dart';

class ContainerMainData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      height: 120.0,
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
        padding: const EdgeInsets.only(left: 10.0,top:10.0),
        child: Column(
          children: [
            Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/profile_image.jpg'),
                  radius: 18.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Danny Scott',
                        style: TextStyle(
                          fontSize: 12.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'Gilroy-Bold',
                          color: Color.fromRGBO(29, 40, 46, 1),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 72.0,
                            height: 15.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color.fromRGBO(255, 108, 145, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  '3',
                                  style: TextStyle(
                                    fontSize: 7.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Gilroy-Regular',
                                    color: Color.fromRGBO(174, 31, 67, 1),
                                  ),
                                ),
                                Icon(
                                  Icons.flag_outlined,
                                  size: 12,
                                  color: Color.fromRGBO(255, 108, 145, 1),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
//////////////////////////////////////
              ],
            ),
            Container(
              height: 55.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerBtn(
                    color: Color.fromRGBO(105, 142, 217, 1),
                    text: 'Male',
                    colorText: Color.fromRGBO(54, 114, 241, 1),
                    icon: MaleIcon.man,
                    colorIcon: Color.fromRGBO(0, 127, 250, 1),
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
                    text: 'Diabetic',
                    colorText: Color.fromRGBO(255, 108, 145, 1),
                    icon: DiabetesIcon.diabetes,
                    colorIcon: Color.fromRGBO(255, 108, 145, 1),
                    select: 0,
                  ),
                ],
              ),
            ),

            /////////////////////
          ],
        ),
      ),
    );
  }
}
