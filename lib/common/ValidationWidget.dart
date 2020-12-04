import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


bool HasArabicCharacters(String text) {
  var regex =  RegExp(
      r"[\u0600-\u06ff]|[\u0750-\u077f]|[\ufb50-\ufc3f]|[\ufe70-\ufefc]");
  return regex.hasMatch(text);
}

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

String emailValidation(value){
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex =  RegExp(pattern);

  if (value.isEmpty)
    return "Enter Email";

//  if (HasArabicCharacters(value)) {
//    return  "Invalid Email";
//  }

  return (regex.hasMatch(value))
      ? null
      :  "Invalid Email";
}

String emptyValidation(value){
  if (value.isEmpty)
    return "Enter Data";
}

String userNameValidation(value){
  Pattern pattern = r'^[a-zA-ZØ¡-ÙŠ\s]*$';
  RegExp regex = new RegExp(pattern);
  return value.isEmpty ? "Enter UserName" :
  (!regex.hasMatch(value) ) ?
  "Invalid UserName" : null;

}

void onFieldSubmittedNextNode(context,focusNode,nextFocusNode){
  fieldFocusChange(
      context, focusNode, nextFocusNode);
}

String passValidation(value){
  return value.isEmpty ? "Enter Password" :
  value.length < 6 ?  "Please Enter more then 6-digit password" : null;
}

String codeValidation(value){
  return value.isEmpty ? "Enter Code" :
  value.length < 4  || value.length > 4?  "Please Enter 4-digit code" : null;
}

String phoneValidation(value){
  return value.isEmpty ? "Enter phoneNumber" :
  (value.length > 14 )
      ?  "Invalid Phone Number" : null;
}


