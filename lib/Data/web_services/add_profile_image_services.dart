import 'dart:convert';
import 'dart:io';

import 'package:bank_misr/Data/api_links.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';
class add_image_services
{
  Future<http.StreamedResponse> addimage(String token, String path)
  async {
    var headers = {
      'Authorization': token
    };

    var request = http.MultipartRequest('PUT', Uri.parse(AddProfileImageLink));
    request.files.add(await http.MultipartFile.fromPath('image',path));
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  return response;


}
}