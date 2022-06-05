import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/setting/setting.dart';
import 'package:flutter/material.dart';

import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class home_layout extends StatefulWidget{
  @override
  State<home_layout> createState() => _home_layoutState();
}

class _home_layoutState extends State<home_layout> {
  int currentindex=0;
  List<Widget> screens=[
    // newtasks(),
    // donetasks(),
    // archievetasks(),
    settingView(),
    settingView(),
    settingView(),
    settingView(),
  ];
  List<String> titles=[
    "Create your Tasks",
    "Your Done Tasks",
    "Archieve",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Setting",
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