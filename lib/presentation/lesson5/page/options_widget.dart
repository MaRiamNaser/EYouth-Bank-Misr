

import 'package:bank_misr/Data/models/Lesson.dart';
import 'package:bank_misr/presentation/lesson5/model/checkbox_state.dart';
import 'package:bank_misr/presentation/matching/Widgets/alert_dialog.dart';

import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';


class OptionsWidget extends StatefulWidget {
  Quiz question;

  List<CheckBoxState>? selected_options;

  OptionsWidget(
    @required this.question,
  ) : super();

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState(question);
}

class _OptionsWidgetState extends State<OptionsWidget> {
  bool value = false;
 late List<CheckBoxState> current_options;
  Quiz question;
  _OptionsWidgetState(this.question);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    current_options=//[CheckBoxState(title: "Yes", isCorrect:false)];
     widget.question.options!.map((e) =>
         CheckBoxState(title: e.option,
             isCorrect:question.answers!.any((element) => element.answer==e.option)?true:false)).toList();

    print(widget.question.options![0].option+" "+widget.question.options![1].option+" "+widget.question.options![2].option);
    print(widget.question.answers![0].answer!+" "+widget.question.answers![1].answer!+" "+widget.question.answers![2].answer!);
    print(current_options[0].isCorrect.toString()+" "+current_options[1].isCorrect.toString()+" "+current_options[2].isCorrect.toString()+" ");
  }
  Widget build(BuildContext context) {

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ...current_options.map(buildSingleCheckBox).toList(),
                    Row(
              mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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

  Widget submitButton() {
    return FlatButton(
      onPressed: () async {
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
         await showDialog(context: context, builder: (BuildContext context) { return AlertDialogLesson(); },);
          Navigator.of(context).pop();
         Navigator.of(context).pop();

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
