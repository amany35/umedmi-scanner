import 'package:umedmiscanner/base/data/remote/BaseApiResponse.dart';

import 'SubscribeModel.dart';

class SubscribeResponse extends BaseApiResponse  {
  List<Data> sData;

  SubscribeResponse.fromJson(Map<String, dynamic> json) :super.fromJson(json){
    if (json['data'] != null) {
      sData = new List<Data>();
      json['data'].forEach((v) {
        sData.add(new Data.fromJson(v));
      });
    }
  }

}

