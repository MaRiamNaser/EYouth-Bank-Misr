import 'package:bank_misr/app/app.dart';
import 'package:bank_misr/business_logic/registerationProvider/registeration_logic.dart';
import 'package:bank_misr/presentation/resources/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

void main() async{

  WidgetsFlutterBinding?.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp( 
    
  
      EasyLocalization(
      child: Phoenix(child: MyApp()),
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSET_PATH_LOCALISATIONS)
      );
}



