import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerColumn extends StatelessWidget {
  const ContainerColumn({
    Key key, this.text, this.imagePath,  this.colorBack, this.colorText
  }) : super(key: key);
  final text;
  final imagePath;
  final colorBack;
  final colorText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
      //  color: Color.fromRGBO(255, 108, 145,0.5),
        color: colorBack,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            imagePath,
            width: 20.0,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 6.0,
              decoration: TextDecoration.none,
              fontFamily: 'Gilroy-Bold',
              color: colorText
            ),
          ),
        ],
      ),
    );
  }
}
