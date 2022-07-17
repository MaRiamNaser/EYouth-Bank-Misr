import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  final String apiUrl;

  AppConfig({required this.apiUrl});

  static Future<AppConfig> GetApiBaseLink(String env) async {
    env = env.isEmpty ?'dev':env;
    final contents = await rootBundle.loadString(
      'assets/config/$env.json',
    );
    final json = jsonDecode(contents);
    return AppConfig(apiUrl: json['apiUrl']);
  }
}