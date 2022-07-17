import 'dart:io';
import 'package:bank_misr/Data/web_services/goal_services/goalChecked_services.dart';
import 'package:bank_misr/app/app_prefs.dart';
import 'package:bank_misr/business_logic/goalBloc/goal_cubit.dart';
import 'package:bank_misr/presentation/addTasksGoals/addGoal/add_goal.dart';
import 'package:bank_misr/presentation/addTasksGoals/edit_goal/edit_goal.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';

import 'package:bank_misr/presentation/home/parentHomeView/ParentNavBarView.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:bank_misr/Data/models/goal.dart';
import 'package:bank_misr/Data/repo/goal_repo.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../Data/models/Profile.dart';
import '../../Data/models/User.dart';
import '../../Data/web_services/goal_services/goalConfirmDelete_services.dart';
import '../../Data/web_services/goal_services/goalConfirmEdit_services.dart';
import '../../Data/web_services/goal_services/goal_services.dart';
import '../../business_logic/profileBloc/profile_cubit.dart';
import '../bottomBar/bottomBar.dart';
import '../home/home_view.dart';

import '../../Data/web_services/goal_services/goalConfirmDelete_services.dart';
import '../../Data/web_services/goal_services/goalConfirmEdit_services.dart';
import '../../Data/web_services/goal_services/goal_services.dart';
import '../bottomBar/bottomBar.dart';
import '../home/home_view.dart';
import '../home/parentHomeView/parentHomeView.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import 'Goal.dart';
import 'goalwidgets.dart';
class Goalsview extends StatefulWidget {
  @override
  State<Goalsview> createState() => _GoalViewState();
}
class _GoalViewState extends State<Goalsview> {

  goalConfirmChecked checked = goalConfirmChecked();
  AppPreferences appPreferences = AppPreferences();
  goalConfirmDeleteServices delete = goalConfirmDeleteServices();
  goalConfirmEdit edit = goalConfirmEdit();
  var token;
  late List<Goal> goals = [];
  int  balance1=0;
  int progress=0;
 late User profile;
  late var userid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
    Load2();
  }
  Load() async {
    token = await appPreferences.getLocalToken();
    userid= await appPreferences.getuserid();
    profile = await BlocProvider.of<ProfileCubit>(context).GetProfile(token,userid);
    balance1 = profile.balance!;
  }
  Load2() async {
    token =await appPreferences.getLocalToken();
    userid=await appPreferences.getuserid();
    goals = await BlocProvider.of<GoalCubit>(context).GetAllGoals(token,userid);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pushNewScreen(context,
              screen: AddGoalView(),
              withNavBar: true,
              pageTransitionAnimation: PageTransitionAnimation.cupertino);
        },
        child: Icon(Icons.add,color: Colors.black,),
        backgroundColor:Colors.white,

      ),
      appBar: AppBar(
        title: Text(AppStrings.Goals.tr()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  ImageAssets.profilePhoto,
                  fit: BoxFit.fitWidth,
                  width: 45,
                ),
                maxRadius: 34),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ImageSlideshow(
                width: double.infinity,
                height: 200,
                initialPage: 0,
                children: [
                  Image.asset(
                    'assets/images/goals.png',
                    fit: BoxFit.fill,
                  ),
                  Image.asset(
                    'assets/images/multitask.gif',
                    fit: BoxFit.cover,
                  ),
                ],
                onPageChanged: (value) {
                  print('Page changed: $value');
                },
                isLoop: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                      height: 160,
                      width: 230,
                      child: Lottie.asset(ImageAssets.GoalPhoto)),
                ),
              ],
            ),
             BlocBuilder<GoalCubit, GoalState>(
                    builder: (context, state) {
                      if(state is GoalsLoaded) {
                        goals=(state).goals;
                        return
                          goals.isEmpty
                              ? Center(child: Text(AppStrings.thereIsNoGoals.tr()))
                              :Container(
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              int amount=goals[index].amount==0?1:goals[index].amount;
                              progress=((balance1/amount)*100).toInt();
                             return buildgoal(goals[index], index,context,progress);
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 0.0,),
                            itemCount: goals.length,
                          ),
                        );
                      }
                      else
                        {
                          return Center(child: CircularProgressIndicator(),);
                        }
                    },
                  ),

          ],
        ),
      ),
    );
  }





}
