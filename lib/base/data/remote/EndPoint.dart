import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:network/network.dart' as network;
import 'package:umedmiscanner/base/app/AppConfig.dart';
import 'package:umedmiscanner/contstants/NetworkMessages.dart';


import 'BaseApiResponse.dart';

const APPLICATION_JSON = "application/json";
const APPLICATION_MULTIPART = "multipart/form-data";
const FORM_ENCODED_URL = "application/x-www-form-urlencoded";
const POST = "post";
const GET = "get";
const SUCCESSS = 200;



typedef T Creator<T>(Map<String, dynamic> json);

enum RequestType { get, post, delete, put ,patch }

class EndPoint<T extends BaseApiResponse> {
  String _baseUrl = AppConfig.shared.getBaseUrl();

  Map<String, String> _headers = Map<String, String>();
  RequestType _method_type = RequestType.post;
  bool _isNeedAuth = true;
  static final _client = new http.Client();

  Uri _buildUrl({Map<String, String> params, String function = ""}) {
    ///v2/auth/
    if (params != null) {
      String url = Uri.http(_baseUrl, function, params).toString();
      return Uri.http(_baseUrl, function, params);
    } else {
      String url = Uri.http(_baseUrl, function).toString();
      return Uri.http(_baseUrl, function);
    }
  }

  EndPoint setMethodType(RequestType type) {
    _method_type = type;
    return this;
  }
  _getRequestType() {
    switch (_method_type) {
      case RequestType.post:
        return "post";
      case RequestType.get:
        return "get";
      case RequestType.delete:
        return "delete";
      case RequestType.put:
        return "put";
      case RequestType.patch:
        return "patch";
    }
  }

  EndPoint addHeader(String key, String value) {
    _headers.putIfAbsent(key, () => value);
    return this;
  }

  Map<String, String> _getHeader({String contentType = APPLICATION_JSON}) {
    if (contentType == null || contentType.trim().length == 0)
      contentType = APPLICATION_JSON;
    addHeader("Content-Type", contentType);

    if (_isNeedAuth) {
      addHeader("Authorization", AppConfig.shared.userToken);
      //  addHeader("Authorization", "Bearer " + "");
    }
    return _headers;
  }

//  Future<Stream<UploadFileResponse>> callMultipartRequest(
//      String filePath) async {
//    //
//    _isNeedAuth = true;
//    Uri URI = _buildUrl(function: UploadFilesActionUrl);
//
//    var req = http.MultipartRequest(_getRequestType(),URI);
//
//    req.headers.addAll(_getHeader());
//    if (filePath != null) {
//      req.files.add(
//          await http.MultipartFile.fromPath(
//              'uri',
//              filePath
//          )
//      );
//    }
//    var streamResponse = await _client.send(req);
//    print(streamResponse.toString());
//    if (streamResponse.statusCode-SUCCESSS <= 1) {
//      return streamResponse.stream
//          .transform(utf8.decoder)
//          .transform(json.decoder)
//          .map((map) {
//        return UploadFileResponse.fromJson(map);
//      });
//    }
//    throw CustomException(NetworkMessagesMap[streamResponse.statusCode]);
//  }

  Future<Stream<T>> callStreamRequest(
      String action, String body, Creator<T> responseCreator,
      {Map<String, String> params, bool isAuthrized}) async {
    //
    _isNeedAuth  = isAuthrized;
    // ignore: non_constant_identifier_names
    Uri URI = _buildUrl(function: action, params: params);

    var req = http.Request(_getRequestType(),URI);

    req.headers.addAll(_getHeader());
    if (body != null) {
      req.body = body;
    }
    var streamResponse = await _client.send(req);
    print(streamResponse.toString());
    if (streamResponse.statusCode-SUCCESSS <= 1) {
      return streamResponse.stream
          .transform(utf8.decoder)
          .transform(json.decoder)
          .map((map) {
        return responseCreator(map);
      });
    }
    throw FormatException(NetworkMessagesMap[streamResponse.statusCode]);
  }

  Future<T> fireNetworkRequest<T>(
      String method, String action, Creator<T> responseCreator,
      {Map<String, String> params,
        String function,
        dynamic body,
        Map bodyFields,
        String contentType,
        bool hasToken = false,
        String url}) async {
    Uri URI = _buildUrl(function: action, params: params);
    var request = http.Request(method, URI);
    _isNeedAuth = hasToken;
    request.headers.addAll(_getHeader(contentType: contentType));
    if (method == POST && body != null) {
      // request.body = body;
      final postResponse = await network.post<network.JsonApiResponse>(
          URI.toString(),
          headers: _getHeader(contentType: contentType),
          body: body);

      T apiResponse = responseCreator(postResponse.toMap);
      return apiResponse;
    } else {
      print(request.toString());
      print(request.headers.toString());
      print(request.body.toString());
      var response = await _getResponse(request);
      T apiResponse = responseCreator(response);
      return apiResponse;
    }
  }

  Future<T> fetchList<T extends BaseApiResponse>(
      String action, Creator<T> responseCreator,
      {Map<String, String> params,
        bool needFormat = false,
        RequestType method = RequestType.get,
        String function,
        String bodys,
        Map bodyFields,
        String contentType,
        bool hasToken = false}) async {
    // String url = Uri.http(_baseUrl, action).toString();
    String url = _buildUrl(function: action, params: params).toString();

    //String url="http://healthsolution-env-1.nm3yhp8vpr.us-west-2.elasticbeanstalk.com/posts?"+"\$"+"sort[createdAt]=-1";
    var Response;
    if (method == RequestType.get) {
      Response = await http.get(
        url,
        headers: _getHeader(contentType: contentType),
      );
    } else if (method == RequestType.put && bodys != null) {
      Response = await http.put(
        url,
        headers: _getHeader(contentType: contentType),
        body: bodys,
      );
    }
    if (Response.statusCode-SUCCESSS <= 1) {
      var responseJSON = json.decode(Response.body);
      T apiResponse = responseCreator(responseJSON);
      return apiResponse;
    } else {
      throw CustomException(NetworkMessagesMap[Response.statusCode]);
    }
  }


  Future<Object> _getResponse(http.Request request) async {
    var response = await http.Client().send(request);
    return response.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .first;
  }

  String _getRowBody({Map bodyMap, String rowBody, bool hasToken}) {
    return bodyMap != null ? json.encode(bodyMap) : rowBody;
  }
}
class CustomException implements Exception {
  String cause;
  CustomException(this.cause);
}
