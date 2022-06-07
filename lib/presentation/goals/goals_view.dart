import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../resources/color_manager.dart';
class GoalsList {
  var number;
  var name;
  GoalsList({
    this.number,
    this.name,
  });
}

class Goalsview extends StatefulWidget {
  @override
  State<Goalsview> createState() => _GoalViewState();
}


class _GoalViewState extends State<Goalsview> {
  List<GoalsList> tasks =[
    GoalsList(
      number:1,
      name:" x",
    ),
    GoalsList(
      number:2,
      name:" yyyyy",
    ),
    GoalsList(
      number:1,
      name:" x",
    ),
    GoalsList(
      number:2,
      name:" yyyyy",
    ),
    GoalsList(
      number:1,
      name:" x",
    ),
    GoalsList(
      number:2,
      name:" yyyyy",
    ),
    GoalsList(
      number:3,
      name:" aaaaaa",
    ),
    GoalsList(
      number:4,
      name:" yyyyyy",
    ),

  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color:ColorManager.black,size:FontSize.s20,),
        title: Text(
          "Goals",
          style: getBoldtStyle(fontSize:FontSize.s20,color: ColorManager.black)
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
                  'assets/images/courses.gif',
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
              Image(
                image: AssetImage('assets/images/images.jpg'),
                height: 120.0,
                width: 160.0,
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
                    itemBuilder: (context, index) => buildtask(tasks[index]),
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
}



Widget buildtask(GoalsList tasks) =>

    Padding(

      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            border:Border.all(color:ColorManager.grey,width: 1.5),
            borderRadius: BorderRadius.only(topLeft:Radius.circular(20),bottomRight:Radius.circular(20), )
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
                      '${tasks.number}',
                      style: getBoldtStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 190,
                    child: Text(

                      '${tasks.name}',
                      style: getBoldtStyle(
                        fontSize:FontSize.s16,
                        color:ColorManager.black,

                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                    ),
                  ),

                  Row(


                    children: [
                      IconButton(icon: (Icon(Icons.check_circle_outline,)),iconSize:FontSize.s25,color: ColorManager.green, onPressed: () {},
                      ),

                      IconButton(icon: (Icon(Icons.edit_rounded)),color:ColorManager.yellow, onPressed: () {  },

                      ),

                      IconButton(icon: (Icon(Icons.delete_rounded)),color: ColorManager.error, onPressed: () {  },


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