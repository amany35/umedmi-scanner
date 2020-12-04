import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';

import 'CustomTextWidget.dart';

class GridViewWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _GridViewWidgetState();
  }
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: new List<Widget>.generate(16, (index) {
          return new GridTile(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
              child: new Card(
                  color: Colors.blue.shade200,
                  child: Stack(
                      children: <Widget>[
//                        Container(
//                          height: 250.0,
//                          width:350.0,
//                          decoration:  BoxDecoration(
//                            shape: BoxShape.rectangle,
//                            image:  DecorationImage(
//                                fit: BoxFit.cover,
//                                image:  NetworkImage(
//                                    allTranslations.text(ImageURLKey))),
//                          ),
//                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: CustomTextWidget(
                            text: "Roasted Vegetable Bowls\n with pesto",
                            textSize: 14.0,
                            txtColor: WHITE,
                            textAlign:TextAlign.center,
                            fontWeight:  FontWeight.bold,

                          )
                        )
                      ]
                  )
              ),
            ),
          );
        }));

  }
}
