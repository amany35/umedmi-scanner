import 'dart:convert';

import 'package:umedmiscanner/base/data/BlocProvider.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';
import 'package:umedmiscanner/base/data/remote/EndPoint.dart';

import 'model/VerifyPhoneResponse.dart';


class VerifyPhoneBloc extends BlocBase {
  EndPoint<VerifyPhoneResponse> endPoint = EndPoint<VerifyPhoneResponse>();

  VerifyPhoneBloc();

  @override
  void dispose() {}

  void verifyPhoneNumber(String type,String phoneNumber,String verificationCode, Function onSuccess, Function onError) {
    phoneNumber = "2" + phoneNumber;
    endPoint.setMethodType(RequestType.post)
        .callStreamRequest(
        VerifyPhoneURL,
        json.encode({"type":type,"username":phoneNumber,"password":verificationCode}),
            (json) => VerifyPhoneResponse.fromJson(json),
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