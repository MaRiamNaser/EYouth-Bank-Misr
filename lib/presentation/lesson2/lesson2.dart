import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bank_misr/Data/models/Lesson.dart';
import 'package:bank_misr/presentation/lesson2/content_of_each_box.dart';
import 'package:bank_misr/presentation/lesson2/small_box.dart';
import 'package:bank_misr/presentation/lesson7/lesson7.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:math';

import '../resources/assets_manager.dart';
import 'alertDialooog.dart';

class SixBoxesGame extends StatefulWidget {
  Lesson lesson;

  SixBoxesGame(this.lesson, {Key? key}) : super(key: key);

  @override
  _SixBoxesGameState createState() => _SixBoxesGameState(lesson);
}

class _SixBoxesGameState extends State<SixBoxesGame> {
  bool isSpeaking = false;
  final TextEditingController _controller = TextEditingController();
  final _flutterTts = FlutterTts();

  //declare the isBack bool
  bool isBack = true;
  double angle = 0;
  Lesson lesson;
  late StateSetter _setState;

  _SixBoxesGameState(this.lesson);

  void initializeTts() {
    _flutterTts.setStartHandler(() {
      setState(() {
        isSpeaking = false;
      });
      _setState(() {});
    });
    _flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = true;
      });
      _setState(() {});
    });
    _flutterTts.setErrorHandler((message) {
      setState(() {
        isSpeaking = false;
      });
    });
    _flutterTts.setSpeechRate(0.4);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initializeTts();

    Timer.run(() {
      showDialogg();
    });
  }

  void speak(String text) async {
    await _flutterTts.speak(text);
  }

  void stop() async {
    await _flutterTts.stop();
    setState(() {
      isSpeaking = false;
    });
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: lesson.game!.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () {
                  speak(lesson.game![index].title);
                },
                onDoubleTap: () {
                  speak(lesson.game![index].des);
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return WillPopScope(
                            onWillPop: ()async{
                          return false;
                        },
                        child: showMyDialog(context, lesson.game![index].title,
                            lesson.game![index].des)
                        );
                      });
                },
                child: Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 15),
                  child: FlipCard(
                    fill: Fill.fillBack,
                    // Fill the back side of the card to make in the same size as the front.
                    flipOnTouch: false,
                    direction: FlipDirection.HORIZONTAL,
                    // default
                    front: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorManager.lightGrey,
                          boxShadow: [
                            new BoxShadow(
                              color: ColorManager.primary,
                              blurRadius: 7.0,
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: index == 0
                                ? Icon(
                                    Icons.done,
                                    color: ColorManager.green,
                                    size: 100,
                                  )
                                : Icon(
                                    Icons.lock,
                                    color: ColorManager.primary,
                                    size: 100,
                                  ),
                          ),
                          Center(child: Text(lesson.game![index].title)),
                        ],
                      ),
                    ),
                    back: Container(),
                  ),
                ),
              );
            }),
      ),
    );
  }
  Widget showMyDialog(BuildContext context, String title, String content)  {
    return AlertDialog(
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            _setState = setState;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: DefaultTextStyle(
                      style: getLightStyle(
                          color: ColorManager.black, fontSize: 20),
                      child: Text(content),
                    ),
                  ),
                  Visibility(
                    visible: isSpeaking,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              stop();
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: SmallBox(
                                    child: Icon(
                                      Icons.close,
                                      size: 32,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }

  void showDialogg() {
    speak(
        "Hello Guys, This system worked pretty nicely, but only sometimes, why? People would occasionally face several issues, we’ll go over the 6 main problems they came across");
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.NO_HEADER,
      body: Column(
        children: [
          DefaultTextStyle(
            style:  TextStyle(fontSize: 40.0, color: ColorManager.primary),
            child: Text(
            "Hello"
            ),
          ),
          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: getLightStyle(color: ColorManager.black, fontSize: 20),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'This system worked pretty nicely, but only sometimes, why? People would occasionally face several issues, we’ll go over the 6 main problems they came across',
                    speed: Duration(milliseconds: 100),
                  ),
                ],
              ),
            ),
          ),
          Container(
              width: 100,
              child: FlatButton(
                  onPressed: () {
                    stop();
                    Navigator.of(context).pop();
                  },
                  child: const Center(child: Text("Next ")))),
        ],
      ),
    ).show();
  }
}
