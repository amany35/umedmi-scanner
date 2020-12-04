import 'dart:convert';

import 'package:umedmiscanner/base/data/BlocProvider.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';
import 'package:umedmiscanner/base/data/remote/EndPoint.dart';

import 'model/NewFolderResponse.dart';




class NewFolderBloc extends BlocBase {
  EndPoint<NewFolderResponse> endPoint = EndPoint<NewFolderResponse>();

  NewFolderBloc() ;

  @override
  void dispose() {}

  void NewFolder(String userID, Function onSuccess, Function onError) {
    endPoint.setMethodType(RequestType.post).callStreamRequest(
        NewFolderUrl,
        json.encode({"userID ": userID}), (json) => NewFolderResponse.fromJson(json),
        isAuthrized: false)
        .then((stream) {
      stream.listen((data){
        onSuccess(data);
      });
    }).catchError((error) => onError(error));
  }
}