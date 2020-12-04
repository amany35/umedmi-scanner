import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';
import 'ValidationWidget.dart';

class PasswordFieldWidget extends StatefulWidget {

  PasswordFieldWidget({@required this.controller,@required this.textInputAction,@required this.focusNode,@required this.keyboardType,@required this.nextFocusNode,@required this.hintText, this.submitFunction, this.changeFunction});

  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode focusNode, nextFocusNode;
  final TextInputType keyboardType;
  final Function submitFunction,changeFunction;
  final String hintText;

  @override
  State<StatefulWidget> createState() {
    return _PasswordFieldWidgetState();
  }
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget>{

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (val){
        widget.changeFunction();
      },
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      onFieldSubmitted: (text) {
        widget.submitFunction();
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide:  BorderSide(
            color: Colors.white,
            width: 2,
          ),
          borderRadius:  BorderRadius.all(Radius.circular(4.0)),
        ),
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(color: Colors.white),
       ),

        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontFamily: "Roboto",
          color: PRIMARY_COLOR,
          fontSize: 15,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText ? Icons.visibility_off :Icons.visibility ,
            color: PRIMARY_COLOR,
          ),
        ),
      ),
      style: TextStyle(fontSize: 16, color:PRIMARY_COLOR),
      textAlign: TextAlign.left,
      controller: widget.controller,
      obscureText: obscureText,
      validator: (value) {
        return passValidation(value);
      },
    );
  }
}