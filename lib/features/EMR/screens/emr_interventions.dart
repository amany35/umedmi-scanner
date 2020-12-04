import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/icons/doc_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/micro_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/pulse_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/x_ray_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/screens/emr_prescriptions.dart';
import 'package:umedmiscanner/features/EMR/widget/column_floating_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/container_specalist.dart';
import 'package:umedmiscanner/features/EMR/widget/container_widget_prescription.dart';
import 'package:umedmiscanner/features/EMR/widget/main_row_home.dart';
import 'package:umedmiscanner/features/EMR/widget/row__widget.dart';
import 'package:umedmiscanner/features/EMR/widget/row_widget_container_start.dart';
import 'package:umedmiscanner/features/EMR/widget/stack_interventions.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widgett.dart';

class EmrInterventions extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ColumnFloatingWidget(checkIcon:
        true,),
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
                      text: 'Interventions',
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
                      icon: DocIcon.doctor__4_,text: 'Interventions',),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: ListView(
                          children: [
                            RowWidget(
                              check: 0,
                              text: 'Made on 15/1/2019',
                              textDef: 'URL Document',
                              icon: Icons.attachment_rounded,
                              child: TextWidgett(
                                text: 'URL: Lorem ipsum dolor sit amet, '
                                    'consetetur sadipscing elitr, diam nonumy eirmod tempor invidunt.',
                                color: Color.fromRGBO(82, 9, 116, 1),
                              ),
                            ),
                            RowWidget(
                              check: 1,
                              text: 'Made on 20/1/2019',
                              textDef: 'URL Document',
                              icon: Icons.attachment_rounded,
                              child: TextWidgett(
                                text: 'URL: Lorem ipsum dolor sit amet, '
                                    'consetetur sadipscing elitr, diam nonumy eirmod tempor invidunt.',
                                color: Color.fromRGBO(82, 9, 116, 1),
                              ),
                            ),
                            RowWidget(
                              check: 2,
                              text: 'Made on 20/2/2019',
                              textDef: 'URL Document',
                              icon: Icons.attachment_rounded,
                              child: TextWidgett(
                                text: 'URL: Lorem ipsum dolor sit amet, '
                                    'consetetur sadipscing elitr, diam nonumy eirmod tempor invidunt.',
                                color: Color.fromRGBO(82, 9, 116, 1),
                              ),
                            ),
                            //////////////////////////////////////////////////////////////////////////////////

                            RowWidget(
                                check: 3,
                                text: 'Made on 12/3/2020',
                                textDef: 'Complete Blood Count',
                                icon: MicroIcon.microscope,
                                child: Container(
                                  child: ContainerWidgetPrescription(text: 'Complete Blood Count',check:false))
                                ),

                            RowWidget(
                                check: 4,
                                text: 'Made on 20/4/2020',
                                textDef: 'X-Ray',
                                icon: XRayIcon.x_ray,
                                child: ContainerWidgetPrescription(text: 'X-Ray',check:false)),

                            RowWidget(
                                check: 5,
                                text: 'Made on 20/5/2020',
                                textDef: 'Test Name',
                                icon: PulseIcon.pulse_line,
                                child: ContainerWidgetPrescription(text: 'Test Name',check:false)),
                            RowWidget(
                                check: 5,
                                text: 'Made on 20/6/2020',
                                textDef: 'Test Name',
                                icon: PulseIcon.pulse_line,
                                child: Container()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //ColumnFloatingWidget()
            ],
          ),
        ),
      ),
    );
  }
}
