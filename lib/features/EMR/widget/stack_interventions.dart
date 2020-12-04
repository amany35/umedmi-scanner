import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/icons/doc_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widgett.dart';

class StackIntervention extends StatelessWidget{

  final IconData icon;
  final String text;

  const StackIntervention({Key key, @required this.icon,@required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
           // width: 370.0,
           // height: 37.0,
            width: MediaQuery.of(context).size.width * 0.87,
            height: MediaQuery.of(context).size.width * 0.10,
            decoration: BoxDecoration(
                color: Color.fromRGBO(82, 9, 116,1),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(icon,
                      color: Colors.white),
                  SizedBox(width: 12.0,),
                  TextWidgett(
                    color: Colors.white,
                    text: text,
                  ),

                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 300.0),
          child: Container(
            width: 260.0,
            height: 60.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Color.fromRGBO(82, 9, 116,1),
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(85, 24, 114, 1),
                      blurRadius: 20.0)
                ]),

            child: Icon(Icons.add,
                color: Color.fromRGBO(82, 9, 116,1)),

          ),
        )
      ],
    );
  }

}
