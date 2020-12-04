import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ColumnWidgetPatient extends StatelessWidget {
  final String imagePath;
  final String text;

  const ColumnWidgetPatient(
      {Key key, @required this.imagePath, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundColor: Color.fromRGBO(248, 247, 250,1),
          child: SvgPicture.asset(
            imagePath,
          ),
        ),
        Container(
          //width: 7.0,
          height: 20.0,
          child: Center(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 8.0,
                decoration: TextDecoration.none,
                fontFamily: 'Gilroy-Bold',
                color: Color.fromRGBO(29, 40, 46, 1),
              ),
            ),
          ),
        ),
        VerticalDivider(
          thickness: 1.0,
        ),
      ],

    );

    /*Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: Color.fromRGBO(248, 247, 250,1),
            child: SvgPicture.asset(
              imagePath,
            ),
          ),
          Container(
            //width: 7.0,
            height: 20.0,
            child: Center(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 8.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'Gilroy-Bold',
                  color: Color.fromRGBO(29, 40, 46, 1),
                ),
              ),
            ),
          ),
          VerticalDivider(
            thickness: 1.0,
          ),
        ],

      );*/
  }
}
