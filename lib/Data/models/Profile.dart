// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.id,
    required this.fullname,
    required this.username,
    required this.email,
    required this.balance,
    required this.age,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  String id;
  String fullname;
  String username;
  String email;
  int balance;
  int age;
  DateTime createdAt;
  DateTime updatedAt;
  String image;
  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["_id"],
    fullname: json["fullname"],
    username: json["username"],
    email: json["email"],
    balance: json["balance"],
    age: json["age"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"])
    , image: json["image"],

  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullname": fullname,
    "username": username,
    "email": email,
    "balance": balance,
    "age": age,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    'image':image
  };
}
