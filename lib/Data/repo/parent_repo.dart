import 'dart:convert';

import 'package:bank_misr/Data/web_services/parent_services.dart';

import '../models/User.dart';

class ParentRepo {
  final ParentServices _ParentServices;

  ParentRepo(this._ParentServices);

  /// Call Parent Web Service to assign Data to Parent Model
  Future<User?> SearchKid(token, username) async {
    var body = await _ParentServices.SearchKid(token, username);
    var jsonresponse = json.decode(body);
    var list = jsonresponse["data"];
    return User.fromJson(list);
  }
}