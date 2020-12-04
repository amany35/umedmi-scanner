import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umedmiscanner/features/EMR/icons/doc_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/doctor_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/i_d_n_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/patient_icon_icons.dart';
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

class EmrSpecialties extends StatelessWidget {
  Color color = Colors.amberAccent;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  MainRowHome(
                    text: 'Specialties',
                    icon: Icons.qr_code_outlined,
                    onTapSearch: (){
                      /// search
                      print('Search');
                    },
                    onTapQrBar: null,
                    onTapFilter: (){
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
                              Icon(StethIcon.stethoscope__1_,
                                  color: Color.fromRGBO(82, 9, 116, 1)),
                              TextWidgett(
                                color: Color.fromRGBO(82, 9, 116, 1),
                                text: 'Specialties',
                              ),
                            ],
                          ),
                          //////
                          ContainerPsy(
                              imagePath: 'images/mental-health.svg',
                              text: 'Psychiatrists',
                              txtD: '1 Doctor',
                              txtS: '2 Session'),
                          ContainerPed(text: 'Psychiatrists', color: color,
                          childRow: Container(),
                            textLast: Container(),
                          ),
                          ContainerPsy(
                              imagePath: 'images/pediatrician.svg',
                              text: 'Pediatrician',
                              txtD: '2 Doctor',
                              txtS: '2 Session'),
                          ContainerPed(text: 'Pediatrician', color: color,
                            childRow: Container(),
                            textLast: Container(),),
                          ContainerPed(text: 'Pediatrician', color: color,
                            childRow: Container(),
                            textLast: Container(),),
                          ContainerPsy(
                              imagePath: 'images/brain.svg',
                              text: 'Neurologist',
                              txtD: '1 Doctor',
                              txtS: '2 Session'),
                          ContainerPed(text: 'Neurologist', color: color,
                            childRow: Container(),
                            textLast: Container(),),
                          ContainerPsy(
                              imagePath: 'images/teeth.svg',
                              text: 'Dentist',
                              txtD: '2 Doctor',
                              txtS: '4 Session'),
                          ContainerPed(text: 'Dentist', color: color,
                            childRow: Container(),
                            textLast: Container(),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////
