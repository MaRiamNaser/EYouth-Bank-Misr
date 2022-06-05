// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

import 'package:bank_misr/presentation/resources/assets_manager.dart';

Video videoFromJson(String str) => Video.fromJson(json.decode(str));

String videoToJson(Video data) => json.encode(data.toJson());

class Video {
  Video({
    required  this.title,
    required this.img,
    required this.period,
    required this.content,
    required this.link,
  });

  String title;
  String img;
  String period;
  String content;
  String link;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    title: json["title"],
    img: json["img"],
    period: json["period"],
    content: json["content"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "img": img,
    "period": period,
    "content": content,
    "link": link,
  };
}
List<Video>videos=[
  Video(title: "Video 1", img: ImageAssets.videoImg1, period: "01:30 mins", content: "", link: ""),
  Video(title: "Video 2", img: ImageAssets.videoImg2, period: "02:00 mins", content: "", link: ""),
  Video(title: "Video 3", img: ImageAssets.videoImg3, period: "03:30 mins", content: "", link: ""),
  Video(title: "Video 4", img: ImageAssets.videoImg4, period: "01:00 mins", content: "", link: ""),
];
