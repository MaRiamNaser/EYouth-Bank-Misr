import 'package:audioplayers/audioplayers.dart';
import 'package:bank_misr/Data/models/MatcingItem.dart';
import 'package:bank_misr/presentation/addTasksGoals/edit_goal/edit_goal.dart';
import 'package:bank_misr/presentation/matching/Widgets/alert_dialog.dart';
import 'package:bank_misr/presentation/matching/Widgets/image_widgeet.dart';
import 'package:bank_misr/presentation/matching/Widgets/targetTitleWidget.dart';
import 'package:bank_misr/presentation/matching/Widgets/target_description_widget.dart';
import 'package:bank_misr/presentation/matching/Widgets/title_widget.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../Data/models/Lesson.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class MatchingLesson extends StatefulWidget {
  List<MatchingItem>match1=[];
  List<MatchingItem>match2=[];
  Lesson? lesson;
  Level? level;
  MatchingLesson({ this.lesson, this.level})
  {
    if(lesson!=null) {
      this.match1 = List.generate(lesson!.game!.length, (index) =>
          MatchingItem(name: lesson!.game![index].title,
              img: lesson!.game![index].img ,
              value: lesson!.game![index].des,
              imgName: lesson!.game![index].des));
    }
    else
      {
        this.match1 = List.generate(level!.content!.length, (index) =>
          MatchingItem(name: level!.content![index].title!,
              img: "",
              value: level!.content![index].des!,
              imgName: level!.content![index].des!));

      }

    this.match2=match1.toList();
  }

  @override
  _MatchingLessonState createState() => _MatchingLessonState(match1,match2);
}

class _MatchingLessonState extends State<MatchingLesson> {
  late int score;
  late bool gameover;
  MatchingItem? selectedItem;
  List<MatchingItem> items = [];
  List<MatchingItem> items2 = [];
  var player = AudioPlayer();
  var _flutterTts=FlutterTts();
  _MatchingLessonState(List<MatchingItem>match11,List<MatchingItem>match22)
  {
    this.items=match11.toList();
    this.items2=match22.toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    score = 0;
    gameover = false;
    items.shuffle();
    items2.shuffle();
    print(matching1[0].accepting);
    print(items[0].accepting);
  }
  void initializeTts() {
    _flutterTts.setStartHandler(() {
      setState(() {

      });
    });
    _flutterTts.setCompletionHandler(() {
      setState(() {

      });
    });
    _flutterTts.setErrorHandler((message) {
      setState(() {

      });
    });
    _flutterTts.setSpeechRate(0.4);
  }
  void speak(String text) async {
    await _flutterTts.speak(text);
  }

  void stop() async {
    await _flutterTts.stop();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matching"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(11),
                child: Container(
                    height: 90,
                    width: 360,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppSize.s25)),
                        color: ColorManager.darkPrimary),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Try to match From Left to Right :\n \n',
                            style: getSemiBoldStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          TextSpan(
                            text: 'Note : Matching by Click not Drag',
                            style: getRegularStyle(
                                color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    )),
              ),
              ListView.builder(
                padding: EdgeInsets.only(bottom: 15),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        InkWell(
                            onTap: !gameover && items[index].accepting == false
                                ? () {
                              items[index].img.isNotEmpty? speak(items[index].imgName):speak(items[index].name);
                                    setState(() {
                                      items.forEach((element) {
                                        element.chossing = false;
                                      });
                                      items[index].chossing = true;
                                      selectedItem = items[index];
                                    });
                                  }
                                : null,
                            child: items[index].img.isNotEmpty
                                ? ImageWidget(items[index])
                                : TitleWidget(items[index])),
                        Spacer(
                          flex: 2,
                        ),
                        InkWell(
                            onTap: !gameover && selectedItem != null
                                ? () async {
                                    if (selectedItem?.name ==
                                        items2[index].name) {
                                      setState(() {
                                        items2[index].accepting = true;
                                        selectedItem?.accepting = true;
                                        //player.stop();
                                        player.play(
                                            AssetSource("sounds/true.wav"));
                                        selectedItem = null;
                                      });
                                      if (items2.every((element) =>
                                          element.accepting == true)) {
                                        gameover = true;
                                        setState(() {
                                          player.play(AssetSource(
                                              "sounds/success.wav"));
                                        });
                                        await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialogLesson();
                                          },
                                        );
                                        Navigator.of(context).pop();
                                      }
                                    } else {
                                      setState(() {
                                        player.stop();
                                        player.play(
                                            AssetSource("sounds/false.wav"));
                                      });
                                    }
                                  }
                                : null,
                            child: items[index].img.isNotEmpty
                                ?  TargetTitleWidget(items2[index]): TargetDescriptionWidget(items2[index]))
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
