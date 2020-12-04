
class BaseApiResponse {
  int statusCode;
//  String message;
  String error;
//  BaseUser user;
  // String data;
  BaseApiResponse({this.statusCode, this.error});

  BaseApiResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    error = json['error'];
//    message = json['message'];
//    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
//    data['message'] = this.message;
//    if (this.data != null) {
//      data['data'] = this.data;
//    }
    data['error'] = this.error;
    return data;
  }
}
