import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umedmiscanner/features/EMR/icons/doc_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/doctor_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/i_d_n_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/patient_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/pharmacy_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/share_purple_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/steth_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/widget/column_widget_patient_dim.dart';
import 'package:umedmiscanner/features/EMR/widget/container_patient.dart';
import 'package:umedmiscanner/features/EMR/widget/container_ped.dart';
import 'package:umedmiscanner/features/EMR/widget/container_psy.dart';
import 'package:umedmiscanner/features/EMR/widget/container_specalist.dart';
import 'package:umedmiscanner/features/EMR/widget/main_row_home.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widgett.dart';

class EmrPrescriptions extends StatelessWidget {
  Color color = Colors.amberAccent;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              MainRowHome(
                text: 'Prescriptions',
                icon: Icons.qr_code_outlined,
                onTapSearch: () {
                  /// search
                  print('Search');
                },
                onTapQrBar: null,
                onTapFilter: () {
                  /// filter
                  print('filter');
                },
              ),
              ContainerSpecialties(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child:  Container(
                  //  height: 680.0,
                  height: MediaQuery.of(context).size.height * 0.65,

                  child: ListView(
                    children: [

                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Icon(PharmacyIcon.pharmacy,
                              color: Color.fromRGBO(82, 9, 116, 1)),
                          TextWidgett(
                            color: Color.fromRGBO(82, 9, 116, 1),
                            text: 'E - Prescriptions',
                          ),
                        ],
                      ),
                      //////
                      ContainerPsy(
                          imagePath: 'images/mental-health.svg',
                          text: 'Psychiatrists',
                          txtD: '1 Doctor',
                          txtS: '2 Session'),
                      ContainerPed(
                        text: 'Psychiatrists',
                        color: color,
                        childRow: Row(
                          children: [
                            Icon(
                              Icons.file_copy,
                              size: 10.0,
                              color: Color.fromRGBO(82, 9, 116, 1),
                            ),
                            Text(
                              '3 times',
                              style: TextStyle(
                                fontSize: 5.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'Gilroy-semi',
                                color: Color.fromRGBO(82, 9, 116, 1),
                              ),
                            ),
                          ],
                        ),
                        textLast: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            child: Text(
                              'Last Session on 15/3/2020',
                              style: TextStyle(
                                fontSize: 4.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'Gilroy-semi',
                                color: Color.fromRGBO(29, 40, 46, 1),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          RowDoc(),
                          RowDoc(),
                          RowDoc(),
                        ],
                      ),

                      ContainerPsy(
                          imagePath: 'images/mental-health.svg',
                          text: 'Psychiatrists',
                          txtD: '1 Doctor',
                          txtS: '2 Session'),

                      ContainerPed(
                        text: 'Psychiatrists',
                        color: color,
                        childRow: Row(
                          children: [
                            Icon(
                              Icons.file_copy,
                              size: 10.0,
                              color: Color.fromRGBO(82, 9, 116, 1),
                            ),
                            Text(
                              '3 times',
                              style: TextStyle(
                                fontSize: 5.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'Gilroy-semi',
                                color: Color.fromRGBO(82, 9, 116, 1),
                              ),
                            ),
                          ],
                        ),
                        textLast: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Last Session on 15/3/2020',
                            style: TextStyle(
                              fontSize: 4.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'Gilroy-semi',
                              color: Color.fromRGBO(29, 40, 46, 1),
                            ),
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          RowDoc(),
                          RowDoc(),
                          RowDoc(),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RowDoc extends StatelessWidget {
  const RowDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Row(
        children: [
          Container(
            width: 69.0,
            height: 91.0,
            child: Image.asset('images/prescriptions.jpeg'),
          ),
        ],
      ),
    );
  }
}

////////////
