import 'package:umedmiscanner/base/data/remote/BaseApiResponse.dart';

import 'SignupMessage.dart';

class SignUpResponse extends BaseApiResponse {
  String data;
  List<String> message;

  SignUpResponse();

  SignUpResponse.fromJson(Map<String, dynamic> json) :super.fromJson(json){
    json.containsKey("data")? this.data = json['data'] :this.data = null;
    if (json['message'] != null) {
      message = new List<String>();
      json['message'].forEach((v) {
        //message.add(new SignupMessage.fromJson(v));
        print("messnn " + v.toString());
      });
    }
    json.containsKey("message")? this.message = json['message'] :this.message = null;
    print(" testmessage " + this.message.toString());
    print(" test " + this.data);
  }


}