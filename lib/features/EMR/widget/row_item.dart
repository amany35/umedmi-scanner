import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_vital_signs_graph.dart';

class RowItem extends StatelessWidget {
  final Widget rowWidget;
  final Widget textWidget1;
  final Widget child;
  final color;
  final boxShadow;
  final onTap;
  final onLong;

//
  const RowItem({Key key, this.rowWidget, this.textWidget1, this.child, this.color, this.boxShadow,this.onTap, this.onLong})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 170.0,
        height: 100.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: boxShadow,
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Wrap(
            direction: Axis.vertical,
           // alignment: WrapAlignment.spaceAround,
            children: [
              rowWidget,
              textWidget1,
              child
            ],
          ),
        ),
      ),
       onTap: onTap,
      onLongPress: onLong,
    );
  }
}
