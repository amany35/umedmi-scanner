import 'package:flutter/material.dart';
import 'package:umedmiscanner/features/EMR/icons/comment_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/icons/share_purple_icon_icons.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widget.dart';
import 'package:umedmiscanner/features/EMR/widget/text_widgett.dart';

import 'fdot_widget.dart';
import 'icon_widget.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key key,
    @required this.check,
    @required this.text,
    @required this.textDef,
    @required this.icon,
    @required this.child,
  }) : super(key: key);

  final int check;
  final String text;
  final String textDef;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Color.fromRGBO(82, 9, 116, 1),
          size: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: FDottedLineWidget(height: 90.0,),
        ),
        Wrap(
          direction: Axis.vertical,
          //alignment: WrapAlignment.start,
          children: [
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: [
                Container(
                  width: 155.0,
                  child: TextWidgett(
                    text: textDef,
                    color: Color.fromRGBO(29, 40, 46, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0),
                  child: Container(
                    child: check == 0
                        ? Wrap(
                      alignment: WrapAlignment.end,
                      direction: Axis.horizontal,
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        IconWidget(
                          icon: Icons.local_offer_outlined,
                        ),
                        TextWidgett(
                          text: '4',
                          color: Color.fromRGBO(82, 9, 116, 1),
                        ),
                        IconWidget(
                          icon: Icons.attach_file_outlined,
                        ),
                        TextWidgett(
                          text: '3',
                          color: Color.fromRGBO(82, 9, 116, 1),
                        ),
                        IconWidget(
                          icon: SharePurpleIcon.shared_purple,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        TextWidgett(
                          text: '3',
                          color: Color.fromRGBO(82, 9, 116, 1),
                        ),
                      ],
                    )
                        : check == 1
                        ? Wrap(
                      alignment: WrapAlignment.end,
                      direction: Axis.horizontal,
                      children: [
                        IconWidget(
                          icon: Icons.attach_file_outlined,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        TextWidgett(
                          text: '1',
                          color: Color.fromRGBO(82, 9, 116, 1),
                        ),
                      ],
                    )
                        : check == 2
                        ? Wrap(
                      alignment: WrapAlignment.end,
                      direction: Axis.horizontal,
                      children: [
                        IconWidget(
                          icon: Icons.attach_file_outlined,
                        ),
                        TextWidgett(
                          text: '4',
                          color: Color.fromRGBO(82, 9, 116, 1),
                        ),
                        IconWidget(
                          icon: SharePurpleIcon.shared_purple,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        TextWidgett(
                          text: '2',
                          color: Color.fromRGBO(82, 9, 116, 1),
                        ),
                      ],
                    )
                        : check == 3
                        ? Wrap(
                      alignment: WrapAlignment.end,
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          '3 Flags',
                          style: TextStyle(
                            fontSize: 7.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Gilroy-Regular',
                            color: Color.fromRGBO(
                                174, 31, 67, 1),
                          ),
                        ),
                        Icon(
                          Icons.flag_outlined,
                          size: 12,
                          color: Color.fromRGBO(
                              255, 108, 145, 1),
                        )
                      ],
                    )
                        : check == 4
                        ? Wrap(
                      alignment: WrapAlignment.end,
                      direction: Axis.horizontal,
                      children: [
                        TextWidgett(
                          text: '!',
                          color: Color.fromRGBO(
                              82, 9, 116, 1),
                        ),
                        //SvgPicture.asset('images/speech-bubble.svg',color:Color.fromRGBO(82, 9, 116, 1) ,),
                        IconWidget(
                          icon: CommentIcon.speech_bubble,
                        )
                      ],
                    )
                        : Container(),
                  ),
                )
              ],
            ),

            Container(
              width: 275.0,
              child: TextWidget(
                text: text,
              ),
            ),
            Container(width: 260.0, child: child),
            SizedBox(
              // height: 30.0,
              width: 300.0,
              child: Divider(
                thickness: 2.0,

              ),
            ),
            ////////////////////////////////
          ],
        )
      ],
    );
  }
}