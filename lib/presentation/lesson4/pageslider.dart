import 'dart:async';
import 'package:bank_misr/Data/models/Lesson.dart';
import 'package:bank_misr/Data/models/lesson4/lesson4slider.dart';
import 'package:bank_misr/presentation/lesson4/pagesliderWidgets.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../resources/assets_manager.dart';

class pageslider extends StatefulWidget {
  Lesson lesson;
  String img;
  pageslider(this.lesson, { this.img=""});

  @override
  _pagesliderState createState() => _pagesliderState(lesson,img);
}

class _pagesliderState extends State<pageslider> {
  bool onPressedValue=false;
  var flag=false;
  PageController controller=PageController();
  int _curr=0;
  final _flutterTts = FlutterTts();
  late int index;
  Lesson lesson;
  bool speaking=false;
  String img;
  _pagesliderState(this.lesson, this.img);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index=0;
    initializeTts();
    speak(lesson.game![0].des);
    Timer(Duration(seconds: 15), () {
      setState(() {
        onPressedValue = true;
      },);
    },);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stop();
  }
  void initializeTts() {
    _flutterTts.setStartHandler(() {
      setState(() {
        speaking=true;
      });
    });
    _flutterTts.setCompletionHandler(() {
      setState(() {
            speaking=false;
      });
    });
    _flutterTts.setErrorHandler((message) {
      setState(() {

      });
    });
    _flutterTts.setPauseHandler(() {
      setState(() {

      });
    });
    _flutterTts.setContinueHandler(() {
      setState(() {

      });
    });

    _flutterTts.setSpeechRate(0.4);
  }
  void speak(String text) async {
    await _flutterTts.speak(text);
    speaking=true;
  }

  void stop() async {
    await _flutterTts.stop();
    speaking=false;

  }

  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(title: Text(lesson.title),  actions: [
          CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                ImageAssets.profilePhoto,
                fit: BoxFit.fitWidth,
                width: 45,
              ),
              maxRadius: 34),

        ] ),
        body: PageView.builder(
          scrollDirection: Axis.horizontal,
           allowImplicitScrolling: false,
           physics: NeverScrollableScrollPhysics(),
          controller: controller,
          itemCount: lesson.game!.length,
          onPageChanged: (num){
            setState(() {
              _curr=num;
            });
          }, itemBuilder: (BuildContext context, int index) {
          return Container(child: Pages(image:img.isEmpty?lesson.game![index].img:img,text: lesson.game![index].des));
        },
        ),
        floatingActionButton:
        Container(
          margin: EdgeInsets.only(bottom: 19,left: 23),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:<Widget>[
                FloatingActionButton(
                     backgroundColor:index==0? Colors.grey:ColorManager.darkPrimary,
                    onPressed:index!=0? (){
                      setState(() {
                        index--;
                        controller.jumpToPage(index);
                        stop();
                        onPressedValue = true;
                      });
                    }:null,
                    child:Icon(Icons.arrow_back,color: ColorManager.white,)
                    ),
                FloatingActionButton(
                    backgroundColor: ColorManager.darkPrimary,
                    onPressed: () async {
                         speaking?stop():speak(lesson.game![index].des);
                      setState(() {});
                    },
                    child:Icon(Icons.volume_up_rounded,color: ColorManager.white,)
                ),
                FloatingActionButton(
                    child:Icon(Icons.arrow_forward_outlined ,color: ColorManager.white,),
                  backgroundColor:onPressedValue? ColorManager.darkPrimary:Colors.grey,
                  onPressed: onPressedValue==true?() {
                    if (index < lesson.game!.length - 1) {
                      index++;
                      speak(lesson.game![index].des);
                      setState(() {
                        controller.jumpToPage(index);
                        onPressedValue = false;
                      },);
                      Timer(Duration(seconds: 15), () {
                        setState(() {
                          onPressedValue = true;
                        },);
                      },);
                    }}
                    :
                    null
                ),
              ]
          ),
        ),
    );
  }
}





