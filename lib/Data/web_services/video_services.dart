import 'package:http/http.dart' as http;

class VideoServices
{
  Future<String> GetAllVideos (String Url)async
  {
    try{
      var response= await http.get(Uri.parse("http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/course/single/629f4f09c1c9b798a0e7ee1a"),headers: <String,String>{"Content-Type": "application/json"});
      return response.body;
    }catch(e)
    {
      return "Error";
    }
  }

}