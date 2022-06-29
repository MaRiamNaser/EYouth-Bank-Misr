// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

import 'package:bank_misr/Data/models/Quiz.dart';
import 'package:flutter/cupertino.dart';


class Video {
  /// Video Model
  Video({
    required this.id,
     required this.title,
    required this.widget
  });

  String id;
  String title;
  Widget widget;
}
