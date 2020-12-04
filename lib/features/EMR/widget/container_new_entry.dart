import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umedmiscanner/features/EMR/widget/container_one.dart';

class ContainerNewEntry extends StatefulWidget {
  const ContainerNewEntry({
    Key key,
    @required this.select,
    @required this.imagePath,
    @required this.textDef,
    @required this.textOne,
    @required this.textDate,
  }) : super(key: key);

  final bool select;
  final imagePath;
  final textDef;
  final textOne;
  final textDate;

  @override
  _ContainerNewEntryState createState() => _ContainerNewEntryState();
}

class _ContainerNewEntryState extends State<ContainerNewEntry> {
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
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: 364.0,
        height: 100.0,
        decoration: BoxDecoration(
          //   color: widget.color,
          color:
              widget.select ? Colors.white : Color.fromRGBO(238, 237, 242, 1),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            widget.select
                ? BoxShadow(
                    color: Color.fromRGBO(82, 9, 116, 1),
                    blurRadius: 20,
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
                  child: Text(
                    //   widget.textDef,
                    widget.textDef,
                    style: TextStyle(
                      fontSize: 11.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Gilroy-Bold',
                      color: Color.fromRGBO(29, 40, 46, 1),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                      width: 30.0, height: 30.0, child: SvgPicture.asset(
                          //widget.imagePath
                          widget.imagePath)),
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
                Padding(
                  padding: const EdgeInsets.only(left: 80.0),
                  child: Row(
                    //    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ContainerOne(),
                      ///////////////////////
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          width: 80.0,
                          height: 9.0,
                          child: Text(
                            // widget.textOne,
                            widget.textOne,
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
                                    child: Icon(Icons.calendar_today_rounded)),
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
                            widget.textDate,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
