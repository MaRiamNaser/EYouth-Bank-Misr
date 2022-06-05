import 'package:bank_misr/app/app.dart';
import 'package:bank_misr/business_logic/registeration/registeration_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider<RegisterationProvider>(
      create: (context) =>
        RegisterationProvider(),
    ),
   
  ], child: MyApp()));
}
