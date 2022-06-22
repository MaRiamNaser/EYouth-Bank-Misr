// To parse this JSON data, do
//
//     final goal = goalFromJson(jsonString);

import 'dart:convert';

Goal goalFromJson(String str) => Goal.fromJson(json.decode(str));

String goalToJson(Goal data) => json.encode(data.toJson());

class Goal {
  Goal({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.checked,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.amount,
  });

  String id;
  String userId;
  String title;
  String description;
  bool checked;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int amount;

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
    id: json["_id"],
    userId: json["userId"],
    title: json["title"],
    description: json["description"],
    checked: json["checked"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    amount: json["amount"]
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "title": title,
    "description": description,
    "checked": checked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "amount": amount
  };
}
