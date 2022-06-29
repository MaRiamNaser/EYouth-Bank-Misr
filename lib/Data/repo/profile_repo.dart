import 'dart:convert';

import 'package:bank_misr/Data/web_services/balance_services.dart';

import '../models/Profile.dart';
import '../web_services/add_profile_image_services.dart';
import '../web_services/profile_services.dart';

class ProfileRepo {
  final ProfileServices _ProfileServices;

  ProfileRepo(this._ProfileServices);
  /// Call Profile Web Service to assign Data to Profile Model
  Future<Profile> GetProfile(token) async {


    var body = await _ProfileServices.GetProfile(token);
    var jsonresponse = json.decode(body);
    var list = jsonresponse["data"];
    return Profile.fromJson(list);
  }
  /// Call Profile Web Service to assign Data to Profile Model
  Future<bool> AddProfilePicture(token ,String path) async {
    var response = await add_image_services().addimage(token,path);
    if (response.statusCode == 200) {
      return true;
    }
    else {
      return false;
    }
  }
  /// Call Profile Web Service to assign Data to Profile Model
  Future<bool> EditBalance(token ,int amount) async {
    var response = await balanceServices().EditBalance(token, amount);
    if (response == "200") {
      return true;
    }
    else {
      return false;
    }
  }

}