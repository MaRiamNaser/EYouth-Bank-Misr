
import 'package:http/http.dart' as http;

import '../api_links.dart';

class UserServices
{
  Future<String> GetFirstUsers ()async
  {
    try{
      var response= await http.get(Uri.parse(EndPoints().rankingLink+"?page=0&limit=10"),headers: <String,String>{"Content-Type": "application/json"});
      return response.body;

    }catch(e)
    {
      return "Error";
    }
  }

  Future<String> GetNextUsers (int index)async
  {
    var response;
    try{
       response= await http.get(Uri.parse(EndPoints().rankingLink+"?page=$index&limit=10"),headers: <String,String>{"Content-Type": "application/json"});
      print(response.statusCode);
      return response.body;
    }catch(e)
    {
      print(response.statusCode);
      return "Error";
    }
  }

}

