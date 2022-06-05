// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

import 'package:bank_misr/presentation/resources/assets_manager.dart';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
   required this.title,
   required this.img,
  });

  String title;
  String img;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    title: json["title"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "img": img,
  };
}
List<Category>categories=[
  Category(title: "Courses", img: ImageAssets.coursesPhoto),
  Category(title: "Goals", img: ImageAssets.goalsPhoto),
  Category(title: "Tasks", img: ImageAssets.tasksPhoto)
];