
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/models/Quiz.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class QuizWidget extends StatefulWidget {
  Quiz quiz;

  QuizWidget(this.quiz);

  @override
  _QuizWidgetState createState() => _QuizWidgetState(quiz);
}

class _QuizWidgetState extends State<QuizWidget> {
  List<Color>colors = [
    ColorManager.white,
    ColorManager.white,
    ColorManager.white,
  ];
  bool isclicked=false;
  Quiz quiz;
  _QuizWidgetState(this.quiz);

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery
        .of(context)
        .size;

    return ListView.builder(
      padding: const EdgeInsets.all(AppPadding.p16),
      shrinkWrap: true,
      itemCount: 1 ,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: AppPadding.p20, left: AppPadding.p20),
                height: 1 / 825 * screensize.height * 220.0,
                width: 1 / 393 * screensize.width * 360,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s25),
                        bottomRight: Radius.circular(AppSize.s25)),
                    color: ColorManager.primary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      )
                    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quiz No. 1 :", style: getSemiBoldStyle(
                        fontSize: FontSize.s14, color: ColorManager.black),),
                    SizedBox(height: 1 / 825 * screensize.height * AppSize.s8,),
                    Text(quiz.head,
                      style: getMediumStyle(
                          fontSize: AppSize.s14, color: ColorManager.black),),
                    ListView.builder(
                      padding: const EdgeInsets.only(top: AppPadding.p12),
                      shrinkWrap: true,
                      itemCount: quiz.options[2]==" "?quiz.options.length-1: quiz.options.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap:isclicked?null: () {
                            setState(() {
                              colors = [
                                ColorManager.white,
                                ColorManager.white,
                                ColorManager.white,
                              ];
                              colors[index] == ColorManager.white
                                  ? colors[index] = ColorManager.darkPrimary
                                  : colors[index] = ColorManager.white;
                            });
                          },
                          child: SizedBox(
                            height: 1 / 825 * screensize.height * 30,
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.circle_filled,
                                  color: colors[index],),
                                SizedBox(
                                    width: 1 / 393 * screensize.width * 15),
                                Text(quiz.options[index], style: getMediumStyle(
                                    color: ColorManager.black),)
                              ],
                            ),
                          ),
                        );
                      },
                    )
                    ,
                    Padding(
                      padding:  EdgeInsets.only(left: 1 / 393 * screensize.width * 200),
                      child: Container(
                        height:30 ,
                        width:100 ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorManager.darkPrimary,

                        ),
                        child: TextButton(onPressed: isclicked?null:(){
                          int index=colors.indexOf(ColorManager.darkPrimary);
                          setState(() {
                            isclicked=true;
                            if(quiz.answer==quiz.options[index])
                            {
                              colors[index]=Colors.green;
                            }
                            else {
                              colors[index] = Colors.red;
                              int index1=quiz.options.indexOf(quiz.answer);
                              colors[index1]= Colors.green;
                            }
                          });
                        },
                            child:  Text("Submit",style: getRegularStyle(color: ColorManager.white),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1 / 825 * screensize.height * AppSize.s20,
              ),
            ],

          ),

        );
      },
    );
  }
}
