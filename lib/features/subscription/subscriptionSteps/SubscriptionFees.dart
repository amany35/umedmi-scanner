import 'package:flutter/material.dart';

import 'SubscriptionUnderReview.dart';
import 'YearPayment.dart';
import 'SubscriptionPayment.dart';

class SubscriptionFees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubscriptionPayment(
      monthWidget: Container(
          width: 64.0,
          height: 20.0,
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(255, 255, 255, 1)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(133, 45, 145, 1),
                  Color.fromRGBO(65, 8, 92, 1)
                ]),
//  color: Color.fromRGBO(255, 255, 255, 1),
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
                  color: Color.fromRGBO(255, 255, 255, 1)),
            ),
          )),
      yearWidget: Container(
          width: 58.0,
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
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(85, 24, 114, 1), blurRadius: 8.0)
              ]),
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YearPayment()),
              );
            },
            child: Text(
              'Year',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Gilroy-m',
                  fontSize: 10.0,
                  decoration: TextDecoration.none,
                  color: Color.fromRGBO(82, 9, 116, 1)),
            ),
          )),
      textOfRecepit: '--------',
      textOfTill: '2 January, 2020',
      textOfDiscount: '0%',
      rowOfattach: Row(
        children: [
          Container(),
        ],
      ),
      onPressBtnU: (){
        print('null');
      },
      onPressIcon:(){
       print('null');
      },
      onPressBtnC: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SubscriptionUnderReview()),
        );
      },

    );
  }
}
