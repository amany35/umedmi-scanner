import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widgett.dart';

import 'fdot_widget.dart';
import 'icon_widget.dart';

class RowActiveWidget extends StatefulWidget {
  const RowActiveWidget({
    Key key,
    @required this.textDef,
    @required this.text,
    @required this.textDay,
    this.check,
    @required this.flag,
  }) : super(key: key);

  final textDef;
  final text;
  final textDay;
  final check;
  final flag;

  @override
  _RowActiveWidgetState createState() => _RowActiveWidgetState();
}

class _RowActiveWidgetState extends State<RowActiveWidget> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.check
          ? BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Color.fromRGBO(112, 112, 112, 1),
          ),
          borderRadius: BorderRadius.circular(20.0))
          : BoxDecoration(),
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundColor: Color.fromRGBO(81, 217, 14, 1),
                radius: 5.0,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/doctor_profile.jpg'),
                radius: 18.0,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: FDottedLineWidget(
              height: 60.0,
            ),
          ),
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.start,
            children: [
              widget.flag?Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 130),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: Center(
                        child: CustomSwitchButton(
                          backgroundColor: isChecked
                              ? Color.fromRGBO(197, 194, 213, 1)
                              : Colors.grey,
                          unCheckedColor: Colors.white,
                          animationDuration:
                          Duration(milliseconds: 300),
                          checkedColor: Color.fromRGBO(82, 9, 116, 1),
                          checked: isChecked,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  TextWidgett(
                    text: 'Primary Diagnosis',
                    color: Color.fromRGBO(82, 9, 116, 1),
                  ),

                ],
              ):Container(),
              Row(
                children: [

                  Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Container(
                        width: 150.0,
                        child: TextWidgett(
                          text: widget.textDef,
                          color: Color.fromRGBO(29, 40, 46, 1),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                        child: Wrap(
                          alignment: WrapAlignment.end,
                          direction: Axis.horizontal,
                          // mainAxisAlignment: MainAxisAlignment.,

                          children: [

                            widget.flag? Row(
                              children: [
                                Icon(
                                  Icons.flag_outlined,
                                  size: 12,
                                  color: Colors.red,
                                ),
                                Text(
                                  '3 Flags',
                                  style: TextStyle(
                                    fontSize: 7.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Gilroy-Bold',
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            )
                                : Container(),

                            IconWidget(
                              icon: Icons.local_offer_outlined,
                            ),
                            TextWidgett(
                              text: '3',
                              color: Color.fromRGBO(82, 9, 116, 1),
                            ),
                            IconWidget(
                              icon: Icons.today_rounded,
                            ),
                            TextWidgett(
                              text: widget.textDay,
                              color: Color.fromRGBO(82, 9, 116, 1),
                            ),
                          ],
                        )),
                  )
                ],
              ),

              Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // width: 275.0,
                    child: Text(
                      'Made on 15/11/2020',
                      style: TextStyle(
                        color: Color.fromRGBO(197, 194, 213, 1),
                        fontSize: 9.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Gilroy-Bold',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      //  width: 275.0,
                      child: TextWidgett(
                        text: 'Diagnosed By: Dr.Andrew Parker',
                        color: Color.fromRGBO(29, 40, 46, 1),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 300.0,
                child: TextWidgett(
                  text: widget.text,
                  color: Color.fromRGBO(82, 9, 116, 1),
                ),
              ),
              SizedBox(
                // height: 30.0,
                width: 300.0,
                child: Divider(
                  thickness: 2.0,
                ),
              ),
              ////////////////////////////////
            ],
          )
        ],
      ),
    );
  }
}
