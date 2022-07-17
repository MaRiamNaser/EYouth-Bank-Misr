import 'dart:convert';

import 'package:bank_misr/Data/models/User.dart';
import 'package:bank_misr/Data/web_services/balance_services.dart';

import '../models/Profile.dart';
import '../web_services/add_profile_image_services.dart';
import '../web_services/profile_services.dart';

class ProfileRepo {
  final ProfileServices _ProfileServices;

  ProfileRepo(this._ProfileServices);
  /// Call Profile Web Service to assign Data to Profile Model
  Future<User> GetProfile(token, String userid) async {
    var body = await _ProfileServices.GetProfile(token,userid);
    var jsonresponse = json.decode(body);
    var list = jsonresponse["data"];
    //print(list.toString());
    return User.fromJson(list);
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
  Future<User?> SearchKid(token, username) async {
    var body = await _ProfileServices.SearchKid(token, username);
    if(body!="Error") {
      var jsonresponse = json.decode(body);
      var list = jsonresponse["data"];
      var apiStatus = jsonresponse["apiStatus"];
      if(apiStatus)
        {
          return User.fromJson(list);

        }
      else
        {
          return null;
        }
    }
    else
      {
        return null;
      }
  }

  Future<bool> AddKid(token, username,String parentid) async {
    var body = await _ProfileServices.AddKid(token, username, parentid);
    if(body!="Error") {
      var jsonresponse = json.decode(body);
      var list = jsonresponse["data"];
      var apiStatus = jsonresponse["apiStatus"];
      if(apiStatus)
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    else
    {
      return false;
    }
  }

}