

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/resources/strings_manager.dart';
import '../../api_links.dart';



class taskConfirmEdit {
  Future<String> Edit(String token, String taskID, String title, String description) async {
    if(title.isNotEmpty&&description.isNotEmpty) {
      var response=await http.put(Uri.parse(EndPoints().editTaskLink+taskID),
          headers: <String,String>{"Content-Type": "application/json",

            HttpHeaders.authorizationHeader:token},
          body: jsonEncode(
              <String, String>{
                "title": title,
                "description":description,
              })
      );
      print(response.statusCode.toString()+"\n"+response.body.toString());
      return response.statusCode.toString();
    }
    else{ return "wrong";}
  }}

