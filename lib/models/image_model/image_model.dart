// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'dart:convert';

ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  String? provider;
  String? license;
  String? terms;
  String? url;
  Size? size;

  ImageModel({
     this.provider,
     this.license,
     this.terms,
     this.url,
     this.size,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    provider: json["provider"],
    license: json["license"],
    terms: json["terms"],
    url: json["url"],
    size: Size.fromJson(json["size"]),
  );

  Map<String, dynamic> toJson() => {
    "provider": provider,
    "license": license,
    "terms": terms,
    "url": url,
    "size": size?.toJson(),
  };
}

class Size {
  String height;
  String width;

  Size({
    required this.height,
    required this.width,
  });

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    height: json["height"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
  };
}
