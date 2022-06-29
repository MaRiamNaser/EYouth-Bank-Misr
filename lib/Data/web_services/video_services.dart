import 'package:bank_misr/Data/api_links.dart';
import 'package:bank_misr/Data/html_request.dart';
import 'package:http/http.dart' as http;

class VideoServices
{
  ///*Request from Api to Get Single Course Videos
  Future<String> GetAllVideos (String courseid)async
  {
    EndPoints endPoints=EndPoints();
    try{
      var response= await getRequest(endPoints.singleCourseLink+courseid) ;
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }

}