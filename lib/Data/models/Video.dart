// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

Video videoFromJson(String str) => Video.fromJson(json.decode(str));

String videoToJson(Video data) => json.encode(data.toJson());

class Video {
  Video({
    required this.id,
     required this.title,
    required  this.description,
    required  this.courseId,
    required  this.image,
    required  this.createdAt,
    required  this.updatedAt,
    required  this.v,
  });

  String id;
  String title;
  String description;
  String courseId;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    courseId: json["courseId"],
    image: json["image"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "courseId": courseId,
    "image": image,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
