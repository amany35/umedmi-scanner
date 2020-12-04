import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widgett.dart';

import 'container_one.dart';

class ContainerBlood extends StatefulWidget {
  final bool select;

  const ContainerBlood({
    Key key,
    @required this.select,
  }) : super(key: key);

  @override
  _ContainerBloodState createState() => _ContainerBloodState();
}

class _ContainerBloodState extends State<ContainerBlood> {
  int groupValue;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Color.fromRGBO(82, 9, 116, 1),
                onPrimary: Colors.white,
              ),
              buttonTheme: ButtonThemeData(
                colorScheme: Theme.of(context)
                    .colorScheme
                    .copyWith(primary: Colors.black),
              ),
            ),
            child: child,
          );
        },
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        width: 364.0,
        decoration: BoxDecoration(
          color:
              widget.select ? Colors.white : Color.fromRGBO(238, 237, 242, 1),
          // color: widget.color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            widget.select
                ? BoxShadow(
                    color: Color.fromRGBO(82, 9, 116, 1),
                    blurRadius: 15,
                  )
                : BoxShadow()
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: TextWidgett(
                      text: 'Blood Pressure',
                      color: Color.fromRGBO(29, 40, 46, 1)),
                ),
              ],
            ),
            Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                      width: 30.0,
                      height: 30.0,
                      child:
                          SvgPicture.asset('images/blood-pressure-gauge.svg')),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: FDottedLine(
                    color: Color.fromRGBO(82, 9, 116, 1),
                    height: 50.0,
                    strokeWidth: 2.0,
                    dottedLength: 3.0,
                    space: 1.0,
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  direction: Axis.vertical,
                  children: [
                    Row(
                      //    mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextWidgett(
                            text: 'Blood Pressure',
                            color: Color.fromRGBO(29, 40, 46, 1)),
                        Padding(
                          padding: const EdgeInsets.only(left: 9.0),
                          child: ContainerOne(),
                        ),
                        Text(
                          '/',
                          style: TextStyle(
                            fontSize: 20.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Gilroy-Bold',
                            color: Color.fromRGBO(82, 9, 116, 1),
                          ),
                        ),
                        ContainerOne(),
                        ///////////////////////
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Container(
                            width: 20.0,
                            height: 10.0,
                            child: Text(
                              'mmHg',
                              style: TextStyle(
                                fontSize: 8.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'Gilroy-Bold',
                                color: Color.fromRGBO(82, 9, 116, 1),
                              ),
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child:
                                          Icon(Icons.calendar_today_rounded)),
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: groupValue,
                                  activeColor: Color.fromRGBO(82, 9, 116, 1),
                                  //  onChanged: (int e) => dosomething(e),
                                ),
                              ],
                            ),
                            Text(
                              'Made on 20/1/2019',
                              style: TextStyle(
                                fontSize: 9.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'Gilroy-Bold',
                                color: Color.fromRGBO(108, 108, 108, 1),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Mean Art, Pressure',
                          style: TextStyle(
                            fontSize: 11.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Gilroy-Bold',
                            color: Color.fromRGBO(29, 40, 46, 1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: ContainerOne(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            width: 30.0,
                            height: 10.0,
                            child: Text(
                              'mmHg',
                              style: TextStyle(
                                fontSize: 8.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'Gilroy-Bold',
                                color: Color.fromRGBO(82, 9, 116, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
