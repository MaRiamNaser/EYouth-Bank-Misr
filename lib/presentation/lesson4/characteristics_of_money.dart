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

List<String> titles = [
  "First Problem",
  "Second Problem",
  "Third Problem",
  "Fourth Problem",
  "Fifth Problem",
  "sixth Problem",
];
late List<String> backContent = [
  "As we covered, while A cow is fairly durable, but a long trip to market runs the risk of sickness or death for the cow and can severely reduce its value. A pound bill is fairly durable and can be easily replaced if it became worn. Even better, a long trip to market does not threaten the health or valueof the bill."
];

int index = 0;

class CharacteristicsOfMoney extends StatelessWidget {
  const CharacteristicsOfMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextToSpeech(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({Key? key}) : super(key: key);

  @override
  _TextToSpeechState createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  bool isSpeaking = false;
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
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        title: Text("Lesson 2 Stages"),
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
                            titles[index], backContent[0], index)),
                  );
                },
                child: Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  child: FlipCard(
                    fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
                    direction: FlipDirection.HORIZONTAL,
                    front: frontOfCard(),
                    back: backOfCard(),
                  ),
                ),
              );
            }),
      ),
    );
  }
Widget frontOfCard(){

  return Container(
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
                    );
}
Widget backOfCard(){
  return  Container(
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
                          Center(child: Text(titles[index])),
                          Center(child: Text(backContent[0])),
                        ],
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
