import 'package:bank_misr/Data/models/goal.dart';
import 'package:bank_misr/Data/repo/goal_repo.dart';
import 'package:bank_misr/Data/web_services/goal_services.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:lottie/lottie.dart';

import '../resources/color_manager.dart';
import 'package:http/http.dart' as http;

import '../tasks/tasks_view.dart';
import 'Goal.dart';


class Goalsview extends StatefulWidget {
  @override
  State<Goalsview> createState() => _GoalViewState();
}


class _GoalViewState extends State<Goalsview> {


// late List<Goal> goals=[];
@override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Load();

  // }
  // Load()async
  // {
  //   goals=await GoalRepo(GoalServices()).GetAllGoals("Url");
  // }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Goals",
          style: getBoldtStyle(fontSize:FontSize.s20,color: ColorManager.white)
          ,)
        , 
        ),
      body: Column(
        children: [
          Container(
            child: ImageSlideshow(
              width: double.infinity,
              height: 200,
              initialPage: 0,
              children: [
                Image.asset(
                  'assets/images/goals.png',
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
                  child: SizedBox(height: 160 ,
                      width:  230,
                      child:Lottie.asset(ImageAssets.GoalPhoto)),
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
                    itemBuilder: (context, index) => buildtask(goals[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.0,
                    ),
                    itemCount:goals.length,
                  ),
                ],
              ),
            ),
          )
        ],
      ),


    );


  }
  // Widget buildtask(Goal goal) =>

  //     Padding(

  //       padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 16),
  //       child: Container(
  //         decoration: BoxDecoration(
  //             border:Border.all(color:ColorManager.grey,width: 1.5),
  //             borderRadius: BorderRadius.only(topLeft:Radius.circular(20),bottomRight:Radius.circular(20), )
  //         ),
  //         child: Row(
  //           children: [

  //             Expanded(

  //               child: Row(

  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Padding(

  //                     padding: const EdgeInsets.all(12.0),
  //                     child: Text(
  //                       goal.goalId.toString(),
  //                       style: getBoldtStyle(
  //                         fontSize: FontSize.s16,
  //                         color: ColorManager.black,
  //                       ),
  //                       maxLines: 2,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                   ),
  //                   Container(
  //                     width: 190,
  //                     child: Text(

  //                       goal.title,
  //                       style: getBoldtStyle(
  //                         fontSize:FontSize.s16,
  //                         color:ColorManager.black,

  //                       ),
  //                       maxLines: 2,
  //                       overflow: TextOverflow.ellipsis,

  //                     ),
  //                   ),

  //                   Row(


  //                     children: [
  //                       IconButton(icon: (Icon(Icons.check_circle_outline,)),iconSize:FontSize.s25,color: ColorManager.green, onPressed: () {},
  //                       ),

  //                       IconButton(icon: (Icon(Icons.edit_rounded)),color:ColorManager.yellow, onPressed: () {  },

  //                       ),

  //                       IconButton(icon: (Icon(Icons.delete_rounded)),color: ColorManager.error, onPressed: () {
  //                         // confirmDelete(goal.id);
  //                       },


  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

  // void confirmDelete(String id) {
  //   showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
  //     title: Text("Delete"),
  //     content: Text(" Are you sure !?"),
  //     actions: [
  //       FlatButton(child: Text("yes"),
  //         onPressed: (){
  //         // http.delete('http://ec2-54-198-82-67.compute-1.amazonaws.com:5000/goal/delete/$id');
  //         // Navigator.push(context, MaterialPageRoute(builder: (context)=> goals_view()));


  //       }, ),
  //       FlatButton(onPressed: (){
  //         Navigator.pop(context);

  //       }, child: Text("no")),
  //     ],

  //   )
  //   );
    
  // }
}

Widget buildtask(GoalsList tasks) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 16),
      child: Container(
        height: 50,
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
                      '${tasks.number}'+"-",
                      style: getBoldtStyle(
                        fontSize: FontSize.s16,
                        color:ColorManager.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 170,
                    child: Text(

                      '${tasks.name}',
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

                      IconButton(icon: (Icon(Icons.check_circle_outline,)),color:ColorManager.green, onPressed: () {

                      },

                      ),
                      IconButton(icon: (Icon(Icons.edit_rounded)),color:ColorManager.black, onPressed: () {  },

                      ),
                      IconButton(icon: (Icon(Icons.delete_rounded)),color:ColorManager.error, onPressed: () {  },

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

