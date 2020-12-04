import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/icons/close_icon_icons.dart';

class CloseContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.72,
      height: 22.72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: Color.fromRGBO(82, 9, 116, 1),
            width: 1.5),
      ),
      child: GestureDetector(

        child: Icon(CloseIcon.close,
            size: 12.0,
            color: Color.fromRGBO(82, 9, 116, 1)),
        onTap: (){
           // put action here
          /// pop action
          print('back');
        },
      ),

    );
  }

}