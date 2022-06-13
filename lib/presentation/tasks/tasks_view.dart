import 'dart:io';

import 'package:bank_misr/Data/models/Task.dart';
import 'package:bank_misr/presentation/home/home_view.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Data/repo/task_repo.dart';
import '../../Data/web_services/balance_services.dart';
import '../../Data/web_services/task_services.dart';
import '../bottomBar/bottomBar.dart';
import '../resources/routes_manager.dart';
import 'package:http/http.dart' as http;


class TasksView extends StatefulWidget {
  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
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

    tasks=await TaskRepo(TaskServices()).GetAllTasks("Url");
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    token=sharedPreferences.getString("token");
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Tasks",
          style: getBoldtStyle(fontSize:FontSize.s20,color: ColorManager.white)
          ,)
        ,),
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
        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
              border:Border.all(color:ColorManager.grey,width: 1.5),
              borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomRight:Radius.circular(15), )
          ),
          child: Row(
            children: [

              Expanded(

                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(

                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        (index+1).toString(),
                        style: getBoldtStyle(
                          fontSize: FontSize.s16,
                          color:ColorManager.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      width: 167,
                      child: Text(

                        task.title,
                        style: getBoldtStyle(
                          fontSize:FontSize.s16,
                          color: Colors.black,


                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),

                    Row(

                      children: [
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
                                child: Text("Well Done",
                                  style: getBoldtStyle(fontSize:18,color: ColorManager.white),),
                              ),
                              content: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Lottie.asset("assets/images/7455-loading1.json",height: 145,width:250, )
                                    ,
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                          width: 190,
                                          child: Text("20 EGP  Has Been Added To Your Wallet!",
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
                                      child: Text('Ok',style:getRegularStyle(color: ColorManager.white) ,),
                                      onPressed: () {

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
                        IconButton(icon: (Icon(Icons.edit_rounded)),color:ColorManager.black, onPressed: () {  },

                        ),
                        IconButton(icon: (Icon(Icons.delete_rounded)),color:ColorManager.error, onPressed: () {
                          confirmDelete(task.id);

                        },

                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  void confirmDelete(String id) {
    showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
      title: Text("Delete"),
      content: Text(" Are you sure !?"),
      actions: [
        FlatButton(child: Text("yes"),
          onPressed: () async {
          var response=await  http.delete(Uri.parse('http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/task/delete/$id'),
              headers: <String,String>{"Content-Type": "application/json",
                HttpHeaders.authorizationHeader:"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MmE1YjMzMDQ2ZGNiZjBkZWVjYzQzNmUiLCJpYXQiOjE2NTUwMjcwODJ9.XdHxFQGF4NGEQik_2V-Qbw5nZaERO8J7KIALYBBwJj8"});
          print(response.statusCode);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> TasksView()));


          }, ),
        FlatButton(onPressed: (){
          Navigator.pop(context);

        }, child: Text("no")),
      ],

    )
    );

  }
}



