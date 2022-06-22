

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/addTasksGoals/Widgets/alert_dialog.dart';
import '../../../presentation/addTasksGoals/edit_goal/edit_goal.dart';

class goalConfirmEdit {
  Future<String> Edit(String token, String goalID, String title, String description) async {
    if(title.isNotEmpty&&description.isNotEmpty) {
      var response=await http.put(Uri.parse('http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/goal/edit/$goalID'),
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

