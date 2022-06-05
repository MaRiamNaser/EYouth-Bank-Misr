import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class QuizWidget extends StatefulWidget {
  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  List<Color>colors=[ColorManager.grey,ColorManager.grey,ColorManager.grey,];
  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;

    return ListView.builder(
      padding: const EdgeInsets.all(AppPadding.p16),
      shrinkWrap: true,
      itemCount: 1,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (){
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: AppPadding.p20,left: AppPadding.p20),
                height: 1/825 * screensize.height * 190.0,
                width: 1/393* screensize.width * 360,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(AppSize.s25) ,bottomRight: Radius.circular(AppSize.s25)),
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
                    Text("Quiz No. 1 :",style: getSemiBoldStyle(fontSize: FontSize.s14,color: ColorManager.black),),
                    SizedBox(height: 1/825 * screensize.height * AppSize.s8,),
                    Text("What is the currency of Egypt?" ,style: getMediumStyle(fontSize:AppSize.s14,color: ColorManager.black),),
                    ListView.builder(
                      padding: const EdgeInsets.only(top:AppPadding.p12),
                      shrinkWrap: true,
                      itemCount: 3,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              colors=[ColorManager.grey,ColorManager.grey,ColorManager.grey,];
                              colors[index]==ColorManager.grey?colors[index]=ColorManager.darkPrimary:colors[index]=ColorManager.grey;
                            });
                          },
                          child: SizedBox(
                            height: 1/825 * screensize.height *30 ,
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.circle_filled,color: colors[index],),
                                SizedBox(width: 1/393* screensize.width * 15),
                                Text("EGP.",style: getMediumStyle(color: ColorManager.black),)
                              ],
                            ),
                          ) ,

                        );
                      },
                    )
                  ],

                ),
              ),
              SizedBox(
                height: 1/825 * screensize.height * AppSize.s20,
              ),
            ],

          ),

        );
      },
    );
  }
}
