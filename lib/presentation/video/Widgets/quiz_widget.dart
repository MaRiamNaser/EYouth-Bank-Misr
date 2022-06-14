
import 'package:bank_misr/Data/web_services/balance_services.dart';
import 'package:bank_misr/presentation/bottomBar/bottomBar.dart';
import 'package:bank_misr/presentation/home/home_view.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data/models/Quiz.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
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
  var token;
  _QuizWidgetState(this.quiz);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
  }
  Load() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     token=sharedPreferences.getString("token");
  }

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
        return Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: AppPadding.p20, left: AppPadding.p20,right:AppPadding.p16 ),
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
                    Text(AppStrings.quiz_no1.tr(), style: getSemiBoldStyle(
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
                                SizedBox(
                                  width: 250,
                                  child: Text(quiz.options[index], style: getMediumStyle(
                                      color: ColorManager.black),),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )
                    ,
                    Center(
                      //padding:  EdgeInsets.only(left: 1 / 393 * screensize.width * 210,right: 210 ),
                      child: Container(
                        height:40 ,
                        width:100 ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorManager.darkPrimary,

                        ),
                        child: TextButton(onPressed: isclicked?null:() async {
                          print("clicked");
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
                         await balanceServices().EditBalance(token, 100);
                          showDialog(context: context, builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                scrollable: true,
                                backgroundColor: ColorManager.primary,
                                  title:  Center(
                                    child: Text(AppStrings.Well_Done.tr(),
                                      style: getBoldtStyle(fontSize:18,color: ColorManager.white),),
                                  ),
                                  content: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Lottie.asset("assets/images/7455-loading1.json",height: 145,width:250, )
                                        ,
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 190,
                                              child: Text("${AppStrings.EGP_Has_Been_Added_To_Your_Wallet.tr()}\n ${AppStrings.Your_Balance_Now_is.tr()} $balance",
                                                style: getSemiBoldStyle(fontSize:14,color: ColorManager.white),
                                                textAlign: TextAlign.center,)),
                                        ),
                                      ],
                                    ),
                                  ),
                                      actions: [
                                        Center(
                                          child: Container(
                                            height:40 ,
                                            width:100 ,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: ColorManager.darkPrimary,
                                            ),
                                            child: TextButton(
                                              child: Text(AppStrings.Ok.tr(),style:getRegularStyle(color: ColorManager.white) ,),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                            );
                          });
                        },
                            child:  Text(AppStrings.Submit.tr(),style: TextStyle(color: ColorManager.white),),
                            )
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 1 / 825 * screensize.height * AppSize.s20,
              ),
            ],
          );
      },
    );
  }
}
