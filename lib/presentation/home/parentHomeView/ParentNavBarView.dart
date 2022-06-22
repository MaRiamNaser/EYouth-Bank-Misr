import 'package:bank_misr/Data/models/Category.dart';
import 'package:bank_misr/presentation/bottomBar/backButtonOverRide.dart';
import 'package:bank_misr/presentation/home/parentHomeView/childHomeView.dart';
import 'package:bank_misr/presentation/home/parentHomeView/parentHomeView.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../navgpage/floattingBotton.dart';
import '../../resources/routes_manager.dart';
import '../../setting/setting.dart';

class parentnavgscreen extends StatefulWidget {
  Category child;
  parentnavgscreen(this.child);

  @override
  _parentnavgscreenState createState() => _parentnavgscreenState(child);
}

class _parentnavgscreenState extends State<parentnavgscreen> {
  PersistentTabController _controller=PersistentTabController(initialIndex: 0);
  Category child;

  _parentnavgscreenState(this.child);

  @override
  Widget build(BuildContext context) {
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
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: false, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style16,
        onWillPop:(bool)=> onWillPop(context),
        onItemSelected: (int)
        {
          setState(() {

          });
        },// Choose the nav bar style with this property.
      ),
    );
  }
  List<Widget> _buildScreens() {
    return [
      ChildHomeView(child),
      Container(),
      settingView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: (AppStrings.Home.tr()),
        activeColorPrimary: ColorManager.darkPrimary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.add,color: Colors.white,),
          activeColorPrimary: ColorManager.darkPrimary,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          onPressed: (context){
            showDialog(
              context: context!,
              builder: (BuildContext context1) {
                return floattingbotton(context); },);
          }
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: (AppStrings.Setting.tr()),
        activeColorPrimary: ColorManager.darkPrimary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      )
    ];
  }


}
