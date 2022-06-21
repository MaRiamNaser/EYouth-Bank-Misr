import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';


class addGoalview extends StatefulWidget {


  @override
  State<addGoalview> createState() => _addGoalViewState();
}


class _addGoalViewState extends State<addGoalview> {

  var addGoalController = TextEditingController();
  var descpriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(title: Text(AppStrings.addGoal),  actions: [
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
      body: Center(
        child: SingleChildScrollView(child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                new CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 5.0,
                  percent: 1.0,
                  center: new Text("100%"),
                  progressColor: Colors.green,
                ),
                Image(
                  image: AssetImage('assets/images/goals.png'),
                  height: 120.0,
                  width: 160.0,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height:400,
                decoration: BoxDecoration(
                    border:Border.all(color:ColorManager.grey,width: 1.5),
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(30),bottomRight:Radius.circular(30), )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Title",style: getMediumStyle(color: Colors.black,fontSize:FontSize.s18),),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(

                        decoration: BoxDecoration(

                            border:Border.all(color: Colors.grey,width: 1.2),
                            borderRadius: BorderRadius.circular(10),
                            color: ColorManager.primary


                        ),


                        child: TextFormField(

                          style: TextStyle(
                            color: ColorManager.black,
                            fontWeight:FontWeightManager.semiBold,
                            fontSize: FontSize.s16 ,
                          ),
                          controller: descpriptionController,
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (String value) {
                            print(value);
                          },

                          decoration: InputDecoration(
                            hintText: 'Title of your goal',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,


                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Description",
                              style: getMediumStyle
                                (color:ColorManager.black,fontSize: FontSize.s18,),

                            ),

                          ],
                        ),

                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: 120,
                        decoration: BoxDecoration(

                          border:Border.all(color:ColorManager.grey,width: 1.2),
                            borderRadius: BorderRadius.circular(10),
                          color: ColorManager.primary


                        ),


                        child: TextFormField(

                          style: TextStyle(
                              color: ColorManager.black,
                              fontWeight:FontWeightManager.semiBold,
                              fontSize: FontSize.s16 ,
                          ),
                          controller: descpriptionController,
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (String value) {
                            print(value);
                          },

                          decoration: InputDecoration(

                            hintText: 'Write your goal here',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,


                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),

                      Center(

                        child: Container(

                          width: 90,
                          decoration: BoxDecoration(
                            border:Border.all(color:ColorManager.grey,width: 1),
                            borderRadius: BorderRadius.circular(10),
                            color:ColorManager.darkPrimary,
                          ),


                          child: MaterialButton(
                            onPressed: () {
                              print(addGoalController.text);

                            },
                            child: Text(
                              'Add',
                              style: TextStyle(
                                color: ColorManager.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


              ),
            ),

          ],
        ) ,),
      )



    );


  }
}



