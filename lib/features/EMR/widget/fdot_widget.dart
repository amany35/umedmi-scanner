
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';

class FDottedLineWidget extends StatelessWidget {
  const FDottedLineWidget({
    Key key, this.height,
  }) : super(key: key);

  final height;
  @override
  Widget build(BuildContext context) {
    return FDottedLine(
      color: Color.fromRGBO(82, 9, 116, 1),
      height: height,
      strokeWidth: 2.0,
      dottedLength: 3.0,
      space: 1.0,
    );
  }
}