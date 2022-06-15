import 'dart:io';
import 'package:bank_misr/Data/models/Task.dart';
import 'package:bank_misr/Data/web_services/task_services/taskConfirmDelete_services.dart';
import 'package:bank_misr/Data/web_services/task_services/taskConfirmEdit_services.dart';
import 'package:bank_misr/Data/web_services/task_services/task_services.dart';
import 'package:bank_misr/app/app_prefs.dart';
import 'package:bank_misr/presentation/addTasksGoals/addTask/add_task.dart';
import 'package:bank_misr/presentation/home/home_view.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:lottie/lottie.dart';

import '../../Data/repo/task_repo.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Data/repo/task_repo.dart';
import '../../Data/web_services/balance_services.dart';

import '../../Data/web_services/task_services/taskConfirmChecked_services.dart';
import '../addTasksGoals/edit_task.dart';
import '../bottomBar/bottomBar.dart';
import '../resources/routes_manager.dart';
import 'package:http/http.dart' as http;


class TasksView extends StatefulWidget {
  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  taskConfirmChecked checked=taskConfirmChecked();
  AppPreferences appPreferences = AppPreferences();
  taskconfirmDeleteServices delete= taskconfirmDeleteServices();
  taskConfirmEditServices edit= taskConfirmEditServices();
  var token;
  late List<Task> tasks=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();

  }
  Load()async
  {

    tasks=await TaskRepo(TaskServices()).GetAllTasks(await appPreferences.getLocalToken());
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    token=sharedPreferences.getString("token");
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         floatingActionButton: FloatingActionButton(
          backgroundColor: ColorManager.primary,
           child: Icon(Icons.add),
            onPressed: (){
            Navigator.pushNamed(context, Routes.addTaskViewRoute,arguments: 1);
        },),
      appBar: AppBar(title: Text(AppStrings.Tasks.tr()),  actions: [
        Padding(
          padding: const EdgeInsets.only(right:10.0),
          child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                ImageAssets.profilePhoto,
                fit: BoxFit.fitWidth,
                width: 45,
              ),
              maxRadius: 34),
        )
      ],),
      // appBar: AppBar(
      //   title: Text(
      //     "Tasks",
      //     style: getBoldtStyle(fontSize:FontSize.s20,color: ColorManager.white)
      //     ,)
      //   ,),
    body: Column(
    children: [
    Container(
      child: ImageSlideshow(
        width: double.infinity,
        height: 200,
        initialPage: 0,
        children: [
          Image.asset(
            'assets/images/multitask.gif',
            fit: BoxFit.fill,
          ),
          Image.asset(
            'assets/images/multitask.gif',
            fit: BoxFit.cover,
          ),
        ],
        onPageChanged: (value) {
          print('Page changed: $value');
        },
        isLoop: true,
      ),
    ),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
             Center(
                  child: SizedBox(height: 190 ,
                      width:  210,
                      child:Lottie.asset(ImageAssets.TaskPhoto)),
                ),
          ],
      ),
      Expanded(
      child: SingleChildScrollView(
         scrollDirection: Axis.vertical,
      child: Column(
        children: [
            tasks.length == 0? Center(child: Text(AppStrings.thereIsNoTasks.tr())): 
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => buildtask(tasks[index],index),
            separatorBuilder: (context, index) => SizedBox(
              height: 10.0,
            ),
            itemCount: tasks.length,
          ),
        ],
      ),
      ),
      )
    ],
    ),


    );


  }
  Widget buildtask(Task task, int index) =>

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 5),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border:Border.all(color:ColorManager.grey,width: 1.5),
              borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomRight:Radius.circular(15), )
          ),
          child: Row(

            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

                        Padding(

                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        (index+1).toString(),
                        style: getBoldtStyle(
                          fontSize: FontSize.s16,
                          color:ColorManager.black,
                        ),

                      ),
                    ),
                        Container(
                      width: 190,
                      child: Text(

                        task.title,
                        style: getBoldtStyle(
                          fontSize:FontSize.s16,
                          color: Colors.black,


                        ),
                        maxLines: 3,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.left,
                      ),
                    ),
                        IconButton(icon: (Icon(Icons.check_circle_outline,)),iconSize: FontSize.s25,color:ColorManager.green, onPressed: () {
                        setState(() async {

                          await balanceServices().EditBalance(token, 20);
                          showDialog(context: context, builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
                              scrollable: true,
                              backgroundColor: ColorManager.primary,
                              title:  Center(
                                child: Text(AppStrings.Well_Done.tr(),
                                  style: getBoldtStyle(fontSize:18,color: ColorManager.white),),
                              ),
                              content: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Lottie.asset("assets/images/7455-loading1.json",height: 145,width:250, ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                          width: 190,
                                          child: Text("${AppStrings.EGP2_Has_Been_Added_To_Your_Wallet.tr()}\n ${AppStrings.Your_Balance_Now_is.tr()} ${balance+20}",
                                            style: getSemiBoldStyle(fontSize:14,color: ColorManager.white),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                Center(
                                  child: Container(
                                    height:30 ,
                                    width:100 ,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: ColorManager.darkPrimary,
                                    ),
                                    child: TextButton(

                                      child: Text(AppStrings.Ok.tr(),style:getRegularStyle(color: ColorManager.white) ,),
                                      onPressed: ()
                                      {
                                        checked.Checked(token,task.id);

                                        Navigator.of(context).pop();
                                        currentindex=2;
                                        Navigator.pushReplacementNamed(context, Routes.homeLayout);
                                      },
                                    ),
                                  ),
                                )

                              ],
                            );

                          });

                        });
                        },
                        ),
                        IconButton(icon: (Icon(Icons.edit_rounded)),color:ColorManager.black, onPressed: () {
                          // confirmEdit(task.id,task.title,task.description);
                          edit.confirmEdit(task.id, task.title,task.description, context);
                        },

                        ),
                        IconButton(icon: (Icon(Icons.delete_rounded)),color:ColorManager.error, onPressed: () {
                          // confirmDelete(task.id);
                          delete.confirmDelete(task.id, context);

                        },

                        ),
                      ],


              ////////////////////////////

          ),
        ),
      );
  // void confirmDelete(String id) {
  //   showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
  //     title: Text("Delete"),
  //     content: Text(" Are you sure !?"),
  //     actions: [
  //       FlatButton(child: Text("yes"),
  //         onPressed: () async {
  //         var response=await  http.delete(Uri.parse('http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/task/delete/$id'),
  //             headers: <String,String>{"Content-Type": "application/json",
  //               HttpHeaders.authorizationHeader:"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmE1YjMzMDQ2ZGNiZjBkZWVjYzQzNmUiLCJpYXQiOjE2NTUwMjcwODJ9.XdHxFQGF4NGEQik_2V-Qbw5nZaERO8J7KIALYBBwJj8"});
  //         print(response.statusCode);
  //           Navigator.push(context, MaterialPageRoute(builder: (context)=> TasksView()));
  //
  //
  //         }, ),
  //       FlatButton(onPressed: (){
  //         Navigator.pop(context);
  //
  //       }, child: Text("no")),
  //     ],
  //
  //   )
  //   );
  //
  // }
  // void confirmEdit(String Id,String Title, String Description) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=> EditTask(Id,Title,Description)));
  // }


}



