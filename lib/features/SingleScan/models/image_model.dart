import 'dart:io';

class Image_Model{

  final String imageUrl;

  Image_Model({this.imageUrl});

  factory Image_Model.fromJson(Map<String, dynamic> json) {
    return Image_Model(

      imageUrl:json['scannedImage'],

    );
  }


}