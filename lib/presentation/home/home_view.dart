import 'package:bank_misr/presentation/home/Widgets/stack_widget.dart';
import 'package:bank_misr/presentation/home/Widgets/welcome_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import 'Widgets/categories_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                ImageAssets.profilePhoto,
                fit: BoxFit.fitHeight,
              ),
              maxRadius: 22)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StackWidget(),
            SizedBox(height: 1/825 * screensize.height * 12.5),
            WelcomeWidget(),
            SizedBox(height: 1/825 * screensize.height * 12.5),
              CategoriesWidget(),
          ],
        ),
      ),
    );
  }
}
