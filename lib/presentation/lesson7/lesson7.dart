import 'dart:async';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Data/models/lesson7/lesson7Slider.dart';
import '../resources/assets_manager.dart';
import 'lesson7Widgets.dart';

class lesson7 extends StatefulWidget {
  @override
  _lesson7State createState() => _lesson7State();
}

class _lesson7State extends State<lesson7> {
  bool onPressedValue=true;
  PageController controller=PageController();
  List<Widget> _list=[];
  int _curr=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list=<Widget>[
      new Container(child:new Pages(image:slide[0].img)),
      new Container(child:new Pages(text: slide[0].description,)),
      new Container(child:new Pages(image:slide[1].img)),
      new Container(child:new Pages(image:slide[2].img,text: slide[2].description)),
    ];
  }
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Lesson 7"),  actions: [
        CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              ImageAssets.profilePhoto,
              fit: BoxFit.fitWidth,
              width: 45,
            ),
            maxRadius: 34),

      ] ),
      body: PageView(
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
      floatingActionButton:
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget>[

            FloatingActionButton(
                backgroundColor: ColorManager.darkPrimary,
                onPressed: (){

                  setState(() {
                    controller.jumpToPage(_curr-1);
                  });
                },
                child:Icon(Icons.arrow_back,color: ColorManager.white,)
            ),
            FloatingActionButton(
                backgroundColor: ColorManager.darkPrimary,
                onPressed: (){

                  setState(() {

                  });
                },
                child:Icon(Icons.volume_up_rounded,color: ColorManager.white,)
            ),
            FloatingActionButton(
              child:Icon(Icons.arrow_forward_outlined ,color: ColorManager.white,),
              backgroundColor: ColorManager.darkPrimary,
              onPressed: onPressedValue==true?() {

                setState(() {
                  controller.jumpToPage(_curr + 1);
                  onPressedValue = false;
                },);
                Timer(Duration(seconds: 5,), () {
                  setState(() {
                    onPressedValue = true;
                  },);
                }, );
              }:null,

            ),
          ]
      ),
    );
  }
}





