import 'package:bank_misr/Data/models/Video.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/video/Widgets/description_widget.dart';
import 'package:bank_misr/presentation/video/Widgets/quiz_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';
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
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _ytbPlayerController = YoutubePlayerController(
          initialVideoId:video.videoLink ,
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
        appBar: AppBar(title: Text(AppStrings.Videos.tr()),  actions: [
          Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  ImageAssets.profilePhoto,
                  fit: BoxFit.fitWidth,
                  width: 45,
                ),
                maxRadius: 34),
          )
        ],),
        // appBar: AppBar(
        //   title: Text("Video Name"),
        //
        // ),
        body: Column(children: [
          SizedBox(
            height: 1/825 * screensize.height * AppSize.s14,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child:InkWell(
              onTap: () {
                final _newCode = video.videoLink;
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
