import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bank_misr/presentation/choose_which_view/choose_which_view_page.dart';
import 'package:bank_misr/presentation/lesson2/lesson2.dart';
import 'package:bank_misr/presentation/lesson4/characteristics_of_money.dart';
import 'package:bank_misr/presentation/lesson4/slide_show.dart';
import 'package:bank_misr/presentation/lesson5/page/category_page.dart';
import 'package:bank_misr/presentation/lesson5/fake_data/categories.dart' as Categories;
import 'package:bank_misr/presentation/lesson5/ready_to_test_page.dart';
import 'package:bank_misr/presentation/resources/constants_manager.dart';
import 'package:flutter/material.dart';
import '../resources/assets_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
  //Navigator.pushReplacementNamed(context, Routes.whichViewRoute);
  
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReadyToTestPage()),
                      );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            AnimatedSplashScreen(
              splashIconSize: 70,
              splash:
             const Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
              nextScreen: Container(),
              disableNavigation: true,
              //splashTransition: SplashTransition.sizeTransition,
              splashTransition: SplashTransition.fadeTransition,
            
            ),
             Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text("Powered by Eyouth Tech team.")),
                  )
          ],
       
        )
    ,);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  
  }

}
