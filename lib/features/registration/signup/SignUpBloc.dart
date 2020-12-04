
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:umedmiscanner/base/app/AppConfig.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';


Future<dynamic> createNewAccount(String businessType,String email, String password,String userName,String phoneNumber,String digits, String socialUserType,String socialUserToken,String socialUserId) async {
  String _baseUrl = AppConfig.shared.getBaseUrl();
  String url = Uri.http(_baseUrl,"").toString();
  phoneNumber = "2" + phoneNumber;
  Map mapValue;
  String myUrl = url+SignUpActionURL;
  print("myUrl " + myUrl);
  try {
    Map<String, dynamic> body;
    if(socialUserType != null)
    body = {
    "type": "business",
    "businessType": businessType,
    "username": userName,
    "phoneNumber": phoneNumber,
    "email": email,
    "password": password,
    "quickLoginPassword": digits,
      "accounttype": socialUserType,
      "accountToken": socialUserToken,
      "accountId": socialUserId
    };
    else
     body = {
      "type": "business",
      "businessType": businessType,
      "username": userName,
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password,
      "quickLoginPassword": digits};

    print("Request: " + body.toString());
    var response = await http.post(myUrl,
        headers: {'Accept': 'application/json'}, body: body);
    mapValue = json.decode(response.body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return mapValue;
  } catch (e) {
    mapValue['message'] = "Server Error";
    return mapValue;
  }
}
