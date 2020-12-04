import 'package:flutter/material.dart';

class GestureDetectorWidget extends StatelessWidget{


  final text;
  final onTap;

  const GestureDetectorWidget({Key key,@required this.text,@required this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          width: 374.0,
          height: 55.0,
          decoration: BoxDecoration(
              color: Color.fromRGBO(82, 9, 116, 1),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurRadius: 10,
                ),
              ]),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20.0,
                decoration: TextDecoration.none,
                fontFamily: 'Gilroy-semi',
                color: Colors.white,
              ),
            ),
          ),
        ),
        onTap: onTap
    );
  }

}

