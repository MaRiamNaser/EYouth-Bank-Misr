import 'package:bank_misr/presentation/rankingPage/rankingWidgets.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/taskBloc/task_cubit.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class rankingView extends StatefulWidget {

  // late List<rank> ranks = [];
  @override
  State<rankingView> createState() => _rankingViewState();
}

class _rankingViewState extends State<rankingView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text(AppStrings.Home.tr()),  actions: [
          CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                ImageAssets.profilePhoto,
                fit: BoxFit.fitWidth,
                width: 45,
              ),
              maxRadius: 34),

        ] ),
        body: Column(
          children: [
            Container(
              height: 260,
              width: double.infinity,
              color: ColorManager.primary,
              child:   Text("Inside Container "),
            ),
            SafeArea(child:
            SingleChildScrollView(
              child: Column(children: [
                





              ],),
            )

            ),


          ],

        ),


      ),

    );
  }
}
