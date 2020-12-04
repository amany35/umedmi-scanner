import 'package:umedmiscanner/base/data/remote/BaseApiResponse.dart';

class VerifyPhoneResponse extends BaseApiResponse {
  String data;

  VerifyPhoneResponse.fromJson(Map<String, dynamic> json) :super.fromJson(json){
    json.containsKey("data")? this.data = json['data'] :this.data = null;
    print(" test " + this.data);
  }


}