import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:bank_misr/presentation/courses/coursesView.dart';
import 'package:http/http.dart' as http;

import '../api_links.dart';

class CourseServices
{
  Future<String> GetAllCourses (String Url)async
  {
    try{
      var response= await http.get(Uri.parse(EndPoints().api_getallCourses),headers: <String,String>{"Content-Type": "application/json"});
      return response.body;

    }catch(e)
    {
      return "Error";
    }
  }

}

