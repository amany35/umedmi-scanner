import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_prescriptions.dart';
import 'package:umedmiscanner/features/EMR/widget/close_container.dart';
import 'package:umedmiscanner/features/EMR/widget/container_ped.dart';
import 'package:umedmiscanner/features/EMR/widget/container_psy.dart';

class EmrPrescriptionPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: EmrPrescriptions()),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  // color: Colors.white,
                  color: Colors.grey.shade200.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CloseContainer(),
                          ],
                        ),
                        ContainerPed(
                          text: 'Psychiatrists',
                          color: Colors.amberAccent,
                          childRow: Row(
                            children: [
                              Icon(
                                Icons.file_copy,
                                size: 10.0,
                                color: Color.fromRGBO(82, 9, 116, 1),
                              ),
                              Text(
                                '3 times',
                                style: TextStyle(
                                  fontSize: 5.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Gilroy-semi',
                                  color: Color.fromRGBO(82, 9, 116, 1),
                                ),
                              ),
                            ],
                          ),
                          textLast: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Last Session on 15/3/2020',
                              style: TextStyle(
                                fontSize: 4.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'Gilroy-semi',
                                color: Color.fromRGBO(29, 40, 46, 1),
                              ),
                            ),
                          ),
                        ),
                     /*   Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                         /*   Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 79.0,
                                height: 77.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(80.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(101, 99, 112, 1),
                                          blurRadius: 10.0)
                                    ]),
                                ////////////////////
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(238, 0, 97, 1),
                                                blurRadius: 15.0)
                                          ]),
                                      child: CircularPercentIndicator(
                                        radius: 50.0,
                                        center: Text(
                                          '70 %',
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              decoration: TextDecoration.none,
                                              fontFamily: 'GilroyLight',
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 5.5,
                                                  color: Color.fromRGBO(101, 99, 112, 1),
                                                ),
                                              ]),
                                        ),
                                        animation: true,
                                        progressColor: Color.fromRGBO(82, 9, 116, 1),
                                        percent: 0.7,
                                        lineWidth: 5,
                                        circularStrokeCap: CircularStrokeCap.round,
                                      ),
                                    ),
                                  ],
                                ),
                                ///////////////////
                              ),
                            ),*/
                          ],
                        )*/
                        Stack(
                          children: [
                            Container(
                            //  width: 150.0,
                             // height: 200.0,
                              child: Image.asset('images/prescriptions.jpg',width: 320.0,height: 441.0,),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 79.0,
                                height: 77.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(80.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(101, 99, 112, 1),
                                          blurRadius: 10.0)
                                    ]),
                                ////////////////////
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(238, 0, 97, 1),
                                                blurRadius: 15.0)
                                          ]),
                                      child: CircularPercentIndicator(
                                        radius: 50.0,
                                        center: Text(
                                          '70 %',
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              decoration: TextDecoration.none,
                                              fontFamily: 'GilroyLight',
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 5.5,
                                                  color: Color.fromRGBO(101, 99, 112, 1),
                                                ),
                                              ]),
                                        ),
                                        animation: true,
                                        progressColor: Color.fromRGBO(82, 9, 116, 1),
                                        percent: 0.7,
                                        lineWidth: 5,
                                        circularStrokeCap: CircularStrokeCap.round,
                                      ),
                                    ),
                                  ],
                                ),
                                ///////////////////
                              ),
                            ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

////////////
