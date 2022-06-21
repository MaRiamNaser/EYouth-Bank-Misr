import 'dart:convert';

import 'package:bank_misr/Data/web_services/balance_services.dart';

import '../models/Profile.dart';
import '../web_services/add_profile_image_services.dart';
import '../web_services/profile_services.dart';

class ProfileRepo {
  final ProfileServices _ProfileServices;

  ProfileRepo(this._ProfileServices);

  Future<Profile> GetProfile(token) async {
    /// Call Profile Web Service to assign Data to Profile Model

    var body = await _ProfileServices.GetProfile(token);
    var jsonresponse = json.decode(body);
    var list = jsonresponse["data"];
    return Profile.fromJson(list);
  }

  Future<bool> AddProfilePicture(token ,String path) async {
    /// Call Profile Web Service to assign Data to Profile Model
    var response = await add_image_services().addimage(token,path);
    if (response.statusCode == 200) {
      return true;
    }
    else {
      return false;
    }
  }
  Future<bool> EditBalance(token ,int amount) async {
    /// Call Profile Web Service to assign Data to Profile Model
    var response = await balanceServices().EditBalance(token, amount);
    if (response == "200") {
      return true;
    }
    else {
      return false;
    }
  }

}