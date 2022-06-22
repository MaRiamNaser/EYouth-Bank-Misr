import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<http.Response> getRequest(String Url,{String token=""})async {
 var response =await http.get(Uri.parse(Url),
      headers: <String, String>{"Content-Type": "application/json",HttpHeaders.authorizationHeader:token});
 return response;
}

Future<http.Response> postRequest(String Url, String jsonEncode,String token)async {
  var response =await http.post(Uri.parse
    (Url),
      headers: <String, String>{
        "Content-Type": "application/json",
        HttpHeaders
            .authorizationHeader: token
      }
      , body: jsonEncode);
  return response;
}
Future<http.Response> putRequest(String Url, String jsonEncode,String token)async {
  var response =await http.put(Uri.parse
    (Url),
      headers: <String, String>{
        "Content-Type": "application/json",
        HttpHeaders
            .authorizationHeader: token
      }
      , body: jsonEncode);
  return response;
}

Future<http.Response> deleteRequest(String Url,{String id=""})async {
  var response =await http.delete(Uri.parse(Url),
      headers: <String, String>{"Content-Type": "application/json",HttpHeaders.authorizationHeader:id});
  return response;
}
