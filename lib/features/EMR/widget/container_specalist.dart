import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/icons/patient_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/share_purple_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/widget/column_widget_patient_dim.dart';

class ContainerSpecialties extends StatelessWidget{

  Color color = Color.fromRGBO(197, 194, 213, 1);
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(top: 15.0),
       child: Container(

        // width: 374.0,
        // height: 90.0,
         width: MediaQuery.of(context).size.width * 0.87,
         height: MediaQuery.of(context).size.height * 0.10,
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.all(Radius.circular(20)),
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.withOpacity(0.8),
                 spreadRadius: 10,
                 blurRadius: 15,
               ),
             ]),
         child: Padding(
           padding: const EdgeInsets.only(left: 10.0),
           child: Column(
             children: [
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 5.0),
                     child: CircleAvatar(
                       backgroundColor: Color.fromRGBO(81, 217, 14, 1),
                       radius: 5.0,
                     ),
                   ),
                   SizedBox(
                     width: 280.0,
                   ),
                   GestureDetector(
                     child: Icon(Icons.bookmark_outline_outlined,
                         size: 20.0,
                         color: Color.fromRGBO(255, 108, 145, 1)),
                   ),
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   CircleAvatar(
                     backgroundImage:
                     AssetImage('images/profile_image.jpg'),
                     radius: 18.0,
                   ),
                   Column(
                     children: [
                       Text(
                         'Basma Ali (#206541)',
                         style: TextStyle(
                           fontSize: 12.0,
                           decoration: TextDecoration.none,
                           fontFamily: 'Gilroy-Bold',
                           color: Color.fromRGBO(82, 9, 116, 1),
                         ),
                       ),

                     ],
                   ),
///////////////////////////////////////
                   GestureDetector(
                     child: Icon(Icons.qr_code_outlined,
                         size: 25.0,
                         color: Color.fromRGBO(82, 9, 116, 1)),
                   ),
                   Container(
                     width: 46.0,
                     height: 15.0,
                     decoration: new BoxDecoration(
                       shape: BoxShape.rectangle,
                       color: Color.fromRGBO(255, 108, 145, 1),
                       borderRadius:
                       BorderRadius.all(Radius.circular(5.0)),
                     ),
                     child: Row(
                       children: [
                         Icon(
                           PatientIcon.patientinfo,
                           size: 12.0,
                           color: Color.fromRGBO(174, 31, 67, 1),
                         ),
                         Text(
                           'Critical',
                           style: TextStyle(
                             fontSize: 7.0,
                             decoration: TextDecoration.none,
                             fontFamily: 'Gilroy-Regular',
                             color: Color.fromRGBO(174, 31, 67, 1),
                           ),
                         ),
                       ],
                     ),
                   ),
                   GestureDetector(
                     child: Icon(SharePurpleIcon.shared_purple,
                         size: 20.0,
                         color: Color.fromRGBO(82, 9, 116, 1)),
                   ),
                   SizedBox(
                     width: 8.0,
                   ),
                   Text(
                     '4',
                     style: TextStyle(
                       fontSize: 10.0,
                       decoration: TextDecoration.none,
                       fontFamily: 'Gilroy-Bold',
                       color: Color.fromRGBO(82, 9, 116, 1),
                     ),
                   ),
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 50.0,top: 3.0),
                 child: Row(
                   // mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     ContainerText(textDef: '30',color: color,),
                     ContainerText(textDef: '.',color: Color.fromRGBO(82, 9, 116, 1),),
                     ContainerText(textDef: 'F',color: color),
                     ContainerText(textDef: '.',color: Color.fromRGBO(82, 9, 116, 1),),
                     ContainerText(textDef: 'Cancer Patient',color: color),
                     SizedBox(
                       width: 100.0,
                     ),
                     Expanded(child: ContainerText(textDef: 'Last viewed 6 day ago',color: color)),
                   ],
                 ),
               )
             ],
           ),
         ),
       ),
     );
  }

}