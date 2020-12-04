
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:umedmiscanner/base/app/AppConfig.dart';
import 'package:umedmiscanner/base/data/BlocProvider.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';
import 'package:umedmiscanner/base/data/remote/EndPoint.dart';
import 'model/SavePatient.dart';
import 'model/SavePatientResponse.dart';


class SavePatientBloc extends BlocBase {
  EndPoint<SavePatientResponse> endPoint = EndPoint<SavePatientResponse>();

  SavePatientBloc() ;

  @override
  void dispose() {}
  Future<SavePatient> savePatient(String address, String birthDate,String cityArabic, String cityEnglish,String encryption, String fullNameArabic,
      String fullNameEnglish, String genderArabic, String genderEnglish, String id,String idCardExpiration, String idValidity,
      String jobArabic, String jobEnglish,String mainBirthPlaceArabic, String mainBirthPlaceEnglish, String maritalStatusArabic, String maritalStatusEnglish,
      String nationality, String profileImage, String religionArabic, String religionEnglish,String ssn,Function onSuccess, Function onError) async {
    String _baseUrl = AppConfig.shared.getBaseUrl();
    String url = Uri.http(_baseUrl,"").toString();
    String myUrl = url+SavePatientURL;
    final http.Response response = await http.post(
      myUrl,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer ${AppConfig.shared.userToken}',
      },
      body: jsonEncode(<String, String>{
        "address":address,
        "birthDate": birthDate,
        "cityArabic": cityArabic,
        "cityEnglish": cityEnglish,
        "encryption": encryption,
        "fullNameArabic": fullNameArabic,
        "fullNameEnglish": fullNameEnglish,
        "genderArabic": genderArabic,
        "genderEnglish":genderEnglish,
        "id": id,
        "idCardExpiration": idCardExpiration,
        "idValidity": idValidity,
        "jobArabic": jobArabic,
        "jobEnglish": jobEnglish,
        "mainBirthPlaceArabic": mainBirthPlaceArabic,
        "mainBirthPlaceEnglish": mainBirthPlaceEnglish,
        "maritalStatusArabic": maritalStatusArabic,
        "maritalStatusEnglish": maritalStatusEnglish,
        "nationality": nationality,
        "profileImage": profileImage,
        "religionArabic": religionArabic,
        "religionEnglish": religionEnglish,
        "ssn": ssn
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      onSuccess(response.body);
      print(response.body);



      return SavePatient.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Save Patient');
    }
  }
}