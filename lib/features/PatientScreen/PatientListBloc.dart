import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:umedmiscanner/base/app/AppConfig.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';

Future<dynamic> getPatientListBloc() async {
  String _baseUrl = AppConfig.shared.getBaseUrl();
  String url = Uri.http(_baseUrl,"").toString();
  String myUrl = url+PatientsUrl;
  Map mapValue;
  print("PatientListUrl " + myUrl);
  try {
    print("Authorization: " + AppConfig.shared.userToken.toString());
    var response = await http.patch(myUrl,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': AppConfig.shared.userToken});
    mapValue = json.decode(response.body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print("mapValue" + mapValue.toString());
    return mapValue;
  } catch (e) {
    return "Server Error";
  }
}