import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bank_misr/presentation/lesson2/small_box.dart';
import 'package:bank_misr/presentation/lesson2/lesson2.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ContentOfEachBox extends StatefulWidget {
  String title;
  String content;
  int index;
  ContentOfEachBox(this.title, this.content, this.index) : super();

  @override
  State<ContentOfEachBox> createState() => _ContentOfEachBoxState();
}

class _ContentOfEachBoxState extends State<ContentOfEachBox> {
  final _flutterTts = FlutterTts();
  bool isStopped = false;

  @override
  void initState() {
    super.initState();
    Timer.run(() {
      _showMyDialog(context,widget.title, widget.content);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        stop();
        return false;

      },
      child: Scaffold(
        body: Container(),
      ),
    );
    
  }

  void speak(String text) async {
 
    await _flutterTts.speak(text);

   
  }


  void stop() async {
    await _flutterTts.stop();
    setState(() {
      // isSpeaking = false;
    });
  }

Future<void> _showMyDialog(BuildContext context, String title, String content) async {
  speak(content);
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: ()async{
          return false;
        },
        child: AlertDialog(
          
          title:  DefaultTextStyle(
            style: const TextStyle(fontSize: 40.0, color: Colors.pink),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(title),
              ],
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
        children: [
             
          SizedBox(
            
            child: DefaultTextStyle(
              style: getLightStyle(color: ColorManager.black, fontSize: 20),
              child: Text(content),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {   
                      index = 0;
                    stop();
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SixBoxesGame()),
                  );
             
                  },
                  child: Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: SmallBox(
                          child: Icon(
                        Icons.close,
                        size: 32,
                      )),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    stop();
                     if (index <= 5) {
                
                        index = index + 1;

                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ContentOfEachBox(titles[index], contents[0], index)),
                    );
                     }
                  },
                  child: Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: SmallBox(
                          child: Icon(
                        Icons.next_plan,
                        size: 32,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
            ),
          ),
             
        ),
      );
    },
  );
}
  
}

