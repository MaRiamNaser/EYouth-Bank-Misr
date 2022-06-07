import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class alertdialog extends StatelessWidget {
  String choice;
  alertdialog(this.choice);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text("Success"),
        content: Text("$choice Has Been Added !"),
        actions: <Widget>[
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]
    );
  }
}
