


import 'dart:io';

import 'package:bank_misr/app/app_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../presentation/goals/goals_view.dart';


class confirmDeleteServices
{ AppPreferences appPreferences=AppPreferences();
     // TODO remove this ui and put  to presentation layer , just leave the request to server
     //TODO rename the service and page.
  void confirmDelete(String id ,BuildContext context) {
    showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
      title: Text("Delete"),
      content: Text(" Are you sure !?"),
      actions: [
        FlatButton(child: Text("yes"),
          onPressed: () async {
            var response=await  http.delete(Uri.parse('http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/goal/delete/$id'),
                headers: <String,String>{"Content-Type": "application/json",
                  HttpHeaders.authorizationHeader:await appPreferences.getLocalToken() });
            print(response.statusCode);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Goalsview()));


          }, ),
        FlatButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("no")),
      ],

    )
    );

  }

}

