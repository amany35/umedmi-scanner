import 'dart:convert';

import 'package:umedmiscanner/base/data/BlocProvider.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';
import 'package:umedmiscanner/base/data/remote/EndPoint.dart';
import 'package:umedmiscanner/features/registration/quickLogin/model/QuickLoginResponse.dart';



class QuickLoginBloc extends BlocBase {
  EndPoint<QuickLoginResponse> endPoint = EndPoint<QuickLoginResponse>();

  QuickLoginBloc() ;

  @override
  void dispose() {}

  void quickLoginAccount(String userName, String sixDigits, Function onSuccess, Function onError) {
    endPoint.setMethodType(RequestType.post).callStreamRequest(
        QuickLoginActionUrl,
        json.encode({"type": "PASSWORD","username": userName, "password": sixDigits}), (json) => QuickLoginResponse.fromJson(json),
        isAuthrized: false)
        .then((stream) {
      stream.listen((data){
        onSuccess(data);
      });
    }).catchError((error) => onError(error));
  }
}