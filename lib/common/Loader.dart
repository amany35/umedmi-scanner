import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class Loader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoaderState();
  }
}

class LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: new Theme(
      data: Theme.of(context).copyWith(accentColor: PRIMARY_COLOR),
      child: Container(
          margin: EdgeInsets.only(bottom: 10),
          width: 30,
          height: 30,
          child: new CircularProgressIndicator(
            strokeWidth: 2,
          )),
    ));
  }
}
