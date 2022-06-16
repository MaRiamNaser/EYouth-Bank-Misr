


import 'dart:io';

import 'package:bank_misr/app/app_prefs.dart';
import 'package:bank_misr/presentation/tasks/tasks_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../presentation/goals/goals_view.dart';


class taskconfirmDeleteServices
{
  AppPreferences appPreferences=AppPreferences();
  void confirmDelete(String id ,BuildContext context) {
    // TODO remove this ui and put  to presentation layer , just leave the request to server
     //TODO rename the service and page.
    showDialog(context: context, builder: (BuildContext context1)=>AlertDialog(
      title: Text("Delete"),
      content: Text(" Are you sure !?"),
      actions: [
        FlatButton(child: Text("yes"),
          onPressed: () async {
            var response=await  http.delete(Uri.parse('http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/task/delete/$id'),
                headers: <String,String>{"Content-Type": "application/json",
                  HttpHeaders.authorizationHeader:await appPreferences.getLocalToken()});
            print(response.statusCode);
            Navigator.of(context1).pop();
            Navigator.of(context).pop();
            pushNewScreen(context,
                screen: TasksView(),
                withNavBar: true,
                pageTransitionAnimation:
                PageTransitionAnimation
                    .cupertino);


          }, ),
        FlatButton(onPressed: (){
          Navigator.pop(context);

        }, child: Text("no")),
      ],

    )
    );

  }

}

