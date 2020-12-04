import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/EMR/widget/row_widget_container_start.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widgett.dart';

class ContainerWidgetPrescription extends StatelessWidget {


  final text;
  final check;

  const ContainerWidgetPrescription({Key key, @required  this.text, this.check}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
     // width: 600.0,
      //  height: MediaQuery.of(context).size.height * 0.60,
      decoration: BoxDecoration(
        color: Color.fromRGBO(197, 194, 213, 1),
        border: Border.all(color: Color.fromRGBO(197, 194, 213, 1)),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          //////////
          RowWidgetContainerStart(text: text,),
          /*Container(
            height: 250.0,
          ),
          SizedBox(
            width: 300.0,
            child: Divider(
              thickness: 1.0,
            ),
          ),*/
          check? RowWidgetContainerEnd():Container()
        ],
      ),
    );
  }
}

//////////
class RowWidgetContainerEnd extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.start,
          children: [
            TextWidgett(
              text: 'Address',
              color: Color.fromRGBO(29, 40, 46, 1),
            ),
            Row(
              children: [
                Text(
                  'Shatiby Branch :',
                  style: TextStyle(
                    fontSize: 9.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Gilroy-m',
                    color: Color.fromRGBO(82, 9, 116, 1),
                  ),
                ),
                Text(
                  'adddress description',
                  style: TextStyle(
                    fontSize: 8.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Gilroy-m',
                    color: Color.fromRGBO(29, 40, 46, 1),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Manshia Branch :',
                  style: TextStyle(
                    fontSize: 9.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Gilroy-m',
                    color: Color.fromRGBO(82, 9, 116, 1),
                  ),
                ),
                Text(
                  'adddress description',
                  style: TextStyle(
                    fontSize: 8.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Gilroy-m',
                    color: Color.fromRGBO(29, 40, 46, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
        Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.start,
          children: [
            TextWidgett(
              text: 'Phones',
              color: Color.fromRGBO(29, 40, 46, 1),
            ),
            Row(
              children: [
                Text(
                  'Mobile :',
                  style: TextStyle(
                    fontSize: 9.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Gilroy-m',
                    color: Color.fromRGBO(82, 9, 116, 1),
                  ),
                ),
                Text(
                  '012222222222',
                  style: TextStyle(
                    fontSize: 8.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Gilroy-m',
                    color: Color.fromRGBO(29, 40, 46, 1),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Mobile :',
                  style: TextStyle(
                    fontSize: 9.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Gilroy-m',
                    color: Color.fromRGBO(82, 9, 116, 1),
                  ),
                ),
                Text(
                  '01222222222222',
                  style: TextStyle(
                    fontSize: 8.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Gilroy-m',
                    color: Color.fromRGBO(29, 40, 46, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
