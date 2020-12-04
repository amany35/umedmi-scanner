import 'package:flutter/material.dart';

class PadingText extends StatelessWidget {
  const PadingText({
    Key key, this.text,
  }) : super(key: key);
  final text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 122.0,
        height: 24.0,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            decoration: TextDecoration.none,
            fontFamily: 'Gilroy-Bold',
            color: Color.fromRGBO(29, 40, 46, 1),
          ),
        ),
      ),
    );
  }
}