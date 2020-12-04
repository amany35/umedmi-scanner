import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:umedmiscanner/features/Profile/DoctorProfileScreen.dart';
import 'icons/close_icon_icons.dart';
import 'icons/done_icon_icons.dart';

class SubscriptionUnderReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(255, 255, 255, 1),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 22.72,
                            height: 22.72,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(82, 9, 116, 1),
                                  width: 1.5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.arrow_back_ios_rounded,
                                color: Color.fromRGBO(82, 9, 116, 1), size: 15.0),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Individual Subscription',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Gilroy-ExtraBold',
                              fontSize: 25.0,
                              color: Color.fromRGBO(85, 24, 114, 1),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 22.72,
                            height: 22.72,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color.fromRGBO(82, 9, 116, 1),
                                  width: 1.5),
                            ),
                            //child: Icon(Icons.close_rounded,color: Color.fromRGBO(82, 9, 116, 1),size: 18.0),
                            child: Icon(CloseIcon.close,
                                size: 12.0, color: Color.fromRGBO(82, 9, 116, 1)),
                            // child: Tab(icon: Icon(MyFlutterApp.cancel_circled),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(238, 0, 97, 1),
                                blurRadius: 15.0)
                          ]),
                      child: CircularPercentIndicator(
                        radius: 75.0,
                        /* linearGradient: LinearGradient(
                          begin: Alignment.topRight,
                          end:  Alignment.bottomCenter,
                          colors: [Color.fromRGBO(82, 9, 116, 1),Color.fromRGBO(82, 9, 116, 1)]
                        ),*/

                        center: Text(
                          ' 3 of 3',
                          style: TextStyle(
                              fontSize: 16.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'GilroyLight',
                              color: Color.fromRGBO(0, 0, 0, 1),
                              shadows: [
                                Shadow(
                                  blurRadius: 5.5,
                                  color: Color.fromRGBO(101, 99, 112, 1),
                                  // color: Color.fromRGBO(238, 0, 97, 1),
                                  //  offset: Offset(0,3),
                                ),
                              ]),
                        ),
                        animation: true,
                        progressColor: Color.fromRGBO(82, 9, 116, 1),
                        percent: 1.0,
                        lineWidth: 5,
                        circularStrokeCap: CircularStrokeCap.round,
                        //rgb(238, 0, 97)
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            'Subscription Plans',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 22.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'GilroyLight',
                              color: Color.fromRGBO(85, 24, 114, 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Text(
                              'Under Review',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'GilroyLight',
                                decoration: TextDecoration.none,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Individual',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(85, 24, 114, 1),
                            fontSize: 16.0,
                            fontFamily: 'GilroyLight',
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                            height: 40.0,
                            width: 150.0,
                            child: Divider(
                              color: Color.fromRGBO(85, 24, 114, 1),
                              thickness: 2.0,
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Corporate',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(155, 152, 152, 1),
                            fontSize: 16.0,
                            fontFamily: 'GilroyLight',
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                            height: 40.0,
                            width: 150.0,
                            child: Divider(
                              color: Color.fromRGBO(217, 217, 217, 1),
                              thickness: 2.0,
                            )),
                      ],
                    ),
                  ],
                ),
                Container(
                    height: 200.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            width: 5.0),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(133, 45, 145, 1),
                              Color.fromRGBO(116, 36, 132, 1),
                              Color.fromRGBO(117, 37, 133, 1),
                              Color.fromRGBO(119, 38, 134, 1),
                              Color.fromRGBO(133, 45, 145, 1),
                              Color.fromRGBO(129, 43, 142, 1),
                              Color.fromRGBO(133, 45, 145, 1),
                            ]),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            blurRadius: 20.0,
                            // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text(
                            'Titanium Subscription',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 15.0,
                              fontFamily: 'Gilroy-semi',
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: Color.fromRGBO(248, 248, 30, 1),
                              ),
                              Icon(
                                Icons.star_rounded,
                                color: Color.fromRGBO(248, 248, 30, 1),
                              ),
                              Icon(
                                Icons.star_rounded,
                                color: Color.fromRGBO(248, 248, 30, 1),
                              ),
                              Icon(
                                Icons.star_rounded,
                                color: Color.fromRGBO(248, 248, 30, 1),
                              ),
                              Icon(
                                Icons.star_rounded,
                                color: Color.fromRGBO(248, 248, 30, 1),
                              ),
                              Container(
                                width: 120.0,
                                height: 90.0,
                                child:
                                    Image.asset('images/rebot_done.png'),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: 97.56,
                  height: 97.56,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(82, 9, 116, 1),
                    border: Border.all(
                        color: Color.fromRGBO(170, 134, 187, 1), width: 12.0),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(DoneIcon.done,
                      color: Color.fromRGBO(255, 255, 255, 1), size: 30.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Text(
                    'Payment Under Review !!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Gilroy-semi',
                      decoration: TextDecoration.none,
                      color: Color.fromRGBO(74, 74, 74, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    width: 320.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(82, 9, 116, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(85, 24, 114, 1),
                              blurRadius: 15.0)
                        ]),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoctorProfileScreen()),
                        );
                      },
                      child: Text(
                        'Go To Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Gilroy-semi',
                            fontSize: 18.0,
                            decoration: TextDecoration.none,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                    width: 158.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(82, 9, 116, 1), width: 1),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(85, 24, 114, 1),
                              blurRadius: 15.0)
                        ]),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Payment Log',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Arial-bold',
                            fontSize: 12.0,
                            decoration: TextDecoration.none,
                            color: Color.fromRGBO(82, 9, 116, 1)),
                      ),
                    )),
                SizedBox(
                  height:8
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
