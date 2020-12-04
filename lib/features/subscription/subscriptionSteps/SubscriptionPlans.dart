import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'SubscriptionFees.dart';

class SubscriptionPlans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget horizontalList1 = new Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 237.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                    width: 118.67,
                    height: 170.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(255, 255, 255, 0.5)),
                        color: Color.fromRGBO(155, 152, 152, 1),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            blurRadius: 5.0,
                            // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Container(
                            width: 90.81,
                            height: 35.24,
                            decoration: BoxDecoration(
                              //color: Color.fromRGBO(235, 234, 232, 1),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(235, 234, 232, 1),
                                    Color.fromRGBO(185, 185, 185, 1)
                                  ]),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                            ),
                            child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  'Silver',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 17.0,
                                    fontFamily: 'GilroyLight',
                                    decoration: TextDecoration.none,
                                  ),
                                )),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('EGP 50',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 13.0,
                                    fontFamily: 'Gilroy-UltraLight',
                                    decoration: TextDecoration.none,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('/',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 14.0,
                                    fontFamily: 'GilroyLight',
                                    decoration: TextDecoration.none,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('Y',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 10.0,
                                    fontFamily: 'GilroyLight',
                                    decoration: TextDecoration.none,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('EGP500',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 16.0,
                                    fontFamily: 'Gilroy-UltraLight',
                                    decoration: TextDecoration.none,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('/',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 14.0,
                                    fontFamily: 'GilroyLight',
                                    decoration: TextDecoration.none,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('Y',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 10.0,
                                    fontFamily: 'GilroyLight',
                                    decoration: TextDecoration.none,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:5),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Icon(
                                Icons.star_rounded,
                                color: Color.fromRGBO(248, 248, 30, 1),
                              )),
                              Expanded(
                                  child: Icon(
                                Icons.star_outline_rounded,
                                color: Color.fromRGBO(85, 24, 114, 0.3),
                              )),
                              Expanded(
                                  child: Icon(
                                Icons.star_outline_rounded,
                                color: Color.fromRGBO(85, 24, 114, 0.3),
                              )),
                              Expanded(
                                  child: Icon(
                                Icons.star_outline_rounded,
                                color: Color.fromRGBO(85, 24, 114, 0.3),
                              )),
                              Expanded(
                                  child: Icon(
                                Icons.star_outline_rounded,
                                color: Color.fromRGBO(85, 24, 114, 0.3),
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 15.0,
                ),
                ///////////////////
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                      width: 130.0,
                      height: 37.0,
                      decoration: BoxDecoration(
                          // color: Color.fromRGBO(235, 234, 232, 0.8),

                          //rgb(235, 234, 232)
                          //rgb(185, 185, 185)
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(235, 234, 232, 1),
                                Color.fromRGBO(185, 185, 185, 1)
                              ]),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(217, 217, 217, 0.8),
                              blurRadius: 5.0,
                              // changes position of shadow
                            ),
                          ]),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubscriptionFees()),
                          );
                        },
                        child: Text('Subscribe',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(85, 24, 114, 1),
                              fontSize: 18.0,
                              fontFamily: 'GilroyLight',
                              decoration: TextDecoration.none,
                            )),
                      )),
                ),
              ],
            ),
            ////////////////////////////////////////////////////
            SizedBox(
              width: 50.0,
            ),
            Column(
              children: [
                Container(
                  width: 118.67,
                  height: 170.0,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(255, 255, 255, 0.5)),
                      color: Color.fromRGBO(197, 160, 96, 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          blurRadius: 5.0,
                          // changes position of shadow
                        ),
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          width: 90.81,
                          height: 35.24,
                          decoration: BoxDecoration(
                            //color: Color.fromRGBO(247, 177,50, 0.9),
                            //rgb(255, 248, 216)
                            //rgb(236, 178, 45)
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 248, 216, 1),
                                  Color.fromRGBO(236, 178, 45, 1)
                                ]),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Gold',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 17.0,
                                  fontFamily: 'GilroyLight',
                                  decoration: TextDecoration.none,
                                ),
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('EGP 150',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 13.0,
                                  fontFamily: 'Gilroy-UltraLight',
                                  decoration: TextDecoration.none,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('/',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 14.0,
                                  fontFamily: 'GilroyLight',
                                  decoration: TextDecoration.none,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('M',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 10.0,
                                  fontFamily: 'GilroyLight',
                                  decoration: TextDecoration.none,
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('EGP1500',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 16.0,
                                  fontFamily: 'Gilroy-UltraLight',
                                  decoration: TextDecoration.none,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('/',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 14.0,
                                  fontFamily: 'GilroyLight',
                                  decoration: TextDecoration.none,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('Y',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 10.0,
                                  fontFamily: 'GilroyLight',
                                  decoration: TextDecoration.none,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:5),
                        child: Row(
                          children: [
                            Expanded(
                                child: Icon(
                              Icons.star_rounded,
                              color: Color.fromRGBO(248, 248, 30, 1),
                            )),
                            Expanded(
                                child: Icon(
                              Icons.star_rounded,
                              color: Color.fromRGBO(248, 248, 30, 1),
                            )),
                            Expanded(
                                child: Icon(
                              Icons.star_rounded,
                              color: Color.fromRGBO(248, 248, 30, 1),
                            )),
                            Expanded(
                                child: Icon(
                              Icons.star_rounded,
                              color: Color.fromRGBO(155, 152, 152, 1),
                            )),
                            Expanded(
                                child: Icon(
                              Icons.star_rounded,
                              color: Color.fromRGBO(155, 152, 152, 1),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    width: 130.0,
                    height: 37.0,
                    decoration: BoxDecoration(
                        // color: Color.fromRGBO(235, 234, 232, 0.8),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(255, 248, 216, 1),
                              Color.fromRGBO(236, 178, 45, 1)
                            ]),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(217, 217, 217, 0.8),
                            blurRadius: 5.0,
                            // changes position of shadow
                          ),
                        ]),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SubscriptionFees()),
                        );
                      },
                      child: Text('Subscribe',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(85, 24, 114, 1),
                            fontSize: 18.0,
                            fontFamily: 'GilroyLight',
                            decoration: TextDecoration.none,
                          )),
                    )),
              ],
            ),
            SizedBox(
              width: 50.0,
            ),
            Column(
              children: [
                Container(
                  width: 140.0,
                  height: 170.0,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(255, 255, 255, 0.5)),
                      color: Color.fromRGBO(71, 11, 97, 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          blurRadius: 5.0,
                          // changes position of shadow
                        ),
                      ]),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          width: 130.0,
                          height: 35.24,
                          decoration: BoxDecoration(
                            //color: Color.fromRGBO(235, 234, 232, 1),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(159, 103, 163, 1),
                                  Color.fromRGBO(252, 248, 248, 1)
                                ]),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Titanium',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 17.0,
                                  fontFamily: 'GilroyLight',
                                  decoration: TextDecoration.none,
                                ),
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('EGP 300',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 13.0,
                                  fontFamily: 'Gilroy-UltraLight',
                                  decoration: TextDecoration.none,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('/',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 14.0,
                                  fontFamily: 'GilroyLight',
                                  decoration: TextDecoration.none,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('M',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 10.0,
                                  fontFamily: 'GilroyLight',
                                  decoration: TextDecoration.none,
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('EGP3000',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 16.0,
                                  fontFamily: 'Gilroy-UltraLight',
                                  decoration: TextDecoration.none,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('/',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 14.0,
                                  fontFamily: 'GilroyLight',
                                  decoration: TextDecoration.none,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('Y',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 10.0,
                                  fontFamily: 'GilroyLight',
                                  decoration: TextDecoration.none,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:5),
                        child: Row(
                          children: [
                            Expanded(
                                child: Icon(
                              Icons.star_rounded,
                              color: Color.fromRGBO(248, 248, 30, 1),
                            )),
                            Expanded(
                                child: Icon(
                              Icons.star_rounded,
                              color: Color.fromRGBO(248, 248, 30, 1),
                            )),
                            Expanded(
                                child: Icon(
                              Icons.star_rounded,
                              color: Color.fromRGBO(248, 248, 30, 1),
                            )),
                            Expanded(
                                child: Icon(
                              Icons.star_rounded,
                              color: Color.fromRGBO(248, 248, 30, 1),
                            )),
                            Expanded(
                                child: Icon(
                              Icons.star_rounded,
                              color: Color.fromRGBO(155, 152, 152, 1),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    width: 130.0,
                    height: 37.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(154, 0, 159, 1),
                              Color.fromRGBO(123, 4, 141, 1),
                              Color.fromRGBO(165, 113, 189, 1),
                              Color.fromRGBO(44, 3, 45, 1),
                              Color.fromRGBO(19, 4, 20, 1)
                            ]),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(247, 247, 248, 0.8),
                            blurRadius: 5.0,
                            // changes position of shadow
                          ),
                        ]),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SubscriptionFees()),
                        );
                      },
                      child: Text('Subscribe',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 18.0,
                            fontFamily: 'GilroyLight',
                            decoration: TextDecoration.none,
                          )),
                    )),
              ],
            ),
            //////////////////////////////
            SizedBox(
              width: 50.0,
            ),
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: 140.0,
                      height: 170.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.5)),
                          color: Color.fromRGBO(248, 38, 107, 1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              blurRadius: 5.0,
                              // changes position of shadow
                            ),
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Container(
                              width: 140.0,
                              height: 35.24,
                              decoration: BoxDecoration(
                                //color: Color.fromRGBO(235, 234, 232, 1),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(255, 194, 236, 1),
                                      Color.fromRGBO(214, 55, 166, 1)
                                    ]),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                              ),
                              child: FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Platinum',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 17.0,
                                      fontFamily: 'GilroyLight',
                                      decoration: TextDecoration.none,
                                    ),
                                  )),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text('EGP 500',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 13.0,
                                      fontFamily: 'Gilroy-UltraLight',
                                      decoration: TextDecoration.none,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text('/',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 14.0,
                                      fontFamily: 'GilroyLight',
                                      decoration: TextDecoration.none,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text('M',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 10.0,
                                      fontFamily: 'GilroyLight',
                                      decoration: TextDecoration.none,
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text('EGP5000',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 16.0,
                                      fontFamily: 'Gilroy-UltraLight',
                                      decoration: TextDecoration.none,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text('/',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 14.0,
                                      fontFamily: 'GilroyLight',
                                      decoration: TextDecoration.none,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text('Y',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 10.0,
                                      fontFamily: 'GilroyLight',
                                      decoration: TextDecoration.none,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:5),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Icon(
                                  Icons.star_rounded,
                                  color: Color.fromRGBO(248, 248, 30, 1),
                                )),
                                Expanded(
                                    child: Icon(
                                  Icons.star_rounded,
                                  color: Color.fromRGBO(248, 248, 30, 1),
                                )),
                                Expanded(
                                    child: Icon(
                                  Icons.star_rounded,
                                  color: Color.fromRGBO(248, 248, 30, 1),
                                )),
                                Expanded(
                                    child: Icon(
                                  Icons.star_rounded,
                                  color: Color.fromRGBO(248, 248, 30, 1),
                                )),
                                Expanded(
                                    child: Icon(
                                  Icons.star_rounded,
                                  color: Color.fromRGBO(248, 248, 30, 1),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        width: 130.0,
                        height: 37.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 194, 236, 1),
                                  Color.fromRGBO(214, 55, 166, 1)
                                ]),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(217, 217, 217, 0.8),
                                blurRadius: 5.0,
                                // changes position of shadow
                              ),
                            ]),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubscriptionFees()),
                            );
                          },
                          child: Text('Subscribe',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(85, 24, 114, 1),
                                fontSize: 18.0,
                                fontFamily: 'GilroyLight',
                                decoration: TextDecoration.none,
                              )),
                        )),
                  ],
                ),
                /////////////////////////////////////////////
              ],
            ),
            SizedBox(
              width:30
            )
          ],
        ));

    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(255, 255, 255, 1),
        child: ListView(
          children: [
            Column(
              children: [
                //BuildWidgetBegin(textOfInducator: '1 of 3',textOfNext: 'Next : Payment',),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
//                        Container(
//                          width: 22.72,
//                          height: 22.72,
//                          decoration: BoxDecoration(
//                            border: Border.all(
//                                color: Color.fromRGBO(82, 9, 116, 1),
//                                width: 1.5),
//                            shape: BoxShape.circle,
//                          ),
//                          child: Icon(Icons.arrow_back_ios_rounded,
//                              color: Color.fromRGBO(82, 9, 116, 1), size: 15.0),
//                        ),
                        Container(
                          padding:const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Subscription',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Gilroy-ExtraBold',
                              fontSize: 25.0,
                              color: Color.fromRGBO(85, 24, 114, 1),
                            ),
                          ),
                        ),
//                        Container(
//                          width: 22.72,
//                          height: 22.72,
//                          decoration: BoxDecoration(
//                            shape: BoxShape.circle,
//                            border: Border.all(
//                                color: Color.fromRGBO(82, 9, 116, 1),
//                                width: 1.5),
//                          ),
//                          //child: Icon(Icons.close_rounded,color: Color.fromRGBO(82, 9, 116, 1),size: 18.0),
//                          child: Icon(CloseIcon.close,
//                              size: 12.0, color: Color.fromRGBO(82, 9, 116, 1)),
//                          // child: Tab(icon: Icon(MyFlutterApp.cancel_circled),
//                        ),
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
                          '1 of 3',
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
                            'Subscription Plans',
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
                              'Next : Payment',
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
                  height: 12.0,
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
                            width: 160.0,
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
                            width: 160.0,
                            child: Divider(
                              color: Color.fromRGBO(217, 217, 217, 1),
                              thickness: 2.0,
                            )),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        'Free Gold Month!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 16.0,
                          fontFamily: 'GilroyLight',
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Container(
                        width: 280.0,
                        height: 62.0,
                        child: Text(
                          'Invite 10 colleagues or more and get for 1 free month of Gold subscription',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 16.0,
                            fontFamily: 'GilroyLight',
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 160.0,
                        height: 42.0,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(85, 24, 114, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(85, 24, 114, 1),
                                blurRadius: 5.0,
                                // changes position of shadow
                              ),
                            ]),
                        child: FlatButton(
                            onPressed: () {},
                            child: Text('Invite now!',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontSize: 14.0,
                                  fontFamily: 'GilroyLight',
                                  decoration: TextDecoration.none,
                                ))),
                      ),
                      Container(
                        width: 160.0,
                        height: 42.0,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(85, 24, 114, 1),
                                blurRadius: 5.0,
                                // changes position of shadow
                              ),
                            ]),
                        child: FlatButton(
                            onPressed: () {},
                            child: Text('Add invitation code',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 14.0,
                                  fontFamily: 'GilroyLight',
                                  decoration: TextDecoration.none,
                                ))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 206.0,
                      height: 20.0,
                      child: Text('Or choose from one of our plans',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 15.0,
                            fontFamily: 'GilroyLight',
                            decoration: TextDecoration.none,
                          )),
                    ),
                  ],
                ),
                ///////////////////////////////
                Center(
                  child: Container(
                    height: 237.0,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        horizontalList1,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
