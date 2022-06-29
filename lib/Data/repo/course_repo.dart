import 'dart:convert';

import 'package:bank_misr/Data/models/Course.dart';
import 'package:bank_misr/Data/web_services/Course_services.dart';



class CourseRepo
{
  final CourseServices _courseServices;

  CourseRepo(this._courseServices);
  ///* Call course Web Service to get all courses
  Future<List<Course>> GetAllCourses(Url)async
  {
    var body = await _courseServices.GetAllCourses(Url);
    var jsonresponse =json.decode(body) ;
    var list=jsonresponse["data"] as List<dynamic>;
    return list.map((e) => Course.fromJson(e)).toList();
  }
}