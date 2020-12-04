import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:umedmiscanner/features/EMR/icons/i_d_n_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/patient_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/widget/column_height_weight.dart';
import 'package:umedmiscanner/features/EMR/widget/column_widget_patient.dart';
import 'package:umedmiscanner/features/EMR/widget/column_widget_patient_dim.dart';
import 'package:umedmiscanner/features/EMR/widget/container_column.dart';
import 'package:umedmiscanner/features/EMR/widget/container_patient.dart';
import 'package:umedmiscanner/features/EMR/widget/container_patient_data.dart';
import 'package:umedmiscanner/features/EMR/widget/container_patient_dim.dart';
import 'package:umedmiscanner/features/EMR/widget/main_row_paient_info.dart';
import 'package:umedmiscanner/features/EMR/widget/pading_text.dart';
import 'package:umedmiscanner/features/EMR/widget/patient_info_container.dart';
import 'package:umedmiscanner/features/EMR/widget/row_item.dart';
import 'package:umedmiscanner/features/EMR/widget/row_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widget.dart';

import 'emr_vital_signs_graph.dart';

class EmrPatientInformation extends StatelessWidget {
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
                    MainRowPatientInfo(onTapQr: (){
                      /// Share Qr
                      print('share Qr');
                    },onTapEdit: (){
                      /// Add Patient - ID Scan import
                      print('Edit');
                    },),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: PatientInfoContainer(
                        onTapQr: (){
                          print('Share Qr Code');
                        },),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ContainerPatientData(),
                    ),
                    Container(
                      //  height: 680.0,
                      height: MediaQuery.of(context).size.height * 0.45,

                      child: ListView(
                        children: [

                          PadingText(text: 'Demographics'),
                          // container patient
                          ContainerPatientDem(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    // column widget patient
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: ColumnWidgetPatientDim(
                                        textDef: 'Age',
                                        textDetails: '33 Years',
                                        imagePath: 'images/heart.svg',
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: ColumnWidgetPatientDim(
                                        textDef: 'Gender',
                                        textDetails: 'F',
                                        imagePath: 'images/Group.svg',
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    // column widget patient
                                    ColumnHeightWeight(svgPath:'images/fitness.svg',
                                      imagePath: 'images/height.png',
                                      textDef: 'Height',
                                      textDetails: '170 CM',),
                                   // VerticalDivider(thickness: 1.0),
                                    ColumnWidgetPatientDim(
                                      textDef: 'BMI',
                                      textDetails: '24',
                                      imagePath: 'images/bmi.svg',
                                    ),

                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    // column widget patient
                                    ColumnWidgetPatientDim(
                                      textDef: 'Blood Type',
                                      textDetails: 'AB',
                                      imagePath: 'images/surface1.svg',
                                    ),
                                    // VerticalDivider(thickness: 1.0),
                                    ColumnWidgetPatientDim(
                                      textDef: 'Insurance Status',
                                      textDetails: 'Insured',
                                      imagePath: 'images/shield.svg',
                                    ),

                                  ],
                                ),


                              ],

                            ),
                          ),
                          //////////////////////
                          // insured




                          /////////////////////
                          PadingText(text: 'Live Dashboard'),
                          ContainerPatient(
                            height: 105.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // column widget patient
                                ColumnWidgetPatient(
                                  text: '15 Prescriptions',
                                  imagePath: 'images/medical-prescription.svg',
                                ),
                                VerticalDivider(thickness: 1.0),
                                ColumnWidgetPatient(
                                  text: '6 Ongoing Meds',
                                  imagePath: 'images/drug.svg',
                                ),
                                VerticalDivider(thickness: 1.0),
                                ColumnWidgetPatient(
                                  text: '10 Visits',
                                  imagePath: 'images/Flat.svg',
                                ),
                                VerticalDivider(thickness: 1.0),
                                ColumnWidgetPatient(
                                  text: '10 Consultations',
                                  imagePath: 'images/consultation.svg',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: ContainerPatient(
                              height: 105.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Wrap(
                                  direction: Axis.vertical,
                                  alignment: WrapAlignment.spaceAround,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Diagnosis',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Gilroy-Bold',
                                        color: Color.fromRGBO(29, 40, 46, 1),
                                      ),
                                    ),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      //alignment: WrapAlignment.spaceAround,
                                      spacing: 6.0,
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        // container column
                                        ContainerColumn(
                                            imagePath: "images/diabetes.svg",
                                            colorBack: Color.fromRGBO(255, 108, 145,0.5),
                                            text: "Diabetic",
                                        colorText: Color.fromRGBO(255, 108, 145,1),),

                                        ContainerColumn(
                                            imagePath: "images/add.svg",
                                          colorBack: Color.fromRGBO(255, 108, 145,0.5),
                                            text: "Add New Dx",
                                        colorText:  Color.fromRGBO(255, 108, 145,1),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ///////////////////
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: ContainerPatient(
                              height: 105.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Wrap(
                                  direction: Axis.vertical,
                                  alignment: WrapAlignment.spaceAround,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Insured',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Gilroy-Bold',
                                        color: Color.fromRGBO(29, 40, 46, 1),
                                      ),
                                    ),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      //alignment: WrapAlignment.spaceAround,
                                      spacing: 6.0,
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        // container column
                                        ContainerColumn(

                                            imagePath: "images/shield.svg",
                                            colorBack: Color.fromRGBO(222, 247, 224,1),
                                            colorText: Color.fromRGBO(45, 145, 82,1),
                                            text: "AXA"),

                                        ContainerColumn(
                                            imagePath: "images/add.svg",
                                            colorBack: Color.fromRGBO(222, 247, 224,1),
                                            colorText: Color.fromRGBO(45, 145, 82,1),
                                            text: "Add New Dx"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          /////////////////////
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RowItem(
                                  boxShadow:  [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      blurRadius: 15,
                                    ),
                                  ],
                                  color: Colors.white,
                                  rowWidget: RowWidget(
                                    imagePath: "images/heart-attack.svg",
                                    text1: '102',
                                    text2: 'b/min',
                                  ),
                                  textWidget1: TextWidget(
                                    text: 'Heart Rate',
                                  ),
                                  child: PaddingSvgPicture(imagePath:"images/electrocardiogram.svg"),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EMRVitalSignsGraph()));
                                  },

                                ),
                                RowItem(
                                  boxShadow:  [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      blurRadius: 15,
                                    ),
                                  ],
                                  color: Colors.white,
                                  rowWidget: RowWidget(
                                    imagePath: "images/heartdot.svg",
                                    text1: '110/70',
                                    text2: 'mm/Hg',
                                  ),
                                  textWidget1: TextWidget(
                                    text: 'Blood Pressure',
                                  ),
                                  child: PaddingSvgPicture(imagePath:"images/blood-pressure-gauge.svg"),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EMRVitalSignsGraph()));
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RowItem(
                                  boxShadow:  [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      blurRadius: 15,
                                    ),
                                  ],
                                color: Colors.white,
                                  rowWidget: RowWidget(
                                    imagePath: "images/pressure.svg",
                                    text1: '37',
                                    text2: '˚C',
                                  ),
                                  textWidget1: TextWidget(
                                    text: 'Temprature',
                                  ),
                                  child: PaddingSvgPicture(imagePath:"images/thermometers.svg"),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EMRVitalSignsGraph()));
                                  },
                                ),
                                RowItem(

                                  boxShadow:  [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      blurRadius: 15,
                                    ),
                                  ],
                                  color: Colors.white,
                                  rowWidget: RowWidget(
                                    imagePath: "images/heartrate.svg",
                                    text1: '25',
                                    text2: 'c/min',
                                  ),
                                  textWidget1: TextWidget(
                                    text: 'Respiratory Rate',
                                  ),
                                  child: PaddingSvgPicture(imagePath:"images/Lungs.svg"),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EMRVitalSignsGraph()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class PaddingSvgPicture extends StatelessWidget {
  const PaddingSvgPicture({
    Key key, this.imagePath,
  }) : super(key: key);
 final imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: SvgPicture.asset(
        imagePath,
        width: 50.0,
        height: 30.0,
      ),
    );
  }
}
