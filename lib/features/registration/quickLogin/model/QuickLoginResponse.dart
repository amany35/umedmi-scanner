import 'package:umedmiscanner/base/data/BaseUser.dart';
import 'package:umedmiscanner/base/data/remote/BaseApiResponse.dart';

class QuickLoginResponse extends BaseApiResponse {
  String data;

  QuickLoginResponse.fromJson(Map<String, dynamic> json) :super.fromJson(json){
    json.containsKey("data")? this.data = json['data']:this.data=null;
  }

}