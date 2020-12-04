import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class NoDataAvailable extends StatefulWidget {
  final String message;

  const NoDataAvailable({this.message = "No Data Available", Key key})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new NoDataAvailableState();
  }
}

class NoDataAvailableState extends State<NoDataAvailable> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.message,
        style: TextStyle(color: PRIMARY_COLOR),
      ),
    );
  }
}
