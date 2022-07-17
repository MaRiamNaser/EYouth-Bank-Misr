import 'dart:collection';

import 'package:bank_misr/Data/models/Lesson.dart';
import 'package:bank_misr/presentation/video/video_view.dart';
import 'package:flutter/cupertino.dart';

import '../../../Data/models/MatcingItem.dart';
import '../../../Data/models/Video.dart';
import '../../Lesson8/banknoteTest.dart';
import '../../lesson2/lesson2.dart';
import '../../lesson4/pageslider.dart';
import '../../lesson4/slide_show.dart';
import '../../lesson5/ready_to_test_page.dart';
import '../../lesson7/lesson7.dart';
import '../../matching/matching_lesson.dart';
import '../../matching/matching_levels.dart';
import '../../navgpage/navigation_page.dart';

class lesson_route {
  Lesson lesson;
  List<Widget> Pages=[];
  lesson_route(this.lesson){
    print(lesson.video);
    Pages  = [
      VideoView(lesson),
      SixBoxesGame(lesson),
      pageslider(lesson),
      Slideshow(lesson),
      ReadyToTestPage(lesson),
      MatchingLesson(lesson: lesson,),
      pageslider(lesson),
      banknoteTest(lesson),
      VideoView(lesson),
      MatchingLevels(lesson)
    ];
  }


}


