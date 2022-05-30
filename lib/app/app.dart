import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {

  MyApp._internal(); // Named constructor.

  static final MyApp _instance = MyApp._internal(); // singleton

  factory MyApp() => _instance; // factory


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Mariam",),
      
    );
  }
}