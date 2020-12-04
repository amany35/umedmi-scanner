import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/EMR/widget/close_container.dart';
import 'package:umedmiscanner/features/EMR/widget/column_new_entry.dart';
import 'package:umedmiscanner/features/EMR/widget/container_blood.dart';
import 'package:umedmiscanner/features/EMR/widget/container_new_entry.dart';

class EMRVitalSignsTableNewEntry extends StatefulWidget {




  @override
  _EMRVitalSignsTableNewEntryState createState() =>
      _EMRVitalSignsTableNewEntryState();
}

class _EMRVitalSignsTableNewEntryState
    extends State<EMRVitalSignsTableNewEntry> {

  bool f = false;
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
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CloseContainer(),
                      ],
                    ),
                    ColumnNewEntry(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
