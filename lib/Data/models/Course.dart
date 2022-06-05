// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

import 'package:bank_misr/Data/models/Video.dart';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  Course({
    required this.title,
    required this.img,
    required this.videos,
  });

  String title;
  String img;
  List<Video> videos;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    title: json["title"],
    img: json["img"],
    videos: List<Video>.from(json["videos"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "img": img,
    "videos": List<Video>.from(videos.map((x) => x)),
  };
}
