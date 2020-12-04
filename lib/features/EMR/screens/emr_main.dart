
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_home.dart';
import 'package:umedmiscanner/features/EMR/widget/arrow_container.dart';
import 'package:umedmiscanner/features/EMR/widget/container_main_data.dart';
import 'package:umedmiscanner/features/EMR/widget/row_of_btns.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widgett.dart';

class EmrMain extends StatefulWidget {
  @override
  _EmrMainState createState() => _EmrMainState();
}

class _EmrMainState extends State<EmrMain> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      /*  bottomNavigationBar: ConvexAppBar(
          height: 60.0,
          backgroundColor: Colors.white,
          activeColor: Color.fromRGBO(82, 9, 116, 1),
          color: Color.fromRGBO(180, 177, 192, 1),
          items: [
            TabItem(icon: Icons.date_range_rounded),
            TabItem(icon: Icons.notifications_none_rounded),
            TabItem(icon: Icons.home),
            TabItem(icon: Icons.message),
            TabItem(icon: Icons.menu_rounded),
          ],
          initialActiveIndex: 2,//optional, default as 0
         // onTap: (int i) => print('click index=$i'),
          onTap: (int i){

            /// Action of menu bar
            switch(i){
              case 0:
             //   Navigator.push(context, MaterialPageRoute(builder: (context) => EmrHome()));
                break;
              case 1:
             //   Navigator.push(context, MaterialPageRoute(builder: (context) => EmrHome()));
                break;
              case 2:
             //   Navigator.push(context, MaterialPageRoute(builder: (context) => EmrHome()));
                break;
              case 3:
             //   Navigator.push(context, MaterialPageRoute(builder: (context) => EmrHome()));
                break;
              case 4:
             //   Navigator.push(context, MaterialPageRoute(builder: (context) => EmrHome()));
                break;
            }

          },

        ),*/
     Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   ArrowContainer(
                     onTapBack: () {
                       //code of back
                       //  Navigator.pop(context);
                       print('back');
                     },
                   ),
                   TextWidgett(color: Color.fromRGBO(82, 9, 116, 1) ,text: 'E-Medical Record',),
                 ],
               ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ContainerMainData(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: RowOFBtns(color:Color.fromRGBO(238, 0, 97, 1),check: false,),
                ),

              ],
            ),
          ),
        ),

    );
  }
}
