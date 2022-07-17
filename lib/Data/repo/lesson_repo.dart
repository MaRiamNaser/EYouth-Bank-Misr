import 'dart:convert';

import 'package:bank_misr/Data/models/Lesson.dart';

import '../web_services/lesson_services.dart';

class LessonRepo
{
  final LessonServices _LessonServices;

  LessonRepo(this._LessonServices);
  /// Call Lesson Web Service to assign Data to Lesson Model
  Future<List<Lesson>> GetAllLessons(courseid)async
  {
    var body = await _LessonServices.GetAllLessons(courseid);
    var jsonresponse =json.decode(body);
    var list=jsonresponse["lessons"] as List<dynamic>;
    return list.map((e) => Lesson.fromJson(e)).toList();
  }
}