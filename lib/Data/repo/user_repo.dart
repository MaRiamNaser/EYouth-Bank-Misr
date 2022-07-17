import 'dart:convert';

import 'package:bank_misr/Data/models/User.dart';

import '../web_services/User_services.dart';

class UserRepo
{
  final UserServices _UserServices;

  UserRepo(this._UserServices);
  /// Call User Web Service to assign Data to User Model
  Future<List<User>> GetFirstUsers()async
  {
    var body = await _UserServices.GetFirstUsers();
    var jsonresponse =json.decode(body);
    var list=jsonresponse["data"] as List<dynamic>;
    return list.map((e) => User.fromJson(e)).toList();
  }
  Future<List<User>> GetNextUsers(int index)async
  {
    var body = await _UserServices.GetNextUsers(index);
    var jsonresponse =json.decode(body);
    var list=jsonresponse["data"] as List<dynamic>;
    return list.map((e) => User.fromJson(e)).toList();
  }
}