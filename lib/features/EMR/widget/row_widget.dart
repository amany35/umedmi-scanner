import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key key,
    this.imagePath,
    this.text1,
    this.text2,
  }) : super(key: key);
  final imagePath;
  final text1, text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          backgroundColor: Color.fromRGBO(248, 247, 250, 1),
          child: SvgPicture.asset(
            imagePath,
          ),
        ),
        SizedBox(
          width: 40.0,
        ),
        Text(
          text1,
          style: TextStyle(
            fontSize: 12.0,
            decoration: TextDecoration.none,
            fontFamily: 'Gilroy-Bold',
            color: Color.fromRGBO(29, 40, 46, 1),
          ),
        ),
        SizedBox(
          width: 3.0,
        ),
        Text(
          text2,
          style: TextStyle(
            fontSize: 8.0,
            decoration: TextDecoration.none,
            fontFamily: 'Gilroy-m',
            color: Color.fromRGBO(197, 194, 213, 1),
          ),
        ),
      ],
    );
  }
}
