import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../courses/coursesView.dart';
import '../home/home_view.dart';
import '../profile/profile_view.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class BottomBar extends StatefulWidget{
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentindex=0;
  List<Widget> screens=[

    BlocProvider(
              create: (context) => blocGenerator().profileCubit,
              child: HomeView(),
            ),
    coursesView(),
    BlocProvider(
              create: (context) => blocGenerator().profileCubit,
              child:  ProfileView()   ,
            ),
    settingView(),
  ];
  List<String> titles=[
    "Home",
    "Courses",
    "Profile",
    "Setting",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "${titles[currentindex]}",
          style: getBoldtStyle(fontSize:FontSize.s20,color: ColorManager.black)
          ,)
        ,),
      body: screens[currentindex],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   child: Icon(Icons.add),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        currentIndex: currentindex,
        onTap: (index){
          setState(() {
            currentindex=index;
          });
          print(index);
        },
        items: [

          BottomNavigationBarItem(

            icon: Icon(Icons.home,color: ColorManager.primary,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.slideshow_outlined,color: ColorManager.primary,),
            label: "Courses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,color: ColorManager.primary,),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu,color: ColorManager.primary,),
            label: "setting",
          ),

        ],
        type: BottomNavigationBarType.fixed,

      ) ,


    );
  }
}