import 'package:bank_misr/Data/api_links.dart';
import 'package:bank_misr/Data/html_request.dart';
import 'package:http/http.dart' as http;

class VideoServices
{
  Future<String> GetAllVideos (String courseid)async
  {
    /// Request from Api to Get Single Course Videos

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