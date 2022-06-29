import 'dart:async';
import 'package:bank_misr/presentation/Lesson8/lesson8Widgets.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../Data/models/lesson4/lesson4slider.dart';
import '../../Data/models/lesson8/banknote.dart';
import '../courses/coursesView.dart';
import '../lesson2/lesson2.dart';
import '../resources/assets_manager.dart';

class lesson8 extends StatefulWidget {
  @override
  _lesson8State createState() => _lesson8State();
}
class _lesson8State extends State<lesson8> {

  bool onPressedValue=true;
  PageController controller=PageController();
  List<Widget> _list=[];
  int _curr=0;
  int index=0;
  final _flutterTts = FlutterTts();
  @override
  void initState() {
    super.initState();
    speak(EGpound[index].description);
    _list=<Widget>[
      // new Container(child:new Firstpage(moneyimages:EGpound[0].img)),
      new Container(child:new Pages(image: EGpound[0].img,text: EGpound[0].description,)),
      new Container(child:new Pages(image: EGpound[1].img,text: EGpound[1].description,)),
      // new Container(child:new Pages(image: EGpound[3].img,text: EGpound[3].description,)),
       ];
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
  }

  void stop() async {
    await _flutterTts.stop();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Money at Home?"),  actions: [
        CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              ImageAssets.profilePhoto,
              fit: BoxFit.fitWidth,
              width: 45,
            ),
            maxRadius: 34),

      ] ),
      body:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: PageView(
          children:
          _list,
          scrollDirection: Axis.horizontal,
          allowImplicitScrolling: false,
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          onPageChanged: (num){
            setState(() {
              _curr=num;
            });
          },
        ),
      ),
     floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget>[
            FloatingActionButton(
                backgroundColor: ColorManager.darkPrimary,
                onPressed: (){
                  index--;
                  speak(EGpound[index].description);
                  setState(() {
                    controller.jumpToPage(_curr-1);
                  });
                },
                child:Icon(Icons.arrow_back,color: ColorManager.white,)
            ),
            FloatingActionButton(
                backgroundColor: ColorManager.darkPrimary,
                onPressed: (){
                        stop();
                  setState(() {

                  });
                },
                child:Icon(Icons.volume_up_rounded,color: ColorManager.white,)
            ),
            FloatingActionButton(
              child:Icon(Icons.arrow_forward_outlined ,color: ColorManager.white,),
              backgroundColor:onPressedValue? ColorManager.darkPrimary:Colors.grey,
              onPressed: onPressedValue==true?() {
                index++;
                speak(EGpound[index].description);
                if(_curr==1)
                 pushNewScreen(context, screen:coursesView(),withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);
                else {
                  setState(() {
                    controller.jumpToPage(_curr + 1);
                    onPressedValue = false;
                  },);
                  Timer(Duration(seconds: 1,), () {
                    setState(() {
                      onPressedValue = true;
                    },);
                  },);
                }
              }:null,



            ),
          ]
      ),
    );
  }
}





