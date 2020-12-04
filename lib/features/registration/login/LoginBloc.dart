import 'dart:convert';

import 'package:umedmiscanner/base/data/BlocProvider.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';
import 'package:umedmiscanner/base/data/remote/EndPoint.dart';
import 'model/LoginResponse.dart';


class LoginBloc extends BlocBase {
  EndPoint<LoginResponse> endPoint = EndPoint<LoginResponse>();

  LoginBloc() ;

  @override
  void dispose() {}

  void loginAccount(String userName, String password, Function onSuccess, Function onError) {
    endPoint.setMethodType(RequestType.post).callStreamRequest(
        LoginAction,
        json.encode({"type": "PASSWORD","username": userName, "password": password}), (json) => LoginResponse.fromJson(json),
        isAuthrized: false)
        .then((stream) {
      stream.listen((data){
        onSuccess(data);
        print("success");
      });
    }).catchError((error) => onError(error));
  }
}