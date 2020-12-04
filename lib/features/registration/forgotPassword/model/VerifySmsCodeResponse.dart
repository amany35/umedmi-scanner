import 'package:umedmiscanner/base/data/remote/BaseApiResponse.dart';

class VerifySmsCodeResponse extends BaseApiResponse {
  String data;

  VerifySmsCodeResponse.fromJson(Map<String, dynamic> json) :super.fromJson(json){
    json.containsKey("data")? this.data = json['data']:this.data=null;
    print("this ${this.data}");
  }

}