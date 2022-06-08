import 'package:http/http.dart' as http;

class VideoServices
{
  Future<String> GetAllVideos (String Url)async
  {
    try{
      var response= await http.get(Uri.parse("http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/course/single/62a068025abc2b7bcd001005"),headers: <String,String>{"Content-Type": "application/json"});
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }

}