import 'package:flutter/material.dart';

import 'arrow_container.dart';

class MainRowPatientInfo extends StatelessWidget{

  final onTapQr;
  final onTapEdit;

  const MainRowPatientInfo({Key key, this.onTapQr, this.onTapEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         ArrowContainer(onTapBack: (){
           /// write code of back
           print('back');
         },),
         Text(
           'Personal Information',
           style: TextStyle(
             fontSize: 18.0,
             decoration: TextDecoration.none,
             fontFamily: 'Gilroy-Bold',
             color: Color.fromRGBO(29, 40, 46, 1),
           ),
         ),
         GestureDetector(
           child: Icon(Icons.qr_code_outlined,
               size: 25.0,
               color: Color.fromRGBO(82, 9, 116, 1),

           ),
           onTap: onTapQr,
         ),
         GestureDetector(
           child: Icon(Icons.edit_outlined,
               size: 25.0,
               color: Color.fromRGBO(82, 9, 116, 1)),
           onTap: onTapEdit,
         ),
       ],
     );
  }

}