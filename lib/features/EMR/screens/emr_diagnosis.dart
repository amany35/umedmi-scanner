import 'package:flutter/material.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/EMR/icons/diabetes_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/widget/column_floating_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/container_specalist.dart';
import 'package:umedmiscanner/features/EMR/widget/main_row_home.dart';
import 'package:umedmiscanner/features/EMR/widget/row_action_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/stack_interventions.dart';


class EmrDiagnosis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:   ColumnFloatingWidget(checkIcon: true,),
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
                  children: [
                    MainRowHome(
                      text: 'Diagnosis',
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
                    StackIntervention(
                        icon: DiabetesIcon.diabetes, text: 'Diagnosis'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        //  height: 680.0,
                        height: MediaQuery.of(context).size.height * 0.65,

                        child: ListView(
                          children: [
                            // ContainerSpecialties(),
                            SizedBox(
                              height: 10.0,
                            ),
                            /* StackIntervention(
                                icon: DiabetesIcon.diabetes, text: 'Diagnosis'),*/
                            ////////////////////
                            RowActiveWidget(
                              textDef: 'A02.1 - Hypertension',
                              text: 'Notes: Uncontrolled Hypertension,'
                                  ' patient is non-compliant to Rx',
                              textDay: '2 days',
                              check: false,
                              flag: false,
                            ),

                            RowActiveWidget(
                              textDef: 'O10.0 - Pre-Existing Hypertension ….',
                              text: 'Notes: Uncontrolled Hypertension,'
                                  ' developed on top of Pregnancy',
                              textDay: '3 days',
                              check: true,
                              flag: true,
                            ),

                            RowActiveWidget(
                              textDef: 'A02.1 - Hypertension',
                              text: 'Notes:'
                                  ' Uncontrolled Hypertension, patient is non-compliant to Rx',
                              textDay: '5 days',
                              check: false,
                              flag: false,
                            ),

                            RowActiveWidget(
                              textDef: 'A02.1 - Hypertension',
                              text: 'Notes: Uncontrolled Hypertension, '
                                  'patient is non-compliant to Rx',
                              textDay: '10/9/20',
                              check: false,
                              flag: false,
                            ),

                            RowActiveWidget(
                              textDef: 'O10.0 - Pre-Existing Hypertension ….',
                              text: 'Notes:'
                                  ' Uncontrolled Hypertension, developed on top of Pregnancy',
                              textDay: '3 days',
                              check: true,
                              flag: false,
                            ),

                            RowActiveWidget(
                              textDef: 'A02.1 - Hypertension',
                              text: 'Notes: Uncontrolled Hypertension,'
                                  ' patient is non-compliant to Rx',
                              textDay: '5 days',
                              check: false,
                              flag: false,
                            ),
                            /////////////////
                            ///////////////////////////////////////////////////////////////////

                            RowActiveWidget(
                              textDef: 'O10.0 - Pre-Existing Hypertension ….',
                              text:
                                  'Notes: Uncontrolled Hypertension, developed on top of Pregnancy',
                              textDay: '3 days',
                              check: true,
                              flag: false,
                            ),

                            RowActiveWidget(
                              textDef: 'A02.1 - Hypertension',
                              text:
                                  'Notes: Uncontrolled Hypertension, patient is non-compliant to Rx',
                              textDay: '10/9/20',
                              check: false,
                              flag: false,
                            ),
                            RowActiveWidget(
                              textDef: 'A02.1 - Hypertension',
                              text: 'Notes: Uncontrolled Hypertension, '
                                  'patient is non-compliant to Rx',
                              textDay: '10/9/20',
                              check: false,
                              flag: false,
                            ),
                          ],
                        ),
                      ),
                    ),
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

