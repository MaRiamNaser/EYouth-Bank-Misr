import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/AddBody.dart';
import '../Widgets/text_field.dart';


class AddTaskView extends StatefulWidget {
  @override
  _AddTaskViewState createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  @override
  Widget build(BuildContext context) {
    return AddBody(AppStrings.addTask,ImageAssets.TaskPhoto);
  }
}
