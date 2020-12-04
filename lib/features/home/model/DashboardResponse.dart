import 'package:umedmiscanner/base/data/BaseUser.dart';
import 'package:umedmiscanner/base/data/remote/BaseApiResponse.dart';

class DashboardResponse extends BaseApiResponse {
  BaseUser user;

  DashboardResponse.fromJson(Map<String, dynamic> json) :super.fromJson(json){
    json.containsKey("data")? this.user = BaseUser.fromJson(json['data']) :BaseUser();
  }

}