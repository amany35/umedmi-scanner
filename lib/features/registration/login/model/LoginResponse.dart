import 'package:umedmiscanner/base/data/BaseUser.dart';
import 'package:umedmiscanner/base/data/remote/BaseApiResponse.dart';

class LoginResponse extends BaseApiResponse {
    String data;

  LoginResponse.fromJson(Map<String, dynamic> json) :super.fromJson(json){
    json.containsKey("data")? this.data = json['data']:this.data=null;
    print("this ${this.data}");
  }

}