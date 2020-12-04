import 'package:flutter/material.dart';

class CustomTextWidget extends StatefulWidget {

  final String text;
  final double textSize;
  final Color txtColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  CustomTextWidget(
      {@required this.text,@required this.textSize,@required this.txtColor,@required this.fontWeight, this.textAlign});

  @override
  State<StatefulWidget> createState() {
    return _CustomTextWidgetState();
  }
}
class _CustomTextWidgetState extends State<CustomTextWidget>{

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: widget.textAlign,
      style: TextStyle(
          fontSize:widget.textSize,
          fontWeight:widget.fontWeight,
          color: widget.txtColor),

    );
  }

}