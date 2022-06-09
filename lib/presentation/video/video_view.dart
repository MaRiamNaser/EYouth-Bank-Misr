import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/video/Widgets/description_widget.dart';
import 'package:bank_misr/presentation/video/Widgets/quiz_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../data/models/Video.dart';
import '../resources/values_manager.dart';

class VideoView extends StatefulWidget {
  Video video;
  VideoView(this.video);

  @override
  _VideoViewState createState() => _VideoViewState(video);
}

class _VideoViewState extends State<VideoView> {
  late YoutubePlayerController _ytbPlayerController;
  Video video;
  _VideoViewState(this.video);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _ytbPlayerController = YoutubePlayerController(
          initialVideoId:"-OWR2oyKbf8" ,
          params: YoutubePlayerParams(
            showFullscreenButton: true,
            autoPlay: false,
          ),
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Video Name"),

        ),
        body: Column(children: [
          SizedBox(
            height: 1/825 * screensize.height * AppSize.s14,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child:InkWell(
              onTap: () {
                final _newCode = "-OWR2oyKbf8";
                _ytbPlayerController.load(_newCode);
                _ytbPlayerController.stop();
              },
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child:  YoutubePlayerIFrame(controller: _ytbPlayerController)
              ),
            ),
          )
          ,
          SizedBox(height: 1/825 * screensize.height * AppSize.s20,),
              Description(video.description),
          SizedBox(height: 1/825 * screensize.height * AppSize.s20,),
          Expanded(
            child: QuizWidget(video.quiz),
          )
        ]));
  }
}
