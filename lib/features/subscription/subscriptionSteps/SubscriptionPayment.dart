import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'icons/appoint_icon_icons.dart';
import 'icons/attach_icon_icons.dart';
import 'icons/coins_icon_icons.dart';
import 'icons/payment_icon_icons.dart';
import 'icons/tic_icon_icons.dart';
import 'icons/validate_icon_icons.dart';
import 'icons/cash_icon_icons.dart';
import 'icons/close_icon_icons.dart';

import 'icons/ud_icon_icons.dart';

class SubscriptionPayment extends StatelessWidget {
  final monthWidget;
  final yearWidget;
  final textOfTill;
  final textOfDiscount;
  final rowOfattach;
  final textOfRecepit;
  final onPressIcon;
  final onPressBtnC;
  final onPressBtnU;


  const SubscriptionPayment(
      {Key key,
      this.monthWidget,
      this.yearWidget,
      this.textOfTill,
      this.textOfDiscount,
      this.rowOfattach,
      this.textOfRecepit,
      this.onPressIcon,
      this.onPressBtnC,
      this.onPressBtnU})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(255, 255, 255, 1),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 22.72,
                            height: 22.72,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(82, 9, 116, 1),
                                  width: 1.5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.arrow_back_ios_rounded,
                                color: Color.fromRGBO(82, 9, 116, 1), size: 15.0),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Individual Subscription',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Gilroy-ExtraBold',
                              fontSize: 25.0,
                              color: Color.fromRGBO(85, 24, 114, 1),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 22.72,
                            height: 22.72,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color.fromRGBO(82, 9, 116, 1),
                                  width: 1.5),
                            ),
                            //child: Icon(Icons.close_rounded,color: Color.fromRGBO(82, 9, 116, 1),size: 18.0),
                            child: Icon(CloseIcon.close,
                                size: 12.0, color: Color.fromRGBO(82, 9, 116, 1)),
                            // child: Tab(icon: Icon(MyFlutterApp.cancel_circled),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(238, 0, 97, 1),
                                blurRadius: 15.0)
                          ]),
                      child: CircularPercentIndicator(
                        radius: 75.0,
                        /* linearGradient: LinearGradient(
                          begin: Alignment.topRight,
                          end:  Alignment.bottomCenter,
                          colors: [Color.fromRGBO(82, 9, 116, 1),Color.fromRGBO(82, 9, 116, 1)]
                        ),*/

                        center: Text(
                          '2 of 3',
                          style: TextStyle(
                              fontSize: 16.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'GilroyLight',
                              color: Color.fromRGBO(0, 0, 0, 1),
                              shadows: [
                                Shadow(
                                  blurRadius: 5.5,
                                  color: Color.fromRGBO(101, 99, 112, 1),
                                  // color: Color.fromRGBO(238, 0, 97, 1),
                                  //  offset: Offset(0,3),
                                ),
                              ]),
                        ),
                        animation: true,
                        progressColor: Color.fromRGBO(82, 9, 116, 1),
                        percent: 0.3,
                        lineWidth: 5,
                        circularStrokeCap: CircularStrokeCap.round,
                        //rgb(238, 0, 97)
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            'Payment & Coupons',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 22.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'GilroyLight',
                              color: Color.fromRGBO(85, 24, 114, 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Text(
                              'Next : Review',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'GilroyLight',
                                decoration: TextDecoration.none,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Individual',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(85, 24, 114, 1),
                            fontSize: 16.0,
                            fontFamily: 'GilroyLight',
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                            height: 20.0,
                            width: 150.0,
                            child: Divider(
                              color: Color.fromRGBO(85, 24, 114, 1),
                              thickness: 2.0,
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Corporate',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(155, 152, 152, 1),
                            fontSize: 16.0,
                            fontFamily: 'GilroyLight',
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                            height: 20.0,
                            width: 150.0,
                            child: Divider(
                              color: Color.fromRGBO(217, 217, 217, 1),
                              thickness: 2.0,
                            )),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 55.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color.fromRGBO(82, 9, 116, 1)),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(232, 230, 241, 1),
                              blurRadius: 10.0,
                              // changes position of shadow
                            ),
                          ]),
                      child: Icon(
                        CashIcon.funds,
                        color: Color.fromRGBO(82, 9, 116, 1),
                        size: 30,
                      ),
                    ),
                    ////////////////////
                    Container(
                        width: 56.0,
                        height: 56.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(232, 230, 241, 1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        //child: Icon(PaymentIcon.payment),

                        /*child: RadiantGradientMask(
                        child: Icon(
                          PaymentIcon.payment,
                          color:Colors.white
                        ),
                      ),*/

                        child: ColorFiltered(
                          colorFilter:
                              ColorFilter.mode(Colors.grey, BlendMode.modulate),
                          child: Icon(
                            PaymentIcon.payment,
                          ),
                        )),
                    Container(
                      width: 55.0,
                      height: 56.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(232, 230, 241, 1),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("images/fawerylogo.png"),
                        //  radius: 3.0,
                      ),

                      /* child: ColorFiltered(
                           colorFilter: ColorFilter.mode(Colors.grey,BlendMode.saturation ),
                          child: Image.asset("assets/images/fawerylogo.jpg" , )),*/
                    ),
                    Container(
                      width: 56.0,
                      height: 56.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(232, 230, 241, 1),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Icon(UdIcon.udemilogo),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 350.0,
                  height: 400.0,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(255, 255, 255, 1)),
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(29, 40, 46, 1),
                          blurRadius: 10.0,
                        )
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 42.0,
                            height: 41.0,
                            decoration: BoxDecoration(
                                //  border: Border.all(color: Color.fromRGBO(255, 255, 255, 1)),
                                color: Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(25),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(204, 216, 223, 1),
                                    blurRadius: 10.0,
                                  )
                                ]),
                            child: Icon(AppointIcon.appointments,
                                color: Color.fromRGBO(82, 9, 116, 1)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Dr. Andrew Parker',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Gilroy-semi',
                                  fontSize: 15.0,
                                  decoration: TextDecoration.none,
                                  color: Color.fromRGBO(29, 40, 46, 1)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              'Phsyciatrist',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Gilroy-m',
                                  fontSize: 12.0,
                                  decoration: TextDecoration.none,
                                  color: Color.fromRGBO(29, 40, 46, 1)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          width: 350.0,
                          child: Divider(
                            color: Color.fromRGBO(217, 217, 217, 1),
                            indent: 46.0,
                            thickness: 2.0,
                          )),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 31.5,
                            height: 30.39,
                            child: Icon(TicIcon.subscription_ticket__1_,
                                color: Color.fromRGBO(82, 9, 116, 1)),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Package',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy-semi',
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(29, 40, 46, 1)),
                                  ),
                                  SizedBox(
                                    width: 120.0,
                                  ),
                                  Container(
                                      width: 80.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color.fromRGBO(133, 45, 145, 1),
                                              Color.fromRGBO(65, 8, 92, 1)
                                            ]),
                                        //  border: Border.all(color: Color.fromRGBO(255, 255, 255, 1)),
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
                                          'Titanium',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'Gilroy-m',
                                              fontSize: 10.0,
                                              decoration: TextDecoration.none,
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1)),
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 2.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:8),
                                child: Row(
                                  children: [
                                    Text(
                                      'Type',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Gilroy-semi',
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          color: Color.fromRGBO(29, 40, 46, 1)),
                                    ),
                                    SizedBox(
                                      width: 150.0,
                                    ),
                                    Container(
                                        width: 86.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    85, 24, 114, 1)),
                                            color:
                                                Color.fromRGBO(255, 255, 255, 1),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8),
                                              bottomLeft: Radius.circular(8),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(
                                                      85, 24, 114, 1),
                                                  blurRadius: 8.0)
                                            ]),
                                        child: FlatButton(
                                          onPressed: () {},
                                          child: Text(
                                            'individual',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontFamily: 'Gilroy-m',
                                                fontSize: 10.0,
                                                decoration: TextDecoration.none,
                                                color: Color.fromRGBO(
                                                    82, 9, 116, 1)),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width: 300.0,
                                  child: Divider(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    indent: 5.0,
                                    thickness: 2.0,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 31.5,
                            height: 30.39,
                            child: Icon(ValidateIcon.validation,
                                color: Color.fromRGBO(82, 9, 116, 1)),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Validity',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy-semi',
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(29, 40, 46, 1)),
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Container(
                                    width: 22.72,
                                    height: 22.72,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromRGBO(82, 9, 116, 1),
                                          width: 1.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.arrow_back_ios_rounded,
                                        color: Color.fromRGBO(82, 9, 116, 1),
                                        size: 15.0),
                                  ),
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  Container(
                                      width: 30.0,
                                      height: 22.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  85, 24, 114, 1)),
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(8),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    85, 24, 114, 1),
                                                blurRadius: 8.0)
                                          ]),
                                      child: FlatButton(
                                        onPressed: () {},
                                        child: Text(
                                          '1',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Gilroy-m',
                                              fontSize: 10.0,
                                              decoration: TextDecoration.none,
                                              color: Color.fromRGBO(
                                                  82, 9, 116, 1)),
                                        ),
                                      )),
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  Container(
                                    width: 22.72,
                                    height: 22.72,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromRGBO(82, 9, 116, 1),
                                          width: 1.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.arrow_forward_ios,
                                        color: Color.fromRGBO(82, 9, 116, 1),
                                        size: 15.0),
                                  ),
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  monthWidget,
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  yearWidget,
                                ],
                              ),
                              SizedBox(
                                height: 2.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:15),
                                child: Row(
                                  children: [
                                    Text(
                                      'Till',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Gilroy-semi',
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          color: Color.fromRGBO(29, 40, 46, 1)),
                                    ),
                                    SizedBox(
                                      width: 130.0,
                                    ),
                                    Container(
                                        width: 150.0,
                                        height: 30.0,
                                        child: Text(
                                          '$textOfTill',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontFamily: 'Gilroy-semi',
                                              fontSize: 15.0,
                                              decoration: TextDecoration.none,
                                              color:
                                                  Color.fromRGBO(82, 9, 116, 1)),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width: 300.0,
                                  child: Divider(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    indent: 12.0,
                                    thickness: 2.0,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      //////////////////////////////////////////////////////////////////////////////////////
                      Row(
                        children: [
                          Container(
                            width:15,
                            height: 30.39,
                            child: Icon(CoinsIcon.coin_stack,
                                color: Color.fromRGBO(82, 9, 116, 1)),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Subscription Fees',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy-semi',
                                        fontSize: 12.0,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(29, 40, 46, 1)),
                                  ),
                                  SizedBox(
                                    width: 90.0,
                                  ),
                                  Text(
                                    '250 EGP',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy-m',
                                        fontSize: 12.0,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(29, 40, 46, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Sales Tax',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy-semi',
                                        fontSize: 12.0,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(29, 40, 46, 1)),
                                  ),
                                  SizedBox(
                                    width: 140.0,
                                  ),
                                  Text(
                                    '30 EGP',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy-m',
                                        fontSize: 12.0,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(29, 40, 46, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Discount Coupon',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy-semi',
                                        fontSize: 12.0,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(238, 0, 97, 1)),
                                  ),
                                  SizedBox(
                                    width: 120.0,
                                  ),
                                  Text(
                                    '$textOfDiscount',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy-m',
                                        fontSize: 12.0,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(238, 0, 97, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  width: 300.0,
                                  child: Divider(
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                    indent: 12.0,
                                    thickness: 2.0,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 31.5,
                            height: 30.39,
                            child: Icon(AttachIcon.attach,
                                color: Color.fromRGBO(82, 9, 116, 1)),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Receipt',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Gilroy-semi',
                                          fontSize: 12.0,
                                          decoration: TextDecoration.none,
                                          color: Color.fromRGBO(238, 0, 97, 1)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150.0,
                                  ),
                                  Text(
                                    '$textOfRecepit',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy-m',
                                        fontSize: 12.0,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(238, 0, 97, 1)),
                                  ),
                                ],
                              ),
                              rowOfattach,
                              /* Row(

                                children: [
                                  Container(
                                    width: 31.5,
                                    height: 30.39,
                                    child: Icon(Documentcon.document,
                                        color: Color.fromRGBO(82, 9, 116, 1)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Doc2136_9313.217',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontFamily: 'Gilroy-semi',
                                          fontSize: 10.0,
                                          decoration: TextDecoration.none,
                                          color: Color.fromRGBO(82, 9, 116, 1)),
                                    ),
                                  ),

                                  SizedBox(
                                    width: 80.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Container(
                                      width: 20.99,
                                      height: 20.99,
                                      child: Icon(DeteteIcon.delete,
                                          color: Color.fromRGBO(238, 0, 97, 1)),
                                    ),
                                  ),
                                ],
                              )*/
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                          width: 320.0,
                          child: Divider(
                            color: Color.fromRGBO(217, 217, 217, 1),
                            indent: 40.0,
                            thickness: 2.0,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              'Total',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Gilroy-ExtraBold',
                                  fontSize: 12.0,
                                  decoration: TextDecoration.none,
                                  color: Color.fromRGBO(29, 40, 46, 1)),
                            ),
                          ),
                          SizedBox(
                            width: 120.0,
                          ),
                          Text(
                            '261 EGP',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Gilroy-m',
                                fontSize: 12.0,
                                decoration: TextDecoration.none,
                                color: Color.fromRGBO(29, 40, 46, 1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 158.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(82, 9, 116, 1),
                          ),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(85, 24, 114, 1),
                              blurRadius: 15.0,
                              // changes position of shadow
                            ),
                          ]),
                      child: FlatButton(
                          onPressed: () {},
                          child: Text('Add Coupon',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(82, 9, 116, 1),
                                fontSize: 12.0,
                                fontFamily: 'Arial-bold',
                                decoration: TextDecoration.none,
                              ))),
                    ),
                    Container(
                      width: 158.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(82, 9, 116, 1),
                          ),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(85, 24, 114, 1),
                              blurRadius: 15.0,
                              // changes position of shadow
                            ),
                          ]),
                      child: FlatButton(
                          onPressed: () {
                            onPressBtnU();
                          },
                          child: Text('Upload Receipt',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(82, 9, 116, 1),
                                fontSize: 12.0,
                                fontFamily: 'Arial-bold',
                                decoration: TextDecoration.none,
                              ))),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 320.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(82, 9, 116, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(85, 24, 114, 1),
                              blurRadius: 15.0,
                              // changes position of shadow
                            ),
                          ]),
                      child: FlatButton(
                          onPressed: () {
                            onPressBtnC();
                          },
                          child: Text('Confirm Payment',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 18.0,
                                fontFamily: 'Gilroy-semi',
                                decoration: TextDecoration.none,
                              ))),
                    ),

                  ],
                ),
                SizedBox(
                    height:20
                )
              ],
            ),
          ],
        ),
      ),
      /////////////////////////////
    );
  }
}
