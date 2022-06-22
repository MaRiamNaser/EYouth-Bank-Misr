import 'dart:convert';
import 'dart:io';

import 'package:bank_misr/Data/api_links.dart';
import 'package:bank_misr/Data/web_services/task_services/addTask_services.dart';
import 'package:bank_misr/presentation/addTasksGoals/Widgets/alert_dialog.dart';
import 'package:bank_misr/presentation/goals/Goal.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/text_field.dart';

class AddBody extends StatefulWidget {
  String title;
  String photo;
  String choice;
  String alertPhoto;

  AddBody(this.title, this.photo, this.choice, this.alertPhoto);

  @override
  _AddBodyState createState() =>
      _AddBodyState(this.title, this.photo, choice, alertPhoto);
}

Color color = ColorManager.lightPrimary;
Color color2 = ColorManager.grey;

class _AddBodyState extends State<AddBody> {
  var titleTextController = TextEditingController();
  var descTextController = TextEditingController();
  var amountTextController = TextEditingController();
  EndPoints endPoints = EndPoints();
  String _selected = "Once";
  String title;
  String photo;
  String choice;
  String alertPhoto;
  var token;
  var userid;

  _AddBodyState(this.title, this.photo, this.choice, this.alertPhoto);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  Future<void> load() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token");
    userid = sharedPreferences.getString("userid");
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                  height: 1 / 825 * screensize.height * 140,
                  width: 1 / 393 * screensize.width * 250,
                  child: Lottie.asset(photo)),
            ),
            SizedBox(
              height: 1 / 825 * screensize.height * AppSize.s20,
            ),
            Container(
              padding: EdgeInsets.all(AppPadding.p18),
              height: 1 / 825 * screensize.height * 498,
              width: 1 / 393 * screensize.width * 300,
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.grey),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppSize.s50),
                    bottomLeft: Radius.circular(AppSize.s50)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.title.tr()),
                    SizedBox(
                      height: 1 / 825 * screensize.height * AppSize.s8,
                    ),
                    getTextField(
                        choice == AppStrings.Goal.tr()
                            ? AppStrings.GoalTitlehere.tr()
                            : AppStrings.TaskTitlehere.tr(),
                        1 / 825 * screensize.height * 80,
                        2,
                        AppPadding.p2,
                        AppSize.s20,
                        titleTextController, (text) {
                      setState(() {
                        titleTextController.text.isNotEmpty &&
                                descTextController.text.isNotEmpty
                            ? color = ColorManager.darkPrimary
                            : color = ColorManager.lightPrimary;
                        titleTextController.text.isNotEmpty &&
                                descTextController.text.isNotEmpty
                            ? color2 = ColorManager.white
                            : color2 = ColorManager.grey;
                      });
                    }, context, screensize),
                    SizedBox(
                      height: 1 / 825 * screensize.height * AppSize.s8,
                    ),
                    Text(AppStrings.Description.tr()),
                    SizedBox(
                      height: 1 / 825 * screensize.height * AppSize.s8,
                    ),
                    getTextField(
                        choice == AppStrings.Goal.tr()
                            ? AppStrings.writeGoalHere.tr()
                            : AppStrings.writeTaskHere.tr(),
                        1 / 825 * screensize.height * 140,
                        8,
                        AppPadding.p20,
                        AppSize.s20,
                        descTextController, (text) {
                      setState(() {
                        titleTextController.text.isNotEmpty &&
                                descTextController.text.isNotEmpty
                            ? color = ColorManager.darkPrimary
                            : color = ColorManager.lightPrimary;
                        titleTextController.text.isNotEmpty &&
                                descTextController.text.isNotEmpty
                            ? color2 = ColorManager.white
                            : color2 = ColorManager.grey;
                      });
                    }, context, screensize),
                    SizedBox(
                      height: 1 / 825 * screensize.height * AppSize.s8,
                    ),
                    choice == AppStrings.Goal.tr()
                        ? Text(AppStrings.amount.tr())
                        : SizedBox(),
                    choice == AppStrings.Goal.tr()
                        ? SizedBox(
                            height: 1 / 825 * screensize.height * AppSize.s8,
                          )
                        : SizedBox(),
                    choice == AppStrings.Goal.tr()
                        ? getTextField2(
                            AppStrings.amount.tr(),
                            1 / 825 * screensize.height * 65,
                            2,
                            AppPadding.p2,
                            AppSize.s20,
                            amountTextController,
                            (text) {},
                            context,
                            screensize)
                        : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppStrings.repetition.tr()),
                                  SizedBox(
                                    height: 1 /
                                        825 *
                                        screensize.height *
                                        AppSize.s8,
                                  ),
                                  DropdownButton<String>(
                                    dropdownColor: ColorManager.lightPrimary,
                                    items: <String>[
                                      AppStrings.Once.tr(),
                                      AppStrings.Daily.tr(),
                                          AppStrings.Weekly.tr(),
                                      AppStrings.Monthly.tr()
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (v) {
                                      setState(() {
                                        _selected = v!;
                                      });
                                    },
                                    value: _selected,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppStrings.amount.tr()),
                                  SizedBox(
                                    height: 1 /
                                        825 *
                                        screensize.height *
                                        AppSize.s8,
                                  ),
                                  getTextField2(
                                      AppStrings.amount.tr(),
                                      1 / 825 * screensize.height * 65,
                                      2,
                                      AppPadding.p2,
                                      AppSize.s20,
                                      amountTextController,
                                      (text) {},
                                      context,
                                      screensize),
                                ],
                              )
                            ],
                          ),
                    SizedBox(
                      height: 1 / 825 * screensize.height * AppSize.s18,
                    ),
                    Center(
                      child: Container(
                        height: 1 / 825 * screensize.height * 46,
                        width: 1 / 393 * screensize.width * 133,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: color,
                        ),
                        child: TextButton(
                            onPressed: () async {
                              if (titleTextController.text.isNotEmpty &&
                                  descTextController.text.isNotEmpty) {
                                if (await AddTaskServices().AddTaskorGoal(
                                    choice == AppStrings.Goal.tr()
                                        ? endPoints.goalCreateLink
                                        : endPoints.taskCreateLink,
                                    titleTextController.text,
                                    descTextController.text,
                                    token!,
                                    userid,
                                    amountTextController.text)) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context1) {
                                        return alertdialog(
                                            choice, alertPhoto, context);
                                      });
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  AppStrings.add.tr(),
                                  style: getRegularStyle(color: color2),
                                ),
                                Icon(
                                  Icons.add,
                                  color: color2,
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
