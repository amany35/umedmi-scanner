import 'dart:convert';

import 'package:umedmiscanner/base/data/BlocProvider.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';
import 'package:umedmiscanner/base/data/remote/EndPoint.dart';
import 'model/SharedPatientResponse.dart';



class SharedPatientBloc extends BlocBase {
  EndPoint<SharedPatientResponse> endPoint = EndPoint<SharedPatientResponse>();

  SharedPatientBloc() ;

  @override
  void dispose() {}

  void _getsharedPatient() {
    EndPoint<SharedPatientResponse> endPoint = EndPoint<SharedPatientResponse>();
    Map<String,String>param=Map();
    param["\$"+"sort[createdAt]"]="-1";
    Stream stream = Stream.fromFuture(
        endPoint.fetchList(SharedPatientsUrl, (json) =>SharedPatientResponse.fromJson(json),
            needFormat: false,
            params:param,
            contentType: APPLICATION_JSON,
            hasToken: true
        ));
//    _dataSubscription = stream.listen((data) => _handleResponseSuccess(data));
//    _dataSubscription.onError((error) => _handleResponseError(error));
  }

  void SharedPatients(String userID, Function onSuccess, Function onError) {
    endPoint.setMethodType(RequestType.get).callStreamRequest(
        SharedPatientsUrl,
        json.encode({"userID ": userID}), (json) => SharedPatientResponse.fromJson(json),
        isAuthrized: false)
        .then((stream) {
      stream.listen((data){
        onSuccess(data);
      });
    }).catchError((error) => onError(error));
  }
}