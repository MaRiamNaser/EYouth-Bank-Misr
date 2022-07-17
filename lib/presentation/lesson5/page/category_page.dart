import 'package:bank_misr/Data/models/Lesson.dart';
import 'package:bank_misr/presentation/lesson5/model/question.dart';
import 'package:bank_misr/presentation/lesson5/widget/questions_widget.dart';
import 'package:flutter/material.dart';


class CategoryPage extends StatefulWidget {
   Lesson category;

   CategoryPage( @required this.category) : super();

  @override
  _CategoryPageState createState() => _CategoryPageState(category);
}

class _CategoryPageState extends State<CategoryPage> {

  PageController? controller;
  Question? question;
Lesson lesson;
  _CategoryPageState(this.lesson);

  @override
  void initState() {
    super.initState();

    controller = PageController();
    question = Question(text: lesson.quiz!.head!, options: [Option(id: "0",option: "fldsnf")], solution:  lesson.quiz!.answers![0].answer,);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: WillPopScope(
          onWillPop: ()async{
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            return false;
          },
          child:QuestionsWidget(
          category: widget.category,
          controller: controller,
          onChangedPage: (index) => nextQuestion(index: index),
        ),
      )
  );


  void nextQuestion({int ?index}) {
    final nextPage = controller!.page! + 1;
    final indexPage = index ?? nextPage.toInt();

    setState(() {
    });
  }
}
