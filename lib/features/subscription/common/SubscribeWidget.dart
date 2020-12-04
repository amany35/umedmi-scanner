import 'package:flutter/material.dart';
import 'package:umedmiscanner/resources/AppColors.dart';

class SubscribeWidget extends StatefulWidget {
  SubscribeWidget({@required this.firstColor, this.secColor, this.priceMonthly, this.priceAnnualy, this.messagesMonthly, this.storage,
    this.sharing, this.outboundPatientSharing,this.viewSharedPatients,this.pollFeatureMonthly,this.messageRetentionAndDeletion,
    this.umedmiBotResponses,this.callVideoFeature,this.autoScheduler,this.aDSBlocker,this.number,this.subscribeData});

  final String priceMonthly,priceAnnualy,messagesMonthly,storage,sharing,outboundPatientSharing,viewSharedPatients,
      pollFeatureMonthly,messageRetentionAndDeletion,umedmiBotResponses,callVideoFeature,autoScheduler,aDSBlocker,subscribeData;
  final Color firstColor,secColor;
  final int number;
  bool seeMore=false;

  @override
  State<StatefulWidget> createState() {
    return _SubscribeWidgetState();
  }
}

class _SubscribeWidgetState extends State<SubscribeWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.seeMore==false?  widgetWithSeeMore()
        :widgetWithSeeLess();

  }

  Widget dotScreen(int num){
    return Container(
      width: 10.0,
      height: 10.0,
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
      child: FloatingActionButton(
        backgroundColor: widget.number==num? appColor:greyColor,
        heroTag: null,
        elevation: 0,
      ),
    );
  }

  Widget divider(){
    return  Container(
      height: 2,
      margin: EdgeInsets.only(top: 10),
      child: Opacity(
        opacity: 0.76,
        child: Image.asset(
          "images/path-12247.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget widgetWithSeeLess(){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[

                      Container(
                        width: 300,
                        height: 740,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              widget.firstColor,
                              widget.secColor,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 0
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Container(),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height/8, 0, 0),
                        width: 290,
                        height: 770,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 40,
                              margin: EdgeInsets.only(left: 35, right: 33),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "EGP"+widget.priceMonthly,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: primaryText,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 1, top: 15),
                                      child: Text(
                                        "/mo",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: primaryText,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(color: WHITE,),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 1),
                                      child: Text(
                                        "EGP"+widget.priceAnnualy,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: primaryText,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 15),
                                      child: Text(
                                        "/y",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: primaryText,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 19),
                                child: Text(
                                  widget.messagesMonthly+" MESSAGES",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  widget.storage+"G STORAGE",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  widget.sharing+" SHARING",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 220,
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  widget.outboundPatientSharing+" PATIENT SHARING",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Container(
                              margin: EdgeInsets.only(left: 16, top: 10, right: 19),
                              child: Text(
                                widget.viewSharedPatients+" SHARED PATIENT VIEWING",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            divider(),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  widget.pollFeatureMonthly+" POLLS",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Container(
                              height: 40,
                              margin: EdgeInsets.only(left: 9, top: 10, right: 11),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: 254,
                                      child: Text(
                                        widget.messageRetentionAndDeletion,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: primaryText,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            divider(),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "UMEDMI BOT ENABLED WITH "+widget.umedmiBotResponses ,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  widget.callVideoFeature ,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 10,right:4,left:4),
                                child: Text(
                                  "AUTO EVENTS SCHEDULING"+widget.autoScheduler ,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "ADS BLOCKER "+widget.aDSBlocker ,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:12
                            ),
                            Container(
                              decoration: BoxDecoration(
//                                  borderRadius: BorderRadius.all(Radius.circular(60)),
                              ),
                              child: FlatButton(
                                color: WHITE,
                                textColor:  widget.firstColor,
                                child:Center(
                                  child: Text(
                                    "See Less ….",
                                    style: TextStyle(fontSize:14),
                                  ),
                                ),
                                onPressed: (){
                                  setState(() {
                                    widget.seeMore=false;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),

                      Positioned(
                        top: 0,
                        child: Container(
                          width: 180,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                platinumStartColor,
                                platinumEndColor
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
//                                         color: Color.fromARGB(71, 0, 0, 0),
                                offset: Offset(0,0),
                                blurRadius: 0,
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            widget.subscribeData,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: primaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 21,
                              letterSpacing: 0.63,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(
                height: 2,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "SUBSCRIBE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    letterSpacing: 0.72,
                  ),
                ),
              ),

              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .1,
                      left: MediaQuery.of(context).size.width * .42,
                    ),
                  ),
                  dotScreen(1),
                  dotScreen(2),
                  dotScreen(3),
                  dotScreen(4),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget widgetWithSeeMore(){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[

                      Container(
                        width: 300,
                        height: 400,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              widget.firstColor,
                              widget.secColor,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 0
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Container(),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height/8, 0, 0),
                        width: 290,
                        height: 460,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 40,
                              margin: EdgeInsets.only(left: 35, right: 33),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "EGP"+widget.priceMonthly,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: primaryText,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 1, top: 6),
                                      child: Text(
                                        "/mo",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: primaryText,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(color: WHITE,),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 1),
                                      child: Text(
                                        "EGP"+widget.priceAnnualy,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: primaryText,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 6),
                                      child: Text(
                                        "/y",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: primaryText,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 19),
                                child: Text(
                                  widget.messagesMonthly+" MESSAGES",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  widget.storage+"G STORAGE",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  widget.sharing+" SHARING",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 220,
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  widget.outboundPatientSharing+" PATIENT SHARING",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            divider(),
                            Container(
                              margin: EdgeInsets.only(left: 16, top: 10, right: 19),
                              child: Text(
                                widget.viewSharedPatients+" SHARED PATIENT VIEWING",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                                height:12
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(60)),
                              ),
                              child: FlatButton(
                                color: WHITE,
                                textColor: widget.firstColor,
                                child:Center(
                                  child: Text(
                                    "See More ….",
                                    style: TextStyle(fontSize:14),
                                  ),
                                ),
                                onPressed: (){
                                  setState(() {
                                    widget.seeMore=true;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),

                      Positioned(
                        top: 0,
                        child: Container(
                          width: 180,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                platinumStartColor,
                                platinumEndColor
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
//                                         color: Color.fromARGB(71, 0, 0, 0),
                                offset: Offset(0,0),
                                blurRadius: 0,
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            widget.subscribeData,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: primaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 21,
                              letterSpacing: 0.63,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "SUBSCRIBE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    letterSpacing: 0.72,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .1,
                      left: MediaQuery.of(context).size.width * .42,
                    ),
                  ),
                  dotScreen(1),
                  dotScreen(2),
                  dotScreen(3),
                  dotScreen(4),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

