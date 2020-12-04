import 'package:umedmiscanner/base/app/CommonImports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umedmiscanner/common/NoDataAvaliable.dart';

import 'SubscribeBloc.dart';
import 'common/SubscribeWidget.dart';
import 'model/SubscribeResponse.dart';


class SilverScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SilverScreenState();
  }
}

class _SilverScreenState extends State<SilverScreen> {
  SubscribeBloc _subscribeBloc;


  @override
  void initState() {
    super.initState();
    _subscribeBloc = new SubscribeBloc();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SilverWidget(),
    );
  }

  Widget SilverWidget(){
    return StreamBuilder<SubscribeResponse>(
        stream:_subscribeBloc.subscribeSystem,
        builder: (BuildContext context, AsyncSnapshot<SubscribeResponse> snapshot) {

          if (snapshot.hasData && snapshot.data.sData != null) {
            if (snapshot.data.sData.isNotEmpty) {
              for(int i=0;i<snapshot.data.sData.length;i++){
                if(snapshot.data.sData[i].type=="silver"){
                  return SubscribeWidget(firstColor: SilverEndColor,secColor: SilverStartColor,priceMonthly: snapshot.data.sData[i].priceMonthly.toString(),
                    priceAnnualy:  snapshot.data.sData[i].priceAnnualy.toString(),messagesMonthly: snapshot.data.sData[i].messagesMonthly,
                    storage: snapshot.data.sData[i].storage.toString(),sharing: snapshot.data.sData[i].sharing,outboundPatientSharing:snapshot.data.sData[i].outboundPatientSharing,
                    viewSharedPatients:snapshot.data.sData[i].viewSharedPatients,pollFeatureMonthly: snapshot.data.sData[i].pollFeatureMonthly,
                    messageRetentionAndDeletion:snapshot.data.sData[i].messageRetentionAndDeletion,umedmiBotResponses: snapshot.data.sData[i].umedmiBotResponses,
                    callVideoFeature:snapshot.data.sData[i].callVideoFeature,autoScheduler:snapshot.data.sData[i].autoScheduler,
                    aDSBlocker:snapshot.data.sData[i].aDSBlocker.toString(),number: 4,subscribeData:"SILVER",
                  );
                }
              }
            } else {
              return _noDataAvailable();
            }
          }
          if(snapshot.hasError){
            return _noDataAvailable();
          }
          return Center(child: Text("Loading"));
        });
  }

  Widget _noDataAvailable(){
    return NoDataAvailable(
      message: "No Data Available",
    );
  }
}
