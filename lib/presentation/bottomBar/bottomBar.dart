import 'package:bank_misr/presentation/addTasksGoals/Widgets/AddBody.dart';
import 'package:bank_misr/presentation/addTasksGoals/addGoal/add_goal.dart';
import 'package:bank_misr/presentation/bottomBar/backButtonOverRide.dart';
import 'package:bank_misr/presentation/goals/addGoalView.dart';
import 'package:bank_misr/presentation/goals/goals_view.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/setting/setting.dart';
import 'package:bank_misr/presentation/tasks/addTaskView.dart';
import 'package:bank_misr/presentation/tasks/tasks_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:rflutter_alert/rflutter_alert.dart';




import '../addTasksGoals/addTask/add_task.dart';
import '../courses/coursesView.dart';
import '../home/home_view.dart';
import '../profile/profile_view.dart';
import '../resources/assets_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
 int currentindex=0;
class BottomBar extends StatefulWidget{
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  
  List<Widget> screens=[

    BlocProvider(

      create: (context) => blocGenerator().profileCubit,
      child: HomeView(),
    ),
  BlocProvider(
  create: (context) => blocGenerator().courseCubit,
    child :coursesView(0),
  ),
    BlocProvider(
  create: (context) => blocGenerator().profileCubit,
  child: ProfileView(),
  ),


    settingView(),
    AddTaskView(),
    AddGoalView(),

    coursesView(0),
    TasksView(),
    Goalsview()
    

  ];
  List<String> titles=[
    "Home",
    "Courses",
    "Profile",
    "Setting",
    "Add Task",
    "Add Goal",
    "Courses",
    "Tasks",
    "Goals"
  ];

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
     
      body: screens[currentindex],


   floatingActionButton: Visibility(
          visible: !keyboardIsOpen,
          child: FloatingActionButton(
            backgroundColor: ColorManager.darkPrimary,//Floating action button on Scaffold
            onPressed: (){
              Alert(
                context: context,
                buttons: [

                  DialogButton(
                   color:ColorManager.primary,
                    height: 50,

                    child: Text(
                      "Add Task",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        currentindex=4;
                      });},

                  ),
                  DialogButton(
                    color:ColorManager.primary,

                    height: 50,
                    child: Text(
                      "Add Goal",
                      style: TextStyle(color: Colors.white, fontSize: 20),

                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        currentindex=5;
                      });},


                  ),

                ],
              ).show();

            },

            child: Icon(Icons.add), //icon inside button
          ),// your FloatingActionButton
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
      color:ColorManager.primary,
      shape: CircularNotchedRectangle(), //shape of notch
      notchMargin: 3, //notche margin between floating button and bottom appbar
      child: Row( //children inside bottom appbar
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox.fromSize(
          size: Size(56, 56),
          child: ClipOval(
            child: Material(
              color: ColorManager.primary,
              child: InkWell(

                onTap: () {
                  setState(() {
                    currentindex=0;
                  });
                },
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.home, color: Colors.white,), // <-- Icon
                    Text("Home",style: TextStyle(color: ColorManager.white)),

                    // <-- Text
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox.fromSize(
          size: Size(56, 56),
          child: ClipOval(
            child: Material(
              color: ColorManager.primary,
              child: InkWell(

                onTap: () {
                  setState(() {
                    currentindex=1;
                  });
                },
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.slideshow_outlined, color: Colors.white,), // <-- Icon
                    Text("Videos",style: TextStyle(color: ColorManager.white)),

                    // <-- Text
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox.fromSize(
          size: Size(56, 56),
          child: ClipOval(
            child: Material(
              color: ColorManager.primary,
              child: InkWell(

                onTap: () {
                  setState(() {
                    currentindex=2;
                  });
                },
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.person_outline, color: Colors.white,), // <-- Icon
                    Text("Profile",style: TextStyle(color: ColorManager.white)),

                    // <-- Text
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox.fromSize(
          size: Size(56, 56),
          child: ClipOval(
            child: Material(
              color: ColorManager.primary,
              child: InkWell(

                onTap: () {
                  setState(() {
                    currentindex=3;
                  });
                },
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Icon(Icons.menu, color: Colors.white,), // <-- Icon
                    Text("Setting",style: TextStyle(color: ColorManager.white),),

                    // <-- Text
                  ],
                ),
              ),
            ),
          ),
        ),


      ],
      ),

      )
      ),
    );
  }
}





// bottomNavigationBar: BottomNavigationBar(
// iconSize: 25,
// currentIndex: currentindex,
// onTap: (index){
// setState(() {
// currentindex=index;
// });
// print(index);
// },
// items: [
//
// BottomNavigationBarItem(
//
// icon: Icon(Icons.home,color: ColorManager.primary,),
// label: "Home",
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.slideshow_outlined,color: ColorManager.primary,),
// label: "Courses",
// ),
// // floatingActionButton: FloatingActionButton(
// //   onPressed: (){},
// //   child: Icon(Icons.add),
// // ),
//
//
// BottomNavigationBarItem(
// icon: Icon(Icons.person_outline,color: ColorManager.primary,),
// label: "Profile",
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.menu,color: ColorManager.primary,),
// label: "setting",
// ),
//
// ],
// type: BottomNavigationBarType.fixed,
// //
// ) ,