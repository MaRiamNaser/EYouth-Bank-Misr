import 'package:bank_misr/presentation/lesson5/data/questions.dart';
import 'package:bank_misr/presentation/lesson5/model/checkbox_state.dart';
import 'package:bank_misr/presentation/lesson5/model/option.dart';
import 'package:bank_misr/presentation/lesson5/model/question.dart';
import 'package:bank_misr/presentation/lesson5/utils.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class OptionsWidget extends StatefulWidget {
  Question? question;
  final ValueChanged<Option>? onClickedOption;

  List<CheckBoxState> current_options = [
    CheckBoxState(title: "1. Medium of Exchange", isCorrect: true),
    CheckBoxState(title: "2. Unit of Account", isCorrect: true),
    CheckBoxState(title: "3. Store of Value", isCorrect: true),
    CheckBoxState(title: "4. Limits the Spending", isCorrect: false),
    CheckBoxState(title: "5. Power Indicator", isCorrect: false),
    CheckBoxState(title: "6. Determination of Currency", isCorrect: false),
  ];

  List<CheckBoxState>? selected_options;

  OptionsWidget(
    @required this.question,
    @required this.onClickedOption,
  ) : super();

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  bool value = false;
  @override
  Widget build(BuildContext context) {

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ...widget.current_options.map(buildSingleCheckBox).toList(),
                    Row(
              mainAxisAlignment: MainAxisAlignment.end,              children: [
               submitButton(),
              ],
            ),

      ],
    );
  }

  Widget buildSingleCheckBox(CheckBoxState checkBoxState) {
    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: ColorManager.primary,
        title: Text(checkBoxState.title),
        value: checkBoxState.value,
        onChanged: (value) {
          setState(() {
            checkBoxState.value = value!;

            if (value == true) {

              if (widget.selected_options == null) {
                widget.selected_options = [checkBoxState];
              } else {
                widget.selected_options!.add(checkBoxState);
              }
            } else if (checkBoxState.value == false &&
                widget.selected_options != null) {
              widget.selected_options!.remove(checkBoxState);

            }
          });
        });
  }

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, widget.question!);
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }

  Widget buildAnswer(Option option) => Container(
        height: 50,
        child: Row(children: [
          Text(
            option.code!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(width: 12),
          Text(
            option.text!,
            style: TextStyle(fontSize: 20),
          )
        ]),
      );

  Widget buildSolution(Option? solution, Option? answer) {
    if (solution == answer) {
      return Text(
        widget.question!.solution!,
        style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
      );
    } else {
      return Container();
    }
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;

    if (!isSelected) {
      return Colors.grey.shade200;
    } else {
      return option.isCorrect == true ? Colors.green : Colors.red;
    }
  }

  Widget submitButton() {
    return FlatButton(
      onPressed: () {
        print("*&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&*");
        print(widget.selected_options);
        int numberOfCorrectAnswers = 0;
        if (widget.selected_options != null) {
          int num = 0;
          for (num; num < widget.selected_options!.length; num++) 
          {
            if(widget.selected_options![num].isCorrect == true ){
              numberOfCorrectAnswers += 1;
            }
          }
        }
        if(numberOfCorrectAnswers == 0){
           showCustomDialog("Wrong answer","Try again");

        }else if(numberOfCorrectAnswers == 1){
        
        showCustomDialog("There are more than one Answer","Try again");

        }else if(numberOfCorrectAnswers == 2){
           print("So close, there are 3 Answers");
            showCustomDialog("So close, there are 3 Answers","Try again");

        }else if(widget.selected_options!.length > 3 ){
             showCustomDialog("Wrong answers","");
        }else if(numberOfCorrectAnswers == 3){
         //TODO Lottie.asset("assets/images/99718-confetti-animation.json");
         showCustomDialog("Congrats!","Good boy");
        }
        else{
         showCustomDialog("Wrong answer","");
        }
      },
      child: Text("submit Answers",
          style: getLightStyle(
            color: ColorManager.white,
          )),
      color: ColorManager.darkGrey,
    );
  }

  void showCustomDialog(String title, String subTitle){
              showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text(title),
                        content: Text(subTitle),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("Ok"),
                          ),
                        ],
                      ),
                    );
  }
}
