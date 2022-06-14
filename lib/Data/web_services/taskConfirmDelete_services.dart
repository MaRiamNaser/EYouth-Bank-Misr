


import 'dart:io';

import 'package:bank_misr/presentation/tasks/tasks_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../presentation/goals/goals_view.dart';


class taskconfirmDeleteServices
{
  void confirmDelete(String id ,BuildContext context) {
    showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
      title: Text("Delete"),
      content: Text(" Are you sure !?"),
      actions: [
        FlatButton(child: Text("yes"),
          onPressed: () async {
            var response=await  http.delete(Uri.parse('http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/goal/delete/$id'),
                headers: <String,String>{"Content-Type": "application/json",
                  HttpHeaders.authorizationHeader:"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmE1YjMzMDQ2ZGNiZjBkZWVjYzQzNmUiLCJpYXQiOjE2NTUwMjcwODJ9.XdHxFQGF4NGEQik_2V-Qbw5nZaERO8J7KIALYBBwJj8"});
            print(response.statusCode);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> TasksView()));


          }, ),
        FlatButton(onPressed: (){
          Navigator.pop(context);

        }, child: Text("no")),
      ],

    )
    );

  }

}

