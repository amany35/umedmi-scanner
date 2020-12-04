import 'package:umedmiscanner/base/data/BaseUser.dart';
import 'package:umedmiscanner/base/data/remote/BaseApiResponse.dart';

class NewFolderResponse extends BaseApiResponse {
  BaseUser user;

  NewFolderResponse.fromJson(Map<String, dynamic> json) :super.fromJson(json){
    json.containsKey("data")? this.user = BaseUser.fromJson(json['data']) :BaseUser();
  }

}