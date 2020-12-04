
import 'package:flutter/material.dart';

class TextWidgett extends StatelessWidget {

  final text;
  final color;
  //Color.fromRGBO(29, 40, 46, 1)
  const TextWidgett({
    Key key, this.text, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 11.0,
        decoration: TextDecoration.none,
        fontFamily: 'Gilroy-Bold',
        color: color,
      ),
    );
  }
}