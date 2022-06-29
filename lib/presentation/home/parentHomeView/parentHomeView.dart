import 'package:bank_misr/presentation/addTasksGoals/addGoal/add_goal.dart';
import 'package:bank_misr/presentation/home/parentHomeView/add_child_alert.dart';
import 'package:bank_misr/presentation/home/parentHomeView/childHomeView.dart';
import 'package:bank_misr/presentation/navgpage/navigation_page.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../Data/models/Category.dart';
import '../../addTasksGoals/addTask/add_task.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import 'ParentNavBarView.dart';

class ParentHomeView extends StatefulWidget {
  @override
  _ParentHomeViewState createState() => _ParentHomeViewState();
}
int parentrole=0;
class _ParentHomeViewState extends State<ParentHomeView> {
  bool floatExtended=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parentrole=1;
  }
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>blocGenerator().profileCubit),
        BlocProvider(
            create: (context) => blocGenerator().courseCubit),
        BlocProvider(
            create: (context) => blocGenerator().goalCubit
        ),
        BlocProvider(
            create: (context) => blocGenerator().taskCubit
        ),

      ],
      child: Scaffold(
           floatingActionButton:
           SpeedDial(
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
                   label: 'Add Child',
                   onTap: () {
                     showDialog(context: context, builder: (BuildContext context) {
                       return AddChildAlert();
                     },);
                   }
               ),
               SpeedDialChild(
                 child: Icon(Icons.playlist_add_check_sharp),
                 backgroundColor: Colors.blue,
                 label: 'Add Task',
                 onTap: () {
                   pushNewScreen(context, screen:AddTaskView(childs: categories2),withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);
                 },
               ),
               SpeedDialChild(
                 child: Icon(Icons.add_task),
                 backgroundColor: Colors.green,
                 label: 'Add Goal',
                 onTap: () {
                   pushNewScreen(context, screen:AddGoalView(childs: categories2),withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);
                 },
               ),
             ],
           ),

//        Container(
//          height:50 ,
//          width:140 ,
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(15),
//            color: ColorManager.darkPrimary,
//          ),
//          child: TextButton(
//            child: Text("Add Child",style:getRegularStyle(fontSize: 16,color: ColorManager.white) ,),
//            onPressed: () {
//            },
//          ),
//        ),
        appBar: AppBar(title: Text("Home"),),
        body: SingleChildScrollView(
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
                            "Welcome Mr.Wael",
                            style: getSemiBoldStyle(
                                fontSize: 20, color: ColorManager.white),
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
                          ]
                          ,image: DecorationImage(image: AssetImage(  "assets/images/image.jfif",
                      ),fit: BoxFit.cover)
                      ),
                    ),
                  )
                ],
              ),
               SizedBox(height: 11,),
               Center(
                 child: Text("Accounts Of Your Children",style: getSemiBoldStyle(
                     fontSize: 18, color: ColorManager.black)),
               ),
              SizedBox(height: 11,),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(AppPadding.p16),
                shrinkWrap: true,
                primary: false,
                itemCount: categories2.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>navgscreen(child: categories2[index],)));
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                                width: 1 / 393 * screensize.width * 360,
                                height: 1 / 825 * screensize.height * 100.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.grey),
                                  boxShadow: [
                                  BoxShadow(
                                  color: Colors.white70,
                                  offset: const Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 2.0,

                                )
                        ]
                    ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Hero(
                                          tag: categories2[index].img,
                                          child: CircleAvatar(
                                            minRadius: 32,
                                            backgroundImage: AssetImage(categories2[index].img),
                                          ),
                                        ),
                                        SizedBox(width: 40),
                                        Text(
                                          categories2[index].title,
                                          style: getBoldtStyle(
                                              fontSize: 15, color: ColorManager.black),
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios,size: 22,color: Colors.grey,)
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 1 / 825 * screensize.height * AppSize.s20,
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
