
import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/icons/i_d_n_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/patient_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/widget/wrap_widget.dart';

import 'container_data.dart';


class ContainerPatientData extends StatelessWidget {
  const ContainerPatientData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 347.0,
      height: 154,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              //spreadRadius: 10,
              blurRadius: 15,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Row(
          children: [
            Row(
              children: [
                Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 8.0,
                      children: [
                        // wrap widget
                        WrapWidget(
                          icon: PatientIcon.patientinfo,
                          text: 'Patient Name',
                        ),
                        // container data
                        ContainerData(
                          text: 'basma ali hassan Alsayed',
                        ),
                        WrapWidget(
                          icon: Icons.phone,
                          text: 'Phone Number',
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Container(
                                width: 20.0,
                                height: 20.0,
                                child: Image.asset('images/egypt.png')),
                            ContainerData(
                              text: '012365478910',
                            ),
                          ],
                        ),
                        WrapWidget(
                          icon: Icons.email_outlined,
                          text: 'Email Address',
                        ),
                        ContainerData(
                          text: 'emailaddress@domain.com',
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            VerticalDivider(
              width: 20.0,
              thickness: 1.0,
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  spacing: 8.0,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: WrapWidget(
                        icon: IDNIcon.id,
                        text: 'National ID',
                      ),
                    ),
                    ContainerData(
                      text: '1326531596312546312',
                    ),
                    WrapWidget(
                      icon: Icons.location_on_outlined,
                      text: 'Country, City (Current)',
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Container(
                            width: 20.0,
                            height: 20.0,
                            child: Image.asset('images/egypt.png')),
                        ContainerData(
                          text: 'Egypt, Cairo',
                        ),
                      ],
                    ),
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 8.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Gilroy-m',
                        color: Color.fromRGBO(82, 9, 116, 1),
                      ),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Container(
                            width: 170.0,
                            child: ContainerData(
                              text: 'ش مدرسة الصفوة للغات -'
                                  ' حي الشيخ زايد - قسم أول الرمل - القاهرة',
                            )),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
