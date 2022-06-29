import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bank_misr/presentation/bottomBar/bottomBar.dart';
import 'package:bank_misr/presentation/lesson2/small_box.dart';
import 'package:bank_misr/presentation/lesson2/lesson2.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';

class Slideshow extends StatefulWidget {
  @override
  _SlideshowState createState() => _SlideshowState();
}

class _SlideshowState extends State<Slideshow> {
  // This will give them 80% width which will allow other slides to appear on the side
  final PageController controller = PageController(viewportFraction: 0.8);

 late List<String> frontContent =[];
 late List<String> backContent =[];
  String activeTag = 'Durability';
   final _flutterTts = FlutterTts();

  int currentPage = 0;

  void speak(String text) async {
    // if (_controller.text.isNotEmpty) {
    await _flutterTts.speak( text
       );

    //  }
  }

  void stop() async {
    await _flutterTts.stop();
    setState(() {
     // isSpeaking = false;
    });
  }


  @override
  void initState() {
    load();
    controller.addListener(() {
      int next = controller.page!.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
    super.initState();
  }

  void load({String tag = 'Durability'}) {
    // Map the slides to the data payload
    frontContent = ["Durability", "Portability", "Divisibility","Uniformity","Limited Supply","Acceptability"];
    backContent = [
    "As we covered, while A cow is fairly durable, but a long trip to market runs the risk of sickness or death for the cow and can severely reduce its value. A pound bill is fairly durable and can be easily replaced if it became worn. Even better, a long trip to market does not threaten the health or valueof the bill.",
    "As we covered, while A cow is fairly durable, but a long trip to market runs the risk of sickness or death for the cow and can severely reduce its value. A pound bill is fairly durable and can be easily replaced if it became worn. Even better, a long trip to market does not threaten the health or valueof the bill.",
    "As we covered, while A cow is fairly durable, but a long trip to market runs the risk of sickness or death for the cow and can severely reduce its value. A pound bill is fairly durable and can be easily replaced if it became worn. Even better, a long trip to market does not threaten the health or valueof the bill.",
    "As we covered, while A cow is fairly durable, but a long trip to market runs the risk of sickness or death for the cow and can severely reduce its value. A pound bill is fairly durable and can be easily replaced if it became worn. Even better, a long trip to market does not threaten the health or valueof the bill.",
    "As we covered, while A cow is fairly durable, but a long trip to market runs the risk of sickness or death for the cow and can severely reduce its value. A pound bill is fairly durable and can be easily replaced if it became worn. Even better, a long trip to market does not threaten the health or valueof the bill.",
    "As we covered, while A cow is fairly durable, but a long trip to market runs the risk of sickness or death for the cow and can severely reduce its value. A pound bill is fairly durable and can be easily replaced if it became worn. Even better, a long trip to market does not threaten the health or valueof the bill."];
       
    // Update the active tag
    setState(() {
      activeTag = tag;
    });
  }

  Container _buildTagPage() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Lessons',
            style:  TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
     
          _buildButton('Durability'),
          _buildButton('Portability'),
          _buildButton('Divisibility'),
          _buildButton('Uniformity'),
          _buildButton('Limited Supply'),
          _buildButton('Acceptability'),
        ],
      ),
    );
  }

  FlatButton _buildButton(tag) {
   
    return FlatButton(
     
      child: Text(
        '#$tag',
        textAlign: TextAlign.left,
      ),
      onPressed: () {
     
   
      } ,
    );
  }

  AnimatedContainer _buildFrontContentCard(String content, bool active) {
    // Animated properties
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 100 : 200;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorManager.primary,
        boxShadow: [
          BoxShadow(
            color: ColorManager
            .grey,
            blurRadius: blur,
            offset: Offset(offset, offset),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Center(
            child: Text(
              content,
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
            Center(child: content == "Durability"?
                          Icon(Icons.done, color: ColorManager.green,size: 100,)
                          :Icon(Icons.lock, color: ColorManager.white,size: 100,),),
       
        ],
      ),
    );
  }

    AnimatedContainer _buildBackContentCard(String title,String content, bool active) {
    // Animated properties
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 100 : 200;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorManager.primary,
        boxShadow: [
          BoxShadow(
            color: ColorManager
            .grey,
            blurRadius: blur,
            offset: Offset(offset, offset),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
            style: const TextStyle(fontSize: 40.0, color: Colors.pink),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(title),
              ],
            ),
          ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                child: Text(
                  content,
                  style:getLightStyle(color: ColorManager.black, fontSize: 25),
                ),
              ),

                        Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {   

                    stop();

                  },
                  child: Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: SmallBox(
                          child: Icon(
                        Icons.volume_up_rounded,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    
        return Scaffold(
          appBar: AppBar(title: Text("Lesson 4")),
            body: PageView.builder(
              controller: controller,
              itemCount: frontContent.length + 1,
              itemBuilder: (context, int currentIndex) {
                if (currentIndex == 0) {
                  return _buildTagPage();
                } else if (frontContent.length >= currentIndex) {
                  bool active = currentIndex == currentPage;
                  return FlipCard(
                    onFlip: (){
                      speak(backContent[currentIndex - 1]);
                    },
                    onFlipDone: (isFront) {
                      if(isFront == true){
                        speak(backContent[currentIndex - 1]);
                      }else{
                        stop();
                      }
                    },
                    front:  _buildFrontContentCard(frontContent[currentIndex - 1], active),
                   back:  _buildBackContentCard(frontContent[currentIndex - 1],backContent[currentIndex - 1],
                    active));
                }else{  bool active = currentIndex == currentPage;
                  return _buildFrontContentCard(frontContent[currentIndex - 1], active);}
              },
            ),
          );
      }
    
  }
