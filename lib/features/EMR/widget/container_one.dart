import 'package:flutter/material.dart';

class ContainerOne extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return  GestureDetector(
        child: Container(
          width: 35.0,
          height: 26.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                  Radius.circular(8.0)),
              border: Border.all(
                  color:
                  Color.fromRGBO(82, 9, 116, 1)),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(
                        85, 24, 114, 1),
                    blurRadius: 8.0)
              ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              '1',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.0,
                decoration: TextDecoration.none,
                fontFamily: 'Gilroy-Bold',
                color: Color.fromRGBO(82, 9, 116, 1),
              ),
            ),
          ),
        ),
      );
  }

}