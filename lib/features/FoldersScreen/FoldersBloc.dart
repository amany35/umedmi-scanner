import 'dart:convert';

import 'package:umedmiscanner/base/data/BlocProvider.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';
import 'package:umedmiscanner/base/data/remote/EndPoint.dart';

import 'model/FoldersResponse.dart';




class FoldersBloc extends BlocBase {
  EndPoint<FoldersResponse> endPoint = EndPoint<FoldersResponse>();

  FoldersBloc() ;

  @override
  void dispose() {}

  void _gefolders() {
    EndPoint<FoldersResponse> endPoint = EndPoint<FoldersResponse>();
    Map<String,String>param=Map();
    param["\$"+"sort[createdAt]"]="-1";
    Stream stream = Stream.fromFuture(
        endPoint.fetchList(PatientsUrl, (json) =>FoldersResponse.fromJson(json),
            needFormat: false,
            params:param,
            contentType: APPLICATION_JSON,
            hasToken: true
        ));
//    _dataSubscription = stream.listen((data) => _handleResponseSuccess(data));
//    _dataSubscription.onError((error) => _handleResponseError(error));
  }
  void Folders(String userID, Function onSuccess, Function onError) {
    endPoint.setMethodType(RequestType.get).callStreamRequest(
        MyFoldersUrl,
        json.encode({"userID ": userID}), (json) => FoldersResponse.fromJson(json),
        isAuthrized: false)
        .then((stream) {
      stream.listen((data){
        onSuccess(data);
      });
    }).catchError((error) => onError(error));
  }
}