
import 'package:flutter/material.dart';

class ContainerPatient extends StatelessWidget {
  const ContainerPatient({
    Key key, this.child, this.height,
  }) : super(key: key);
  final child;
  final height;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 347.0,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 15,
            ),
          ]),
      child: child,
    );
  }
}




