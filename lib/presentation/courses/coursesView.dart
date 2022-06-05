import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../resources/color_manager.dart';


class coursesView extends StatefulWidget {
  @override
  State<coursesView> createState() => _coursesViewState();
}


class _coursesViewState extends State<coursesView> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back,color:ColorManager.black,size:FontSize.s20,),
      //   title: Text(
      //     "Goals",
      //     style: getBoldtStyle(fontSize:FontSize.s20,color: ColorManager.black)
      //     ,)
      //   ,),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Column(

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
          Center(
            child: Column(

              children: [

                Row(

              children: [
                Padding(

                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
      child: Column(
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(

                          border:Border.all(color:ColorManager.grey,width: 1.5),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: (Image.asset("assets/images/images.gif.jpg")),






                  ),
                  SizedBox(height: 15,),
                  Text(" Course Name"),
                ],

      ),
    ),
                Padding(

                  padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 0),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(

                            border:Border.all(color:ColorManager.grey,width: 1.5),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: (Image.asset("assets/images/images.gif.jpg")),






                      ),
                      SizedBox(height: 15,),
                      Text(" Course Name"),
                    ],

                  ),
                ),

              ],
            ),
                Row(

                  children: [
                    Padding(

                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(

                                border:Border.all(color:ColorManager.grey,width: 1.5),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: (Image.asset("assets/images/images.gif.jpg")),






                          ),
                          SizedBox(height: 15,),
                          Text(" Course Name"),
                        ],

                      ),
                    ),
                    Padding(

                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 0),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(

                                border:Border.all(color:ColorManager.grey,width: 1.5),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: (Image.asset("assets/images/images.gif.jpg")),






                          ),
                          SizedBox(height: 15,),
                          Text(" Course Name"),
                        ],

                      ),
                    ),

                  ],
                ),
                Row(

                  children: [
                    Padding(

                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(

                                border:Border.all(color:ColorManager.grey,width: 1.5),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: (Image.asset("assets/images/images.gif.jpg")),






                          ),
                          SizedBox(height: 15,),
                          Text(" Course Name"),
                        ],

                      ),
                    ),
                    Padding(

                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 0),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(

                                border:Border.all(color:ColorManager.grey,width: 1.5),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: (Image.asset("assets/images/images.gif.jpg")),






                          ),
                          SizedBox(height: 15,),
                          Text(" Course Name"),
                        ],

                      ),
                    ),

                  ],
                ),
                Row(

                  children: [
                    Padding(

                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(

                                border:Border.all(color:ColorManager.grey,width: 1.5),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: (Image.asset("assets/images/images.gif.jpg")),






                          ),
                          SizedBox(height: 15,),
                          Text(" Course Name"),
                        ],

                      ),
                    ),
                    Padding(

                      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 0),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(

                                border:Border.all(color:ColorManager.grey,width: 1.5),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: (Image.asset("assets/images/images.gif.jpg")),






                          ),
                          SizedBox(height: 15,),
                          Text(" Course Name"),
                        ],

                      ),
                    ),

                  ],
                ),


            ],
    ),
          ),


        ],
      ), )



    );


  }
}



