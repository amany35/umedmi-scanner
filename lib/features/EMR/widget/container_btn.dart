import 'package:flutter/material.dart';

class ContainerBtn extends StatelessWidget {
  const ContainerBtn({
    Key key,
    this.text,
    this.colorText,
    this.icon,
    this.color,
    this.onTap,
    this.colorIcon,this.select,
  }) : super(key: key);
  final String text;
  final colorText;
  final IconData icon;
  final color;
  final onTap;
  final colorIcon;
  final int  select;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 7.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 55.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.more_vert,
                    size: 15,
                    color: select == 1?Colors.grey.withOpacity(0.9):Color.fromRGBO(255, 108, 145, 1),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 18.0,
                    color: colorIcon,
                  ),
                ],
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 7.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'Gilroy-Bold',
                  color: colorText,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
