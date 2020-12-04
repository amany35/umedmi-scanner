import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;


Future<dynamic> uploadImage(File imageFile, String url) async {
  Map mapValue;
 // mapValue['text'] = "*Some error happened.. try again later";
  // open a bytestream
  var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  // get file length
  var length = await imageFile.length();

  // string to uri
  var uri = Uri.parse(url);

  // create multipart request
  var request = new http.MultipartRequest("POST", uri);
  // multipart that takes file
  var multipartFile = new http.MultipartFile('Image', stream, length,
      filename: basename(imageFile.path));
  // add file to multipart
  request.files.add(multipartFile);

  http.Response response = await http.Response.fromStream(await request.send());
  print("Result: ${response.statusCode}");
  mapValue = json.decode(response.body);
  return mapValue;

  // send
//  var response = await request.send();
//
//  // listen for response
//  response.stream.transform(utf8.decoder).listen((value) {
//    print("aiIntergrationValue" + value.toString());
//    mapValue['text'] = value;
//  });
 // return mapValue;
}