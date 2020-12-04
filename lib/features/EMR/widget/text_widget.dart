
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final text;

  const TextWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.0,
          decoration: TextDecoration.none,
          fontFamily: 'Gilroy-m',
          color: Color.fromRGBO(197, 194, 213, 1),
        ),
      ),
    );
  }
}
