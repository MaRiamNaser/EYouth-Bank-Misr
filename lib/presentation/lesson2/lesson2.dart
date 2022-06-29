import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bank_misr/presentation/lesson2/content_of_each_box.dart';
import 'package:bank_misr/presentation/lesson2/small_box.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:math';

import '../resources/assets_manager.dart';

List<String> titles = [
  "First Problem",
  "Second Problem",
  "Third Problem",
  "Fourth Problem",
  "Fifth Problem",
  "sixth Problem",
];
List<String> contents = [
  "was the lack of double coincidence of wants, but what does it even mean?Double coincidence of wants means that what side A wants side B haves, and what side B wants, Side A haves. So both sides have to want what the otherside offers. The fulfillment of their needs/wants is called Double coincidence of wantsThe lack of double coincidence of wants happens when any of these factors are missing, like if Side Awas a farmer and he wanted a Chair from the Side B who is a Carpenter, but the carpenter doesn’t want any of the farmer’s crops, he wants iron equipment, but Side A (The farmer) doesn’t have that and won’t be able to satisfy his needs, so the barter exchange won’t work out."
];
int index = 0;


class SixBoxesGame extends StatefulWidget {
  const SixBoxesGame({Key? key}) : super(key: key);

  @override
  _SixBoxesGameState createState() => _SixBoxesGameState();
}

class _SixBoxesGameState extends State<SixBoxesGame> {
  bool isSpeaking = false;
  final TextEditingController _controller = TextEditingController();
  final _flutterTts = FlutterTts();
  //declare the isBack bool
  bool isBack = true;
  double angle = 0;

  void initializeTts() {
    _flutterTts.setStartHandler(() {
      setState(() {
        isSpeaking = true;
      });
    });
    _flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
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
      showDialog();
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
          title: Text("Lesson 2"),
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
        margin: EdgeInsets.only(top: 10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: titles.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () {
                  speak(titles[index]);
                },
                onDoubleTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContentOfEachBox(
                            titles[index], contents[0], index)),
                  );
                },
                child: Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  child: FlipCard(
                    fill: Fill
                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                    flipOnTouch: false,
                    direction: FlipDirection.HORIZONTAL, // default
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
                          Center(child: Text(titles[index])),
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

  void showDialog() {
    speak(
        "Hello Guys, This system worked pretty nicely, but only sometimes, why? People would occasionally face several issues, we’ll go over the 6 main problems they came across");
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.NO_HEADER,
      body: Column(
        children: [
          DefaultTextStyle(
            style: const TextStyle(fontSize: 40.0, color: Colors.pink),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Hello,'),
              ],
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
                  child: const Center(child: Text("next ")))),
        ],
      ),
    ).show();
  }
}
