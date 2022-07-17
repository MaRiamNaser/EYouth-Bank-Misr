import 'package:bank_misr/Data/models/Lesson.dart';
import 'package:bank_misr/Data/models/MatcingItem.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../resources/color_manager.dart';
import 'matching_lesson.dart';

class MatchingLevels extends StatefulWidget {
  Lesson lesson;
  MatchingLevels(this.lesson);

  @override
  _MatchingLevelsState createState() => _MatchingLevelsState(lesson);
}

class _MatchingLevelsState extends State<MatchingLevels> {

  Lesson lesson;
  _MatchingLevelsState(this.lesson);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: lesson.levels!.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () {
                  print(lesson.levels![0].levelNumber);
                  pushNewScreen(context, screen:MatchingLesson(level: lesson.levels![index]) ,withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);
                },
                child: Container(
                  margin:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  child: Card(
                    child: Container(
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
                            child:
                            //lesson.levels![index-1].checked!||index==0
                      true
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
                          Center(child: Text("Level ${index+1}")),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
