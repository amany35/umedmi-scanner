

import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/icons/doctor_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widgett.dart';

import 'container_patient.dart';

class ContainerPed extends StatelessWidget {
  const ContainerPed({
    Key key,
    @required this.color,
    this.text, this.childRow, this.textLast,
  }) : super(key: key);

  final Color color;
  final text;
  final Widget childRow;
  final textLast;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ContainerPatient(
        height: 100.0,
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.9),
                                blurRadius: 15.0),
                          ],
                        ),
                        child: Icon(
                          DoctorIcon.doctor,
                          size: 150.0,
                          color: Color.fromRGBO(82, 9, 116, 1),
                        )),
                    SizedBox(
                      width: 230.0,

                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child: Icon(Icons.bookmark_outline_outlined,
                              size: 20.0, color: Color.fromRGBO(255, 108, 145, 1)),
                        ),
                        childRow,
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(81, 217, 14, 1),
                    radius: 5.0,
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/doctor_profile.jpg'),
                  radius: 18.0,
                ),
                Column(
                 // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                     // width: 15.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidgett(
                            text: 'Dr.Amr Elsawy',
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                                width: 40.0,
                                height: 40.0,
                                child: Image.asset('images/logo.jpg')),
                          ),
                          SizedBox(
                            width: 70,
                            child: GestureDetector(
                              child: Icon(
                                Icons.qr_code_outlined,
                                color: Color.fromRGBO(82, 9, 116, 1),
                              ),
                            ),
                          ),
                          ////////////////////// add

                          ////////////////end
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidgett(
                            text: text,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Container(
                              child: Row(
                            children: [
                              IconWeidget(
                                color: color,
                              ),
                              IconWeidget(
                                color: color,
                              ),
                              IconWeidget(
                                color: color,
                              ),
                              IconWeidget(
                                color: color,
                              ),

                              Icon(
                                Icons.star,
                                color: Colors.grey.withOpacity(0.3),
                                size: 10.0,
                              ),
                             textLast,
                            ],
                          ))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconWeidget extends StatelessWidget {
  const IconWeidget({
    Key key,
    this.color,
  }) : super(key: key);

  final color;
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: color,
      size: 10.0,
    );
  }
}
