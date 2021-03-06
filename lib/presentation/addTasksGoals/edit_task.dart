import 'dart:convert';
import 'dart:io';


import 'package:bank_misr/Data/web_services/task_services/taskConfirmEdit_services.dart';
import 'package:bank_misr/app/app_prefs.dart';
import 'package:bank_misr/business_logic/taskBloc/task_cubit.dart';
import 'package:bank_misr/presentation/addTasksGoals/Widgets/alert_dialog.dart';
import 'package:bank_misr/presentation/goals/Goal.dart';
import 'package:bank_misr/presentation/goals/addGoalView.dart';
import 'package:bank_misr/presentation/goals/goals_view.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:bank_misr/presentation/tasks/tasks_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
// import '../Widgets/text_field.dart';
import 'Widgets/text_field.dart';

String ID="";
String Title="";
String Description="";
class EditTask extends StatefulWidget {


  EditTask(String id, String title, String description)
  {
    ID=id;
    Title=title;
    Description=description;
  }

  @override
  _EditTaskState createState() => _EditTaskState();
}

Color color=ColorManager.lightPrimary;
Color color2=ColorManager.grey;
class _EditTaskState extends State<EditTask> {
  String title=AppStrings.addTask;
  String photo=ImageAssets.TaskPhoto;
  String choice="Task";
  String alertPhoto=ImageAssets.alertTask;
  var titleTextController=TextEditingController();
  var descTextController=TextEditingController();
  AppPreferences appPreferences = AppPreferences();
  taskConfirmEdit taskedit=taskConfirmEdit();
  var token="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleTextController.text=Title;
    descTextController.text=Description;
    Load();
  }
  Load() async {

    token = await appPreferences.getLocalToken();
    print("token :"+token);
  }

  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;
    return Scaffold(

      body:
      SingleChildScrollView(
        child:
        Column(
          children: [
            Center(
              child: SizedBox(height: 1/825 * screensize.height *222 ,
                  width: 1/393* screensize.width * 250,
                  child:Lottie.asset(photo)),
            ),
            SizedBox(height: 1/825 * screensize.height * AppSize.s20,),
            Container(
              padding: EdgeInsets.all(AppPadding.p18),
              height: 1/825 * screensize.height *440 ,
              width: 1/393* screensize.width * 300,
              decoration:  BoxDecoration(
                border: Border.all(
                    color: ColorManager.grey
                ),
                borderRadius: BorderRadius.only(topRight:Radius.circular(AppSize.s50) ,bottomLeft: Radius.circular(AppSize.s50)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Title"),
                  SizedBox(height: 1/825 * screensize.height * AppSize.s8 ,),
                  getTextField("$choice Title here....",1/825 * screensize.height *80,2,AppPadding.p2,AppSize.s20,titleTextController,(text){
                    setState(() {
                      titleTextController.text.isNotEmpty&&descTextController.text.isNotEmpty?color=ColorManager.darkPrimary:color=ColorManager.lightPrimary;
                      titleTextController.text.isNotEmpty&&descTextController.text.isNotEmpty?color2=ColorManager.white:color2=ColorManager.grey;
                    });
                  },context,screensize),
                  SizedBox(height: 1/825 * screensize.height *AppSize.s8 ,),
                  const Text("Description"),
                  SizedBox(height: 1/825 * screensize.height *AppSize.s8 ,),
                  getTextField("Write Your $choice here...",1/825 * screensize.height *180,8,AppPadding.p20,AppSize.s20,descTextController,(text){
                    setState(() {
                      titleTextController.text.isNotEmpty&&descTextController.text.isNotEmpty?color=ColorManager.darkPrimary:color=ColorManager.lightPrimary;
                      titleTextController.text.isNotEmpty&&descTextController.text.isNotEmpty?color2=ColorManager.white:color2=ColorManager.grey;
                    });
                  },context,screensize),
                  SizedBox(height: 1/825 * screensize.height *AppSize.s18 ,),
                  Center(
                    child: Container(
                      height: 1/825 * screensize.height *46 ,
                      width: 1/393* screensize.width * 133,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: color,
                      ) ,

                      child: TextButton(onPressed: ()async{
                        if(titleTextController.text.isNotEmpty&&descTextController.text.isNotEmpty) {
                          BlocProvider.of<TaskCubit>(context).EditTask(token, ID, titleTextController.text,descTextController.text);

                          showDialog(context: context, builder: (BuildContext context1) {
                            return  alertdialog(choice,alertPhoto,context);
                          });
                        }
                      },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:  [
                              Text("Edit",style: TextStyle(color: color2),),
                              Icon(Icons.add,color:  color2,)
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
