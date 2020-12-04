import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ColumnWidgetPatientDim extends StatelessWidget {
  final String imagePath;
  final String textDef;
  final String textDetails;


  const ColumnWidgetPatientDim(
      {Key key, @required this.imagePath, this.textDef, this.textDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 80.0,
     // color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Color.fromRGBO(248, 247, 250, 1),
                child: SvgPicture.asset(
                  imagePath,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContainerText(textDef: textDef,color: Color.fromRGBO(197, 194, 213, 1),),
              SizedBox(
                width: 10.0,
              ),
              ContainerText(textDef: textDetails,color:Color.fromRGBO(29, 40, 46, 1),)
             ]
          ),
          SizedBox(
            width: 150.0,
            child: Divider(
              //color: Colors.red,
              thickness: 2.0,
            ),
          )
        ],
      ),
    );


  }
}

class ContainerText extends StatelessWidget {
  const ContainerText({
    Key key,
    @required this.textDef, this.color,
  }) : super(key: key);

  final String textDef;
  final color;
  @override
  Widget build(BuildContext context) {
    return Container(
      //   width: 50.0,
      height: 20.0,
      child: Text(
        textDef,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          fontSize: 8.0,
          decoration: TextDecoration.none,
          fontFamily: 'Gilroy-Bold',
          color: color
        ),
      ),
    );
  }
}
