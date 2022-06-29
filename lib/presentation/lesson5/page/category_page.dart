import 'package:bank_misr/presentation/lesson5/model/category.dart';
import 'package:bank_misr/presentation/lesson5/model/option.dart';
import 'package:bank_misr/presentation/lesson5/model/question.dart';
import 'package:bank_misr/presentation/lesson5/widget/questions_widget.dart';
import 'package:flutter/material.dart';


class CategoryPage extends StatefulWidget {
  final Category category;

  const CategoryPage( @required this.category) : super();

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  PageController? controller;
  Question? question;

  @override
  void initState() {
    super.initState();

    controller = PageController();
    question = widget.category.questions!.first;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: QuestionsWidget(
          category: widget.category,
          controller: controller,
          onChangedPage: (index) => nextQuestion(index: index),
          onClickedOption: selectOption,
        ),
      );

  void selectOption(Option option) {

      setState(() {

        question?.selectedOption = option;

        if(question?.selectedOptions == null ){
           question!.selectedOptions = [question?.selectedOption];
        }else{
           question!.selectedOptions!.add(question?.selectedOption);
        }
       
      });

  }

  void nextQuestion({int ?index}) {
    final nextPage = controller!.page! + 1;
    final indexPage = index ?? nextPage.toInt();

    setState(() {
      question = widget.category.questions![indexPage];
    });
  }
}
