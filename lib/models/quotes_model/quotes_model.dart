// To parse this JSON data, do
//
//     final quotableModel = quotableModelFromJson(jsonString);

import 'dart:convert';

QuotableModel quotableModelFromJson(String str) => QuotableModel.fromJson(json.decode(str));

String quotableModelToJson(QuotableModel data) => json.encode(data.toJson());

class QuotableModel {
  String? id;
  String? author;
  String? content;
  List<String>? tags;
  String? authorSlug;
  int? length;
  DateTime? dateAdded;
  DateTime? dateModified;

  QuotableModel({
     this.id,
     this.author,
     this.content,
     this.tags,
     this.authorSlug,
     this.length,
     this.dateAdded,
     this.dateModified,
  });

  factory QuotableModel.fromJson(Map<String, dynamic> json) => QuotableModel(
    id: json["_id"],
    author: json["author"],
    content: json["content"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    authorSlug: json["authorSlug"],
    length: json["length"],
    dateAdded: DateTime.parse(json["dateAdded"]),
    dateModified: DateTime.parse(json["dateModified"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "author": author,
    "content": content,
    "tags": List<dynamic>.from(tags!.map((x) => x)),
    "authorSlug": authorSlug,
    "length": length,
    "dateAdded": "${dateAdded?.year.toString().padLeft(4, '0')}-${dateAdded?.month.toString().padLeft(2, '0')}-${dateAdded?.day.toString().padLeft(2, '0')}",
    "dateModified": "${dateModified?.year.toString().padLeft(4, '0')}-${dateModified?.month.toString().padLeft(2, '0')}-${dateModified?.day.toString().padLeft(2, '0')}",
  };
}
