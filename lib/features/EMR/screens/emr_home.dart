import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/widget/column_floating_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/main_row_home.dart';
import 'package:umedmiscanner/features/EMR/widget/row_of_btns.dart';

import '../widget/patient_info_container.dart';

class EmrHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ColumnFloatingWidget(
        checkIcon: true,
      ),
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainRowHome(
                        text: "Patients",
                        icon: Icons.qr_code_outlined,
                        onTapSearch: () {
                          print('search');
                        },
                        onTapQrBar: () {
                          print('QR or Bar');
                        },
                        onTapFilter: () {
                          print('Filter');
                        },
                      ),
                      PatientInfoContainer(
                        onTapQr: () {
                          print('Share Qr Code');
                        },
                      ),
                      /////////////////////////////////// btns
                      Container(
                        //  height: 680.0,
                        height: MediaQuery.of(context).size.height * 0.65,

                        child: ListView(
                          children: [
                            RowOFBtns(
                              color: Color.fromRGBO(29, 40, 46, 1),
                              check: true,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
