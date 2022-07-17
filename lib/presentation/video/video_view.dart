import 'package:bank_misr/Data/models/Quiz.dart';
import 'package:bank_misr/Data/models/Video.dart';
import 'package:bank_misr/Data/web_services/add_profile_image_services.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/video/Widgets/description_widget.dart';
import 'package:bank_misr/presentation/video/Widgets/quiz_widget.dart';
import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../Data/models/Lesson.dart';
import '../matching/Widgets/alert_dialog.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class VideoView extends StatefulWidget {
  Lesson lesson;

  VideoView(this.lesson);

  @override
  _VideoViewState createState() => _VideoViewState(lesson);
}

class _VideoViewState extends State<VideoView> {
  late BetterPlayerController betterPlayerController;
  Lesson lesson;
  var visable=false;
  _VideoViewState(this.lesson);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(lesson.video);
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        lesson.video);
    betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
            controlsConfiguration: BetterPlayerControlsConfiguration(
              enableProgressBarDrag: false,
              enableSkips: false,
              enableOverflowMenu: false,
                controlBarColor: Colors.black26
            )
        ),
        betterPlayerDataSource: betterPlayerDataSource
    );
    betterPlayerController.videoPlayerController?.addListener(checkend);

  }
  checkend()
  async {
    var time=await betterPlayerController.videoPlayerController!.position;
    print("yes"+betterPlayerController.videoPlayerController!.value.duration.toString()
        +time.toString());
    if(betterPlayerController.videoPlayerController!.value.duration! < time!)
      {
        showDialog(context: context, builder: (BuildContext context) { return AlertDialogLesson(); }, );
      }
  }
  @override
  void dispose() {
    betterPlayerController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    checkend();
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(lesson.title),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    ImageAssets.profilePhoto,
                    fit: BoxFit.fitWidth,
                    width: 45,
                  ),
                  maxRadius: 34),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 1 / 825 * screensize.height * AppSize.s14,
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(
                controller: betterPlayerController,
              ),
            )
          ,
            SizedBox(
              height: 1 / 825 * screensize.height * AppSize.s20,
            ),
            Description(lesson.description),
            SizedBox(
              height: 1 / 825 * screensize.height * AppSize.s20,
            ),
            Container(
              child: QuizWidget(Quizz(head: "What is Egypt Currency", answer: "EGP", options: [
                "Euro","EGP","Dollar"
              ])),
            ),
          ]),
        ));
  }
}
