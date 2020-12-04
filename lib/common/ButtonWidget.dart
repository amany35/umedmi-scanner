import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  ButtonWidget({@required this.text, this.function, this.textColor, this.btnColor, this.borderColor, this.width, this.fontSize,@required this.fontWeight});

  final String text;
  final Function function;
  final Color textColor,btnColor,borderColor;
  final double width, fontSize;
  final FontWeight fontWeight;

  @override
  State<StatefulWidget> createState() {
    return _ButtonWidgetState();
  }
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: OutlineInputBorder(
        borderSide:  BorderSide(
          color: widget.borderColor,
          width: widget.width,
        ),
        borderRadius:  BorderRadius.all(Radius.circular(4.0)),      ),


      onPressed: () {
        widget.function();
      },
      color: widget.btnColor,
      child: Text(
        widget.text,
        style: TextStyle(
          color:widget.textColor,
          fontSize: widget.fontSize,
          fontWeight:widget.fontWeight,
        ),
      ),
    );

  }
}
