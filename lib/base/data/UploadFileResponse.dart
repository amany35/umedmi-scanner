import 'package:umedmiscanner/base/data/remote/BaseApiResponse.dart';

class UploadFileResponse extends BaseApiResponse {
  String id;

  UploadFileResponse.fromJson(Map<String, dynamic> json) :super.fromJson(json){
    json.containsKey("id")? this.id = json["id"] : null;
  }

}