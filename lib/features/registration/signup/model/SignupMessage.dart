class SignupMessage {
  List<String> message;

  SignupMessage({this.message});

  SignupMessage.fromJson(Map<String, dynamic> json) {
    message = json['message'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}