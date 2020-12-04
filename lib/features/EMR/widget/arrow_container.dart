import 'package:flutter/material.dart';

class ArrowContainer extends StatelessWidget{

  final onTapBack;

  const ArrowContainer({Key key, this.onTapBack}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return Container(
       width: 22.72,
       height: 22.72,
       decoration: BoxDecoration(
         shape: BoxShape.circle,
         border: Border.all(
             color: Color.fromRGBO(82, 9, 116, 1), width: 1.5),
       ),
       child: GestureDetector(
         child: Icon(Icons.arrow_back_ios_rounded,
             size: 12.0, color: Color.fromRGBO(82, 9, 116, 1)),

         onTap: onTapBack,
       ),
     );
  }

}