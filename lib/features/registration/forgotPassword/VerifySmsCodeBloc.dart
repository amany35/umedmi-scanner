import 'dart:convert';

import 'package:umedmiscanner/base/data/BlocProvider.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';
import 'package:umedmiscanner/base/data/remote/EndPoint.dart';
import 'model/VerifySmsCodeResponse.dart';


class VerifySmsCodeBloc extends BlocBase {
  EndPoint<VerifySmsCodeResponse> endPoint = EndPoint<VerifySmsCodeResponse>();

  VerifySmsCodeBloc() ;

  @override
  void dispose() {}

  void verifyAccount(String phoneNumber, String digitCode, Function onSuccess, Function onError) {
    phoneNumber = "2" + phoneNumber;
    endPoint.setMethodType(RequestType.post).callStreamRequest(
        LoginAction,
        json.encode({"type": "OTP","username": phoneNumber, "password": digitCode}), (json) => VerifySmsCodeResponse.fromJson(json),
        isAuthrized: false)
        .then((stream) {
      stream.listen((data){
        onSuccess(data);
        print("success");
      });
    }).catchError((error) {
      print("error " + error.toString());
      onError(error);
    });
  }
}