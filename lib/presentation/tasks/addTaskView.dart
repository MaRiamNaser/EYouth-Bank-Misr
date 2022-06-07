import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';


class addTasklview extends StatefulWidget {


  @override
  State<addTasklview> createState() => _addTaskViewState();
}


class _addTaskViewState extends State<addTasklview> {

  var addGoalController = TextEditingController();
  var descpriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(

        appBar: AppBar(
          leading: Icon(Icons.arrow_back,color: Colors.black,size: 25,),
          title: Text(
            "Add Task",
            style: getBoldtStyle(fontSize:FontSize.s18,color: Colors.black)
            ,)
          ,),
        body: Center(
          child: SingleChildScrollView(child: Column(
            children: [
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



