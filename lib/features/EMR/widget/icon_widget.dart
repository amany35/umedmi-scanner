import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    Key key,
    this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Color.fromRGBO(82, 9, 116, 1),
          size: 15,
        ),
        SizedBox(
          width: 3.0,
        ),
      ],
    );
  }
}