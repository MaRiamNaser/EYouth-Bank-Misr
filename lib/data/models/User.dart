
class User {
  String? sId;
  String? fullname;
  String? username;
  String? email;
  int? balance;
  int? age;
  String? createdAt;
  String? updatedAt;

  User(
      {this.sId,
      this.fullname,
      this.username,
      this.email,
      this.balance,
      this.age,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
    username = json['username'];
    email = json['email'];
    balance = json['balance'];
    age = json['age'];
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