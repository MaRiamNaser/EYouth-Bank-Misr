// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  Task({
   required this.id,
    required this.userId,
    required this.title,
    required this.checked,
    required   this.description,
    required    this.createdAt,
    required   this.updatedAt,
    required   this.v,
  });

  String id;
  String userId;
  String title;
  bool checked;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["_id"],
    userId: json["userId"],
    title: json["title"],
    checked: json["checked"],
    description: json["description"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "title": title,
    "checked": checked,
    "description": description,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
