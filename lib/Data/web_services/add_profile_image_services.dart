import 'dart:convert';
import 'dart:io';

import 'package:bank_misr/Data/api_links.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';
class add_image_services
{
  Upload(File imageFile) async {
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();

    var uri = Uri.parse(baseLink+'user/image');

    var request = new http.MultipartRequest("PUT", uri);
    var multipartFile = new http.MultipartFile('image', stream, length,
        filename: basename(imageFile.path));
    //contentType: new MediaType('image', 'png'));
    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  Future<bool> addimage(String image)
  async {
    var sharedprefernce=await SharedPreferences.getInstance();
    String token= sharedprefernce.getString("token")!;
    var headers = {
      'Authorization': token
    };

    var request = http.MultipartRequest('PUT', Uri.parse(baseLink+'user/image'));
    request.files.add(await http.MultipartFile.fromPath('image',image));
  request.headers.addAll(headers);
//image.readAsBytes().asStream(), image.lengthSync(), filename: image.path.split('/').last)
    http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
  return true;
  }
    else {
  return false;
  }
}
}