

import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/widget/text_table.dart';

class ContainerTable extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Container(
       color: Colors.white,
       padding: EdgeInsets.all(20.0),
       child: Table(
         //  border: TableBorder.all(color: Colors.black),
         children: [
           TableRow(children: [
             TextTable(text: '4 May,2020',color: Color.fromRGBO(180, 177, 192,1)),
             TextTable(text:'102 b/min',color: Color.fromRGBO(180, 177, 192,1)),
             TextTable(text:'Normal',color: Color.fromRGBO(42, 183, 27,1)),
           ]),
           TableRow(children: [
             TextTable(text:'5 May,2020',color: Color.fromRGBO(180, 177, 192,1)),
             TextTable(text:'102 b/min',color: Color.fromRGBO(180, 177, 192,1)),
             TextTable(text:'Normal',color: Color.fromRGBO(42, 183, 27,1)),
           ]),

           TableRow(children: [
             TextTable(text:'5 May,2020',color: Color.fromRGBO(180, 177, 192,1)),
             TextTable(text:'102 b/min',color: Color.fromRGBO(180, 177, 192,1)),
             TextTable(text:'Normal',color: Color.fromRGBO(42, 183, 27,1)),
           ]),

           TableRow(children: [
             TextTable(text:'6 May,2020',color: Color.fromRGBO(180, 177, 192,1)),
             TextTable(text:'50 b/min',color: Color.fromRGBO(180, 177, 192,1)),
             TextTable(text:'Bradycardia',color: Color.fromRGBO(255, 108, 145,1)),
           ])
           ,
           TableRow(children: [
             TextTable(text:'7 May,2020',color: Color.fromRGBO(180, 177, 192,1)),
             TextTable(text:'102 b/min',color: Color.fromRGBO(180, 177, 192,1)),
             TextTable(text:'Normal',color: Color.fromRGBO(42, 183, 27,1)),
           ]),
           TableRow(children: [
             TextTable(text:'8 May,2020',color: Color.fromRGBO(180, 177, 192,1)),
             TextTable(text:'102 b/min',color: Color.fromRGBO(180, 177, 192,1)),
             TextTable(text:'Normal',color: Color.fromRGBO(42, 183, 27,1)),
           ])
         ],
       ),
     );
  }

}