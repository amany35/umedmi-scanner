import 'package:umedmiscanner/base/data/remote/BaseApiResponse.dart';

import 'SavePatient.dart';

class SavePatientResponse extends BaseApiResponse {
  SavePatient savePatient;

  SavePatientResponse.fromJson(Map<String, dynamic> json) :super.fromJson(json){
    json.containsKey("SN")? this.savePatient = SavePatient.fromJson(json) :SavePatient();
  }

}
