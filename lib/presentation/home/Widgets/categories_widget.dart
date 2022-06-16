import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/cupertino.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../Data/models/Category.dart';
import '../../courses/coursesView.dart';
import '../../goals/goals_view.dart';
import '../../tasks/tasks_view.dart';
class CategoriesWidget extends StatefulWidget {
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {


  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppPadding.p16),
      shrinkWrap: true,
      primary: false,
      itemCount: categories.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            if(index == 1){
              //Navigator.pushNamed(context, Routes.courses,arguments: 1);
              pushNewScreen(context, screen: BlocProvider(
                create: (context) => blocGenerator().courseCubit,
                child :coursesView(1),
              ),withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);
            }else if(index == 0){
              pushNewScreen(context, screen: Goalsview()
                  ,withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);
            }else if(index == 2){
              pushNewScreen(context, screen: BlocProvider(
                create: (context) => blocGenerator().courseCubit,
                child :TasksView(),
              ),withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);
            }
    
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 1/825 * screensize.height * 130, left: 25,right: 25),
                    width: 1/393* screensize.width * 360,
                    height: 1/825 * screensize.height * 180.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(categories[index].img),
                            fit: BoxFit.fill)),
                    child:
       Text(
                      categories[index].title.tr(),
                      style: getBoldtStyle(
                          fontSize: 28, color: ColorManager.white),
                    )
                  ),
                ],
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
