
import 'package:flutter/material.dart';

class TextTable extends StatelessWidget {

  final text;
  final color;

  const TextTable({Key key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12.0,
        decoration: TextDecoration.none,
        fontFamily: 'Gilroy-SemiBold',
        color: color,
      ),
    );
  }
}
