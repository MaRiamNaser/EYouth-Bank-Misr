import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_misr/Data/models/Lesson.dart';
import 'package:bank_misr/presentation/addTasksGoals/edit_goal/edit_goal.dart';
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
  Lesson lesson;
  Slideshow(this.lesson);

  @override
  _SlideshowState createState() => _SlideshowState(lesson);
}

class _SlideshowState extends State<Slideshow> {
  // This will give them 80% width which will allow other slides to appear on the side
  final PageController controller = PageController(viewportFraction: 0.8);

 late List<String> frontContent =[];
 late List<String> backContent =[];
  String activeTag = 'Durability';
   final _flutterTts = FlutterTts();
 late String tag;
  int currentPage = 0;
  Lesson lesson;
  _SlideshowState(this.lesson);

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
     tag = lesson.game![0].title;
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
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stop();
  }
  void load() {
    // Map the slides to the data payload
    frontContent = lesson.game!.map((e) => e.title).toList();
    backContent = lesson.game!.map((e) => e.des).toList();
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
           lesson.title,
            style:  TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),

          Container(
            child: ListView.builder(
              padding: EdgeInsets.only(right: 80),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: frontContent.length,
                itemBuilder: (BuildContext context, int index) {
                  return  _buildButton(frontContent[index]);
                },
            ),
          )
        ],
      ),
    );
  }

  SizedBox _buildButton(tag) {
   
    return SizedBox(
      height: 50,
      width: 40,
      child: TextButton(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '#$tag',
            textAlign: TextAlign.left,
            style: getMediumStyle(color: Colors.black,fontSize: 15),
          ),
        ),
        onPressed: () {


        } ,
      ),
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              DefaultTextStyle(
              style:  TextStyle(fontSize: 36.0, color: ColorManager.darkPrimary),
              child: AutoSizeText(title),
            ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                  child: AutoSizeText(
                    content,
                    style:getLightStyle(color: ColorManager.black, fontSize: 22,),
                    textAlign: TextAlign.left,
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
                    child: Container(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text(lesson.title)),
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
