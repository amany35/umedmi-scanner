import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widgett.dart';

import 'column_widget_patient_dim.dart';

class ContainerPsy extends StatelessWidget {
  const ContainerPsy({
    Key key, this.imagePath, this.text, this.txtD, this.txtS,
  }) : super(key: key);


  final imagePath;
  final text;
  final txtD;
  final txtS;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: 350,
        height: 40.0,
        decoration: BoxDecoration(
            color: Color.fromRGBO(238, 237, 242, 1)
          //borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              imagePath,
              color: Color.fromRGBO(82, 9, 116, 1),
              width: 30.0,
              height: 30.0,
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
              padding: const EdgeInsets.only(left: 5.0),
              child: TextWidgett(
                text: text,
                color: Color.fromRGBO(82, 9, 116, 1),
              ),
            ),
            SizedBox(
              width: 135.0,
            ),
            Row(
              //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ContainerText(
                  textDef: txtD,
                  color: Color.fromRGBO(197, 194, 213, 1),
                ),
                VerticalDivider(
                  thickness: 2.0,
                  endIndent: 15.0,
                  indent: 10.0,
                ),
                ContainerText(
                  textDef: txtS,
                  color: Color.fromRGBO(197, 194, 213, 1),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}