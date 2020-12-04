
import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
final icon;
final String text;

  const WrapWidget({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        Icon(
          icon,
          size: 12.0,
          color:
          Color.fromRGBO(82, 9, 116, 1),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 8.0,
            decoration: TextDecoration.none,
            fontFamily: 'Gilroy-m',
            color: Color.fromRGBO(
                82, 9, 116, 1),
          ),
        ),
      ],
    );
  }
}