import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:umedmiscanner/base/app/AppConfig.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';


Future<dynamic> forgotPasswordSmsBloc(String phoneNumber) async {
  String _baseUrl = AppConfig.shared.getBaseUrl();
  String url = Uri.http(_baseUrl,"").toString();
  String myUrl = url+ForgotPasswordURL;
  Map mapValue;
  print("myUrl " + myUrl);
  phoneNumber = "2" + phoneNumber;
  try {
    Map<String, String> body = {"phoneNumber": phoneNumber};
    print("Request: " + body.toString());
    var response = await http.post(myUrl,
        headers: {'Accept': 'application/json'}, body: body);
    mapValue = json.decode(response.body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
   return mapValue;
  } catch (e) {
    return "Server Error";
  }
}