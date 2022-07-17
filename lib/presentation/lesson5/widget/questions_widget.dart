import 'package:bank_misr/presentation/courses/coursesView.dart';
import 'package:bank_misr/presentation/lesson5/fake_data/categories.dart';
import 'package:bank_misr/presentation/lesson5/model/category.dart';
import 'package:bank_misr/presentation/lesson5/model/checkbox_state.dart';
import 'package:bank_misr/presentation/lesson5/model/option.dart';
import 'package:bank_misr/presentation/lesson5/model/question.dart';
import 'package:bank_misr/presentation/lesson5/page/category_page.dart';
import 'package:bank_misr/presentation/lesson5/page/options_widget.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

import '../../../Data/models/Lesson.dart';


class QuestionsWidget extends StatelessWidget {
   final Lesson category;
  final PageController? controller;
  final ValueChanged<int>? onChangedPage;

  const QuestionsWidget({
    required this.category,
    @required this.controller,
    @required this.onChangedPage,
  }) : super();

  @override
  Widget build(BuildContext context) =>  Scaffold(
      appBar: AppBar(title: Text("Lesson 5"),),
      body: PageView.builder(
            onPageChanged: onChangedPage,
            controller: controller,
            itemCount: 1,
            itemBuilder: (context, index) {
              //final question = category?.questions?[index];
              return buildQuestion(question: category.quiz!);
            },
        ),
  );

  Widget buildQuestion({
  required Quiz question,
  }) =>
      Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              question.head??"",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 8),
            Text('Choose your answer from below',style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            ),
            SizedBox(height: 32),
            Expanded(
              child: OptionsWidget(
             question,
              ),
            ),

          ],
        ),
      );

}

 
