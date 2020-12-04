import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widgett.dart';

class RowWidgetContainerStart extends StatelessWidget {
  final text;

  const RowWidgetContainerStart({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15.0,
                  backgroundImage: AssetImage('images/logo_prescription.png'),
                ),
              ],
            ),

            Text(
              text,
              style: TextStyle(
                fontSize: 7.0,
                decoration: TextDecoration.none,
                fontFamily: 'Gilroy-Bold',
                color: Color.fromRGBO(29, 40, 46, 1),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextWidget(
                  text: 'Dr / Ahmed Hassan',
                  color: Color.fromRGBO(82, 9, 116, 1),
                ),
                TextWidget(
                    text: 'Professor of Heart Blood vessele',
                    color: Color.fromRGBO(29, 40, 46, 1)),
                TextWidget(
                  text: 'Description',
                  color: Color.fromRGBO(29, 40, 46, 1),
                ),
              ],
            ),
            //Spacer()
          ],
        ),
        SizedBox(
          width: 300.0,
          child: Divider(
            thickness: 1.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              children: [
                Text(
                  'Prescribed for',
                  style: TextStyle(
                    fontSize: 7.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Gilroy-Bold',
                    color: Color.fromRGBO(29, 40, 46, 1),
                  ),
                ),
                TextWidget(
                  text: 'Alaa Ahmed Hussien ',
                  color: Color.fromRGBO(82, 9, 116, 1),
                ),
              ],
            ),
            Wrap(
              alignment: WrapAlignment.end,
              direction: Axis.horizontal,
              children: [
                Text(
                  'issued in',
                  style: TextStyle(
                    fontSize: 7.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Gilroy-Bold',
                    color: Color.fromRGBO(29, 40, 46, 1),
                  ),
                ),
                TextWidget(
                  text: '19 Jun 2019',
                  color: Color.fromRGBO(82, 9, 116, 1),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          width: 300.0,
          child: Divider(
            thickness: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children: [
              TextWidget(
                text: 'Rx:',
                color: Color.fromRGBO(29, 40, 46, 1),
              ),
              Container()
            ],
          ),
        ),
        SizedBox(
          width: 300.0,
          child: Divider(
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key key,
    this.color,
    this.text,
  }) : super(key: key);

  final color;
  final text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 7.0,
          decoration: TextDecoration.none,
          fontFamily: 'Gilroy-semi',
          color: color),
    );
  }
}
