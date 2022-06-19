import 'package:bank_misr/Data/api_links.dart';
import 'package:bank_misr/Data/html_request.dart';
import 'package:http/http.dart' as http;

class VideoServices
{
  Future<String> GetAllVideos (String courseid)async
  {
    /// Request from Api to Get Single Course Videos

    try{
      var response= await getRequest(singleCourseLink+courseid) ;
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }

}