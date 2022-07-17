import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? sId;
  String? fullname;
  String? username;
  String? email;
  String image = "";
  int? balance;
  int? age;
  String? role;
  int? points;
  int? rank;
  List<User> children = [];
  String? createdAt;
  String? updatedAt;

  User(
      {this.sId,
      this.fullname,
      this.username,
      this.email,
      required this.image,
      this.balance,
      this.age,
      this.role,
      this.points,
      this.rank,
      required this.children,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
    username = json['username'];
    email = json['email'];
    image=
    json["image"];
    balance = json['balance'];
    age = json['age'];
    role=
    json["role"];
    points=
    json["points"];
    rank=
    json["rank"];
    children=
    List<User>.from(json["children"].map((x) => User.fromJson(x["childData"])));
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullname'] = this.fullname;
    data['username'] = this.username;
    data['email'] = this.email;
    data['balance'] = this.balance;
    data['age'] = this.age;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
