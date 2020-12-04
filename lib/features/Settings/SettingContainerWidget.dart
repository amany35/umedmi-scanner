import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class SettingContainerWidget extends StatefulWidget {
  SettingContainerWidget({@required this.title, @required this.pageLink});

  final String title;
  final Widget pageLink;

  @override
  State<StatefulWidget> createState() {
    return _SettingContainerWidgetState();
  }
}

class _SettingContainerWidgetState extends State<SettingContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
           Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) => widget.pageLink),
           );
        },
        child: Container(
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular( 20.0) ),
            boxShadow: [
              BoxShadow(
                color: greyColor,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 15.0,
              ),
            ],
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          height: 47,
          child: Text(widget.title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
        )
    );

  }
}
