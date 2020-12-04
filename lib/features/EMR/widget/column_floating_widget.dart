
import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/icons/scan_icon_icons.dart';

class ColumnFloatingWidget extends StatelessWidget {
  const ColumnFloatingWidget({
    Key key, this.checkIcon,
  }) : super(key: key);

  final checkIcon;
  @override
  Widget build(BuildContext context) {
    return
      FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          /// Camera Home
          print('Camera Home');
        },
        child:
        checkIcon?Padding(
          padding: const EdgeInsets.only(left: 14.0, top: 13.0),
          child:
          Icon(
            ScanIcon.scan  ,
            color: Color.fromRGBO(82, 9, 116, 1),
            size: 250.0,
          ),
        ): Icon(
          Icons.add  ,
          color: Color.fromRGBO(82, 9, 116, 1),
          size: 25.0,
        ),
        backgroundColor:  Color.fromRGBO(218, 191, 222,0.4),
        elevation: 0.0,
      );





  }}


