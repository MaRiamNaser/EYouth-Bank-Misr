import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bank_misr/data/models/Category.dart';
import 'package:bank_misr/presentation/lesson2/content_of_each_box.dart';
import 'package:bank_misr/presentation/lesson2/small_box.dart';
import 'package:bank_misr/presentation/lesson5/page/category_page.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:math';
import 'package:bank_misr/presentation/lesson5/fake_data/categories.dart' as Categories;

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


class ReadyToTestPage extends StatefulWidget {
  const ReadyToTestPage({Key? key}) : super(key: key);

  @override
  _ReadyToTestPageState createState() => _ReadyToTestPageState();
}

class _ReadyToTestPageState extends State<ReadyToTestPage> {
  bool isSpeaking = false;
  final TextEditingController _controller = TextEditingController();
  final _flutterTts = FlutterTts();
  //declare the isBack bool
  bool isBack = true;
  double angle = 0;
  bool flag = true;

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
      showMyDialog(context, "", "Are You Ready To test Yourself ??");
    });
  }

  void speak(String text) async {
    // if (_controller.text.isNotEmpty) {
    await _flutterTts.speak(text);

    //  }
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
        title: Text("Lesson 5 stages"),
      ),
      body: Container(),
    );
  }

  Future<void> showMyDialog(
      BuildContext context, String title, String content) async {
    speak(content);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            title: Text(content,
                style: getLightStyle(color: ColorManager.black, fontSize: 30)),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    onPressed: () {
                   
                      Navigator.of(context).pop();
                      stop();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(Categories.categories.first)),
                      );
                    },
                    child: Text("Yes"),
                    color: ColorManager.green,
                  ),
                  FlatButton(
                    onPressed: () {
                      if (flag) {
                        Navigator.of(context).pop();
                        stop();
                        showCustomDialog( context, "",
                            "Do you want to revise the previous lessons or would you like to test yourself first?");
                      }else{
                        stop();

                      }
                      setState(() {
                        flag = false;
                      });
                    },
                    child: Text("No"),
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> showCustomDialog(
      BuildContext context, String title, String content) async {
    speak(content);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            title: Text(content,
                style: getLightStyle(color: ColorManager.black, fontSize: 30)),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      stop();
                    },
                    child: Text("Revision"),
                    color: ColorManager.lightGrey,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      stop();
                    },
                    color: ColorManager.lightGrey,
                    child: Text("Test"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
