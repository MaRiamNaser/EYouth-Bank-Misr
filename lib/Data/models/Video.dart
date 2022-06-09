// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

import 'package:bank_misr/Data/models/Quiz.dart';


Video videoFromJson(String str) => Video.fromJson(json.decode(str));

String videoToJson(Video data) => json.encode(data.toJson());

class Video {
  Video({
    required this.id,
     required this.title,
    required  this.description,
    required  this.courseId,
    required  this.image,
    required this.quiz,
    required  this.createdAt,
    required  this.updatedAt,
    required  this.v,
    required this.videoLink

  });

  String id;
  String title;
  String description;
  String courseId;
  String image;
  Quiz quiz;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String videoLink;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    courseId: json["courseId"],
    image: json["image"],
      quiz: Quiz.fromJson(json["quiz"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    videoLink: json["videoLink"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "courseId": courseId,
    "image": image,
    "quiz": quiz.toJson(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "videoLink": videoLink,
  };
}
