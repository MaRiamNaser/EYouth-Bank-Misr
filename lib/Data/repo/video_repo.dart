import 'dart:convert';

import 'package:bank_misr/Data/models/Video.dart';
import 'package:bank_misr/Data/web_services/video_services.dart';



class VideoRepo
{
  final VideoServices _videoServices;

  VideoRepo(this._videoServices);

  Future<List<Video>> GetAllVideos(Url)async
  {
    var body = await _videoServices.GetAllVideos(Url);
    var jsonresponse =json.decode(body);
    var list=jsonresponse["videos"] as List<dynamic>;
    return list.map((e) => Video.fromJson(e)).toList();
  }
}