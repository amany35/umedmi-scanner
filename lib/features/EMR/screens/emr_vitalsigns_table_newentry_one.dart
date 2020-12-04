import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/EMR/widget/close_container.dart';
import 'package:umedmiscanner/features/EMR/widget/column_new_entry.dart';
import 'package:umedmiscanner/features/EMR/widget/column_new_entry_one.dart';
import 'package:umedmiscanner/features/EMR/widget/container_blood.dart';
import 'package:umedmiscanner/features/EMR/widget/container_new_entry.dart';
import 'package:umedmiscanner/features/EMR/widget/gesture_detector_widget.dart';

import 'emr_vital_signs_graph.dart';

class EMRVitalSignsTableNewEntryOne extends StatefulWidget {
  @override
  _EMRVitalSignsTableNewEntryOneState createState() =>
      _EMRVitalSignsTableNewEntryOneState();
}

class _EMRVitalSignsTableNewEntryOneState
    extends State<EMRVitalSignsTableNewEntryOne> {


  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:   Container(
                  //  height: 680.0,
                  height: MediaQuery.of(context).size.height * 0.95,

                  child: ListView(
                  children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         CloseContainer(),
                       ],
                     ),
                    ColumnNewEntryOne(),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: GestureDetectorWidget(text:'Save',onTap:(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EMRVitalSignsGraph()));
                      }),
                    ),
                  ],
                ),
              ),
              )],
          ),
        ),
      ),
    );
  }


}
