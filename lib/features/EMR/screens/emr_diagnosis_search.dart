import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/EMR/icons/diabetes_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/scan_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/widget/close_container.dart';
import 'package:umedmiscanner/features/EMR/widget/column_floating_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/container_specalist.dart';
import 'package:umedmiscanner/features/EMR/widget/main_row_home.dart';
import 'package:umedmiscanner/features/EMR/widget/row_action_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/stack_interventions.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widgett.dart';


class EmrDiagnosisSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        floatingActionButton: ColumnFloatingWidget(checkIcon: false,),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('images/medical-record.svg',width: 50.0,height: 50.0,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CloseContainer(),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidgett(
                            text: 'Diagnosis',
                            color: Color.fromRGBO(29, 40, 46,1),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                           width: MediaQuery.of(context).size.width * 0.85,
                           // height: 55.0,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(248, 247, 250,1),
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              border:
                              Border.all(color: Color.fromRGBO(82, 9, 116, 1), width: 2.0),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.search,size: 25.0,color: Color.fromRGBO(82, 9, 116, 1)),


                                Container(
                                  child: TextField(

                                    decoration: InputDecoration(hintText: 'Search....',border: InputBorder.none,),
                                    cursorColor: Color.fromRGBO(82, 9, 116, 1),


                                  ),width: MediaQuery.of(context).size.width * 0.7,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.filter_alt_outlined,
                                        size: 25.0,color: Color.fromRGBO(82, 9, 116, 1)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          //  height: 680.0,
                          height: MediaQuery.of(context).size.height * 0.68,
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
             //   ColumnFloatingWidget(checkIcon: false,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

