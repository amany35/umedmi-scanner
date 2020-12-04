class BaseUser {
  String token;
  String refreshToken;
  String sId;
  String phoneNumber;
  String userName;
  String email;
  String password;
  String fourDigits;
  String businessType;

  BaseUser( {this.token,
    this.refreshToken,
    this.sId,
    this.phoneNumber,
    this.userName,
    this.email,
    this.password,
    this.fourDigits,
    this.businessType});

  BaseUser.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
    sId = json['_id'];
    phoneNumber = json['phoneNumber'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    fourDigits = json['fourDigits'];
    businessType = json['businessType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    data['_id'] = this.sId;
    data['phoneNumber'] = this.phoneNumber;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['fourDigits'] = this.fourDigits;
    data['businessType'] = this.businessType;
    return data;
  }
}
