import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';

class CustomDialog extends StatefulWidget {
  CustomDialog({@required this.alertHeader, this.alertMessage, this.positiveActionBtn,
    this.negativeActionBtn, this.positiveActionFun, this.negativeActionFun});

  final String alertHeader,alertMessage,positiveActionBtn,negativeActionBtn;
  final Function positiveActionFun,negativeActionFun;

  @override
  State<StatefulWidget> createState() {
    return _CustomDialogState();
  }
}

class _CustomDialogState extends State<CustomDialog> {

  @override
  Widget build(BuildContext context) {
    return   AlertDialog(
          title:  Text(widget.alertHeader),
          content:  Text(widget.alertMessage),
          actions: <Widget>[
             FlatButton(
              child:  Text(
                widget.positiveActionBtn,
                style: TextStyle(color: PRIMARY_COLOR, fontSize: 16),),
              onPressed: () {
                widget.positiveActionFun();
              },
            ),
              FlatButton(
                child: Text(
                  widget.negativeActionBtn,
                  style: TextStyle(color: PRIMARY_COLOR, fontSize: 16),),
                onPressed: () {
                  widget.negativeActionFun();
                },
              ),
          ],
        );
  }
}
