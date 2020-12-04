
import 'package:flutter/material.dart';

class ContainerPatientDem extends StatelessWidget {
  const ContainerPatientDem({
    Key key, this.child,
  }) : super(key: key);
  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 347.0,
      height: 300.0,
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




