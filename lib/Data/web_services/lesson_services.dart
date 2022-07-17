
import 'package:http/http.dart' as http;

import '../api_links.dart';

class LessonServices
{
  Future<String> GetAllLessons (String courseid)async
  {
    try{
      var response= await http.get(Uri.parse(EndPoints().singleCourseLink+courseid),headers: <String,String>{"Content-Type": "application/json"});
      return response.body;

    }catch(e)
    {
      return "Error";
    }
  }

}

