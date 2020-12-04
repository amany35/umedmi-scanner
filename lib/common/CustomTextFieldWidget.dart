import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class CustomTextFieldWidget extends StatefulWidget {

  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode focusNode, nextFocusNode;
  final TextInputType keyboardType;
  final Function onFieldSubmittedFunction,validationFunction,changeFunction;
  final InputDecoration inputDecoration;
  final int maxLines;

  CustomTextFieldWidget(
      {@required this.controller, @required this.textInputAction, @required this.focusNode, @required this.nextFocusNode,@required  this.keyboardType,@required  this.onFieldSubmittedFunction,@required  this.validationFunction,@required  this.inputDecoration, this.changeFunction, this.maxLines});

  @override
  State<StatefulWidget> createState() {
    return _CustomTextFieldWidgetState();
  }
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget>{
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (val){
        widget.changeFunction();
      },
      maxLines: widget.maxLines,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      onFieldSubmitted: (text) {
        widget.onFieldSubmittedFunction();
      },
      keyboardType: widget.keyboardType,
      decoration: widget.inputDecoration,
      style: TextStyle(fontSize: 16, color:PRIMARY_COLOR),
      textAlign: TextAlign.left,
      controller: widget.controller,
      validator: (value) {
       return  widget.validationFunction(value);

      },
    );
  }

}