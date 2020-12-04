import 'package:flutter/material.dart';

class ContainerData extends StatelessWidget {

  final String text;

  const ContainerData({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.0,
          decoration: TextDecoration.none,
          fontFamily: 'Gilroy-semi',
          color:
          Color.fromRGBO(29, 40, 46, 1),
        ),
      ),
    );
  }
}