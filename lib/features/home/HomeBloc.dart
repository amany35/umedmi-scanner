import 'dart:convert';

import 'package:umedmiscanner/base/data/BlocProvider.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';
import 'package:umedmiscanner/base/data/remote/EndPoint.dart';

import 'model/DashboardResponse.dart';



class HomeBloc extends BlocBase {
  EndPoint<DashboardResponse> endPoint = EndPoint<DashboardResponse>();

  HomeBloc() ;

  @override
  void dispose() {}
  void _getDashboard() {
    EndPoint<DashboardResponse> endPoint = EndPoint<DashboardResponse>();
    Map<String,String>param=Map();
    param["\$"+"sort[createdAt]"]="-1";
    Stream stream = Stream.fromFuture(
        endPoint.fetchList(DashBoardUrl, (json) =>DashboardResponse.fromJson(json),
            needFormat: false,
            params:param,
            contentType: APPLICATION_JSON,
            hasToken: true
        ));
//    _dataSubscription = stream.listen((data) => _handleResponseSuccess(data));
//    _dataSubscription.onError((error) => _handleResponseError(error));
  }
  void Dashboard(String userID, Function onSuccess, Function onError) {
    endPoint.setMethodType(RequestType.get).callStreamRequest(
        DashBoardUrl,
        json.encode({"userID ": userID}), (json) => DashboardResponse.fromJson(json),
        isAuthrized: false)
        .then((stream) {
      stream.listen((data){
        onSuccess(data);
      });
    }).catchError((error) => onError(error));
  }
}