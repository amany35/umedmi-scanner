

import 'package:umedmiscanner/base/data/BaseUser.dart';

import 'CommonImports.dart';

class AppConfig {
  static final AppConfig shared = AppConfig._internal();
  ConnectivityResult _connectionStatus = ConnectivityResult.mobile;
  BaseUser currentUser = BaseUser();
  String userToken;

  AppConfig._internal() {}
  String getBaseUrl() {
    return "3.23.193.79:8000";
  }
  String getImageBaseUrl() {
    return  "http://3.23.193.79:8000";
  }
  void setConnection(ConnectivityResult status) {
    this._connectionStatus = status;
  }

  ConnectivityResult getConnectionStatus() {
    return _connectionStatus;
  }

  void setUserData(BaseUser user) {
    this.currentUser = user;
  }

  void setUserToken(String accessToken) {
    this.userToken = accessToken;


  }
}
