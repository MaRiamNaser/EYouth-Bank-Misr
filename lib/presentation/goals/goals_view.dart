import 'package:bank_misr/Data/web_services/goal_services/goalChecked_services.dart';
import 'package:bank_misr/app/app_prefs.dart';

import 'package:bank_misr/business_logic/goalBloc/goal_cubit.dart';
import 'package:bank_misr/presentation/addTasksGoals/addGoal/add_goal.dart';
import 'package:bank_misr/presentation/addTasksGoals/edit_goal/edit_goal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:bank_misr/Data/models/goal.dart';
import 'package:bank_misr/Data/repo/goal_repo.dart';
import 'package:bank_misr/business_logic/profileBloc/profile_cubit.dart';
import 'package:bank_misr/data/models/Profile.dart';
import 'package:bank_misr/presentation/home/home_view.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../Data/web_services/goal_services/goalConfirmDelete_services.dart';
import '../../Data/web_services/goal_services/goalConfirmEdit_services.dart';
import '../../Data/web_services/goal_services/goal_services.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

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

  int balance1=9000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
          print(" ********************************** *********************88");

    Load();
    loadBalance();
    
  }


  Load() async{
    goals = await GoalRepo(GoalServices())
        .GetAllGoals(await appPreferences.getLocalToken());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");
  }

    loadBalance() async {
      token = await appPreferences.getLocalToken();
      print(" ********************************** *********************88");
     var profile = await BlocProvider.of<ProfileCubit>(context).GetProfile(token);
     print(profile.balance.toString()+"  *********************88");
    balance1 = profile.balance;
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.primary,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, Routes.addGoalViewRoute);
        },
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
                            itemBuilder: (context, index) =>
                                buildgoal(goals[index], index),
                            separatorBuilder: (context, index) =>
                                SizedBox(
                                  height: 0.0,
                                ),
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

  Widget buildgoal(Goal goal, int index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: ColorManager.grey, width: 1.5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            (index + 1).toString() + " -",
                            style: getMediumStyle(
                              fontSize: FontSize.s16,
                              color: ColorManager.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: 279,
                          child: Text(
                            goal.title,
                            style: getMediumStyle(
                              fontSize: 16,
                              color: ColorManager.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      height: 2,
                    ),

                    Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.all(20),
                      child:Text("") //ProgressGoalIndicator(balance1, goal.amount),
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 28,
                            ),
                            onPressed: () {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context1) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        scrollable: true,
                                        backgroundColor: ColorManager.primary,
                                        title: Center(
                                          child: Text(
                                            "congratulation",
                                            style: getBoldtStyle(
                                                fontSize: 18,
                                                color: ColorManager.white),
                                          ),
                                        ),
                                        content: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Lottie.asset(
                                                "assets/images/7455-loading1.json",
                                                height: 145,
                                                width: 250,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                    width: 190,
                                                    child: Text(
                                                      "Did you achieve it ",
                                                      style: getSemiBoldStyle(
                                                          fontSize: 14,
                                                          color: ColorManager
                                                              .white),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          Center(
                                            child: Container(
                                              height: 30,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: ColorManager.darkPrimary,
                                              ),
                                              child: TextButton(
                                                child: Text(
                                                  'Ok',
                                                  style: getRegularStyle(
                                                      color:
                                                          ColorManager.white),
                                                ),
                                                onPressed: () {

                                                  checked.Checked(
                                                      token, goal.id);
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context,
                                                          Routes.goals);

                                                  Navigator.of(context1).pop();
                                                  BlocProvider.of<GoalCubit>(context).DeleteGoal(goal.id);


                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    });
                              });
                            },
                          ),
                          IconButton(
                            icon: (Icon(Icons.edit_rounded)),
                            color: ColorManager.black,
                            onPressed: () {

                              edit.confirmEdit(goal.id, goal.title,
                                  goal.description, context);

                              // edit.confirmEdit(goal.id, goal.title,
                              //     goal.description, context);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> EditGoal(goal.id,goal.title,Description)));

                            },
                          ),
                          IconButton(
                            icon: (Icon(Icons.delete_rounded)),
                            color: ColorManager.error,

                            onPressed: () async {
                              // confirmDelete(goal.id);
                              delete.confirmDelete(goal.id, context);

                            onPressed: ()  {
                              // confirmDelete(goal.id);
                              // delete.confirmDelete(goal.id, context);
                              showDialog(context: context, builder: (BuildContext context1)=>AlertDialog(
                                title: Text("Delete"),
                                content: Text(" Are you sure !?"),
                                actions: [
                                  FlatButton(child: Text("yes"),
                                    onPressed: () async {

                                      BlocProvider.of<GoalCubit>(context).DeleteGoal(goal.id);
                                      Navigator.pop(context1);

                                    }, ),
                                  FlatButton(onPressed: (){
                                  }, child: Text("no")),
                                ],

                              )
                              );


                            },
                          ),
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      );



      Widget ProgressGoalIndicator(int total_balance, int goal_amount){
      print(total_balance.toString()+"  "+goal_amount.toString());
      double percentage = (goal_amount/total_balance ) ;
        return StepProgressIndicator(
                        totalSteps: 100,
                        currentStep:percentage.toInt(),
                        size: 8,
                        padding: 0,
                        selectedColor: Colors.green,
                        unselectedColor: Colors.yellow,
                        roundedEdges: Radius.circular(10),
        );
      }

}
