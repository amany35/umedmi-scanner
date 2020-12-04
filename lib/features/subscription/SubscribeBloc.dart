
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:umedmiscanner/base/data/BlocProvider.dart';
import 'package:umedmiscanner/base/data/remote/ApiPaths.dart';
import 'package:umedmiscanner/base/data/remote/EndPoint.dart';
import 'package:umedmiscanner/features/subscription/model/SubscribeResponse.dart';



class SubscribeBloc extends BlocBase {
  BehaviorSubject<SubscribeResponse> subscribeSystem = BehaviorSubject<SubscribeResponse>();
  StreamSubscription _dataSubscription;
  EndPoint<SubscribeResponse> endPoint = EndPoint<SubscribeResponse>();

  SubscribeBloc() {
    _getSubscription();
  }

  @override
  void dispose() {
    _dataSubscription.cancel();
  }

  void _getSubscription() {
    Stream stream = Stream.fromFuture(
        endPoint.fetchList(SubscribeUrl, (json) => SubscribeResponse.fromJson(json),
//            needFormat: false,
//            params:param,
//            contentType: APPLICATION_JSON,
//            hasToken: true
        ));
    _dataSubscription = stream.listen((data) => _handleResponseSuccess(data));
    _dataSubscription.onError((error) => _handleResponseError(error));
  }

  _handleResponseSuccess(SubscribeResponse response) {
    subscribeSystem.add(response);
  }

  _handleResponseError(TypeError error) {
    subscribeSystem.addError(error);
//    print(error.message);
    print(error);
  }
}