import 'package:flutter/material.dart';

import 'SubscriptionFees.dart';
import 'SubscriptionUnderReview.dart';
import 'YearAttachment.dart';
import 'icons/detete_icon_icons.dart';
import 'icons/images_icon_icons.dart';
import 'SubscriptionPayment.dart';

class YearPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubscriptionPayment(
      monthWidget: Container(
          width: 64.0,
          height: 20.0,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(85, 24, 114, 1)),
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          child: FlatButton(
            onPressed: () {},
            child: Text(
              'Month',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Gilroy-m',
                  fontSize: 8.0,
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(82, 9, 116, 1)),
            ),
          )),
      yearWidget: Container(
          width: 58.0,
          height: 20.0,
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(255, 255, 255, 1)),
              color: Color.fromRGBO(82, 9, 116, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(85, 24, 114, 1), blurRadius: 8.0)
              ]),
          child: FlatButton(
            onPressed: () {},
            child: Text(
              'Year',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Gilroy-m',
                  fontSize: 10.0,
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(255, 255, 255, 1)),
            ),
          )),
      textOfRecepit: '1',
      textOfTill: '2 January, 2021',
      textOfDiscount: '0%',
      rowOfattach: Row(
        children: [
          Container(
            width: 31.5,
            height: 30.39,
            child:
                Icon(ImagesIcon.gallery, color: Color.fromRGBO(82, 9, 116, 1)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              'img2136_9313.216',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Gilroy-semi',
                  fontSize: 10.0,
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(82, 9, 116, 1)),
            ),
          ),
          SizedBox(
            width: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubscriptionFees()),
                );
              },
              child:
                  Icon(DeteteIcon.delete, color: Color.fromRGBO(238, 0, 97, 1)),
            ),
          ),
        ],
      ),
      onPressBtnU: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => YearAttachment()),
        );
      },
      onPressBtnC: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SubscriptionUnderReview()),
        );
      },
      onPressIcon: () {
        print('null');
      },

    );
  }
}
