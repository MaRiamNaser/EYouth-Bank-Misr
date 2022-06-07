// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  Course({
    required  this.id,
    required  this.title,
    required  this.description,
    required  this.image,
    required  this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String title;
  String description;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "image": image,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
