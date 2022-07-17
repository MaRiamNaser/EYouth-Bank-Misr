import 'package:bank_misr/Data/models/User.dart';
import 'package:bank_misr/business_logic/profileBloc/profile_cubit.dart';
import 'package:bank_misr/presentation/addTasksGoals/addGoal/add_goal.dart';
import 'package:bank_misr/presentation/home/parentHomeView/add_child_alert.dart';
import 'package:bank_misr/presentation/home/parentHomeView/childHomeView.dart';
import 'package:bank_misr/presentation/navgpage/navigation_page.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../Data/models/Category.dart';
import '../../../app/app_prefs.dart';
import '../../addTasksGoals/addTask/add_task.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';

class ParentHomeView extends StatefulWidget {
  @override
  _ParentHomeViewState createState() => _ParentHomeViewState();
}

int parentrole = 0;

class _ParentHomeViewState extends State<ParentHomeView> {
  bool floatExtended = false;
  late User parent;
  AppPreferences appPreferences = AppPreferences();
  late var token;
  late var userid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parentrole = 1;
    Load();
  }
  Load()async
  {
    token = await appPreferences.getLocalToken();
    userid=await appPreferences.getuserid();
    parent =await  BlocProvider.of<ProfileCubit>(context).GetProfile(token,userid);
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => blocGenerator().courseCubit),
        BlocProvider(create: (context) => blocGenerator().goalCubit),
        BlocProvider(create: (context) => blocGenerator().taskCubit),
      ],
      child: Scaffold(
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: SpeedDial(
            direction: SpeedDialDirection.up,
            animatedIcon: AnimatedIcons.add_event,
            animatedIconTheme: IconThemeData(size: 22.0),
            visible: true,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            onOpen: () => print('OPENING DIAL'),
            onClose: () => print('DIAL CLOSED'),
            tooltip: 'Speed Dial',
            heroTag: 'speed-dial-hero-tag',
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 8.0,
            shape: CircleBorder(),
            children: [
              SpeedDialChild(
                  child: Icon(Icons.accessibility),
                  backgroundColor: Colors.red,
                  label: AppStrings.AddChild.tr(),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context1) {
                        return AddChildAlert(context);
                      },
                    );
                  }),
              SpeedDialChild(
                child: Icon(Icons.playlist_add_check_sharp),
                backgroundColor: Colors.blue,
                label: AppStrings.addTask.tr(),
                onTap: () {
                  pushNewScreen(context,
                      screen: AddTaskView(childs: parent.children),
                      withNavBar: true,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino);
                },
              ),
              SpeedDialChild(
                child: Icon(Icons.add_task),
                backgroundColor: Colors.green,
                label: AppStrings.addGoal.tr(),
                onTap: () {
                  pushNewScreen(context,
                      screen: AddGoalView(childs: parent.children),
                      withNavBar: true,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(AppStrings.Home.tr()),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if(state is ProfilesLoaded) {
              parent=(state).profile;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 1 / 825 * screensize.height * 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(AppSize.s18),
                                  bottomLeft: Radius.circular(AppSize.s18))),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 1 / 825 * screensize.height * 25,
                                ),
                                Center(
                                    child: Text(
                                     AppStrings.welcome.tr()+" "+ parent.fullname!,
                                      style: getSemiBoldStyle(
                                          fontSize: 20,
                                          color: ColorManager.white),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 1 / 825 * screensize.height * 150,
                            width: 1 / 825 * screensize.height * 150,
                            margin: EdgeInsets.only(top: 110),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  )
                                ],
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/image.jfif",
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Center(
                      child: Text(AppStrings.AccountsOfYourChildren.tr(),
                          style: getSemiBoldStyle(
                              fontSize: 18, color: ColorManager.black)),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    parent.children.isNotEmpty
                        ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(AppPadding.p16),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: parent.children.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                builder: (context) =>
                                    navgscreen(
                                      child: parent.children[index],
                                    )));
                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15),
                                      width:
                                      1 / 393 * screensize.width * 360,
                                      height: 1 /
                                          825 *
                                          screensize.height *
                                          100.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(30),
                                          border: Border.all(
                                              color: Colors.grey),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white70,
                                              offset:
                                              const Offset(0.0, 1.0),
                                              //(x,y)
                                              blurRadius: 2.0,
                                            )
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              parent.children[index]
                                                  .image.isNotEmpty? Hero(
                                                tag: parent.children[index]
                                                    .image ,
                                                child: CircleAvatar(
                                                  minRadius: 32,
                                                  backgroundImage:
                                                  NetworkImage(parent
                                                      .children[
                                                  index]
                                                      .image ),
                                                ),
                                      ):
                                                  CircleAvatar(
                                                    minRadius: 23,
                                                    backgroundImage:AssetImage("assets/images/child1.jpg"),
                                                  )
                                              ,
                                              SizedBox(width: 40),
                                              Text(
                                                parent.children[index].fullname!,
                                                style: getBoldtStyle(
                                                    fontSize: 15,
                                                    color:
                                                    ColorManager.black),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 22,
                                            color: Colors.grey,
                                          )
                                        ],
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 1 /
                                    825 *
                                    screensize.height *
                                    AppSize.s20,
                              ),
                            ],
                          ),
                        );
                      },
                    )
                        : Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Center(
                          child: Text("There is No Children Yet",
                              style: getSemiBoldStyle(
                                  color: Colors.black, fontSize: 14))),
                    )
                  ],
                ),
              );
            }
            else
              {
                return Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Center(child: CircularProgressIndicator(),),
                );
              }
          },
        ),
      ),
    );
  }
}
