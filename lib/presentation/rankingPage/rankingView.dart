import 'package:bank_misr/presentation/home/Widgets/stack_widget.dart';
import 'package:bank_misr/presentation/rankingPage/rankingWidgets.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/taskBloc/task_cubit.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class rankingView extends StatefulWidget {

  // late List<rank> ranks = [];
  @override
  State<rankingView> createState() => _rankingViewState();
}

class _rankingViewState extends State<rankingView> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text(AppStrings.Home.tr()),  actions: [
          CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                ImageAssets.profilePhoto,
                fit: BoxFit.fitWidth,
                width: 45,
              ),
              maxRadius: 34),

        ] ),
        body: SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 260,
                width: double.infinity,
                color: ColorManager.primary,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(

                        children: [
                          Container(
                          width: 105,
                          height: 115,
                          child: ClipPolygon(

                            borderRadius: 2,
                            sides: 5,
                            child: Padding(

                              padding: const EdgeInsets.all(10),
                              child: ClipPolygon(
                                borderRadius: 10,

                                sides: 5,

                                child:  CircularProfileAvatar(
                                    ' ',
                                    child: Image(image: AssetImage('assets/images/avtar.png') ,)


                                ),

                              ),
                            ),
                          ),
                        ),
                          Container(
                            decoration: BoxDecoration(
                              color: ColorManager.darkPrimary,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            padding: EdgeInsets.all(6),
                            child: Text("2",style:TextStyle(color: ColorManager.white),),




                          )

                        ],

                      ),
                      Stack(

                        children: [
                          Container(
                            width: 155,
                            height: 160,
                            child: ClipPolygon(

                              borderRadius: 2,
                              sides: 5,
                              child: Padding(

                                padding: const EdgeInsets.all(5),
                                child: ClipPolygon(
                                  borderRadius: 10,
                                  sides: 5,
                                  child:  CircularProfileAvatar(
                                      ' ',
                                      child: Image(image: AssetImage('assets/images/avtar.png') ,)

                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(

                            decoration: BoxDecoration(
                              color: ColorManager.darkPrimary,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text("1",style:TextStyle(color: ColorManager.white,fontSize: FontSize.s20),),
                          ),

                        ],

                      ),
                      Stack(
                        children: [
                          Container(
                            width: 105,
                            height: 115,

                            child: ClipPolygon(

                              borderRadius: 2,

                              sides: 5,
                              child: Padding(

                                padding: const EdgeInsets.all(10),
                                child: ClipPolygon(
                                  borderRadius: 10,

                                  sides: 5,

                                  child:  CircularProfileAvatar(
                                      ' ',
                                      child: Image(image: AssetImage('assets/images/avtar.png') ,)


                                  ),

                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: ColorManager.darkPrimary,

                              borderRadius: BorderRadius.circular(7),

                            ),
                            padding: EdgeInsets.all(6),
                            child: Text("3",style:TextStyle(color: ColorManager.white),),




                          )

                        ],

                      ),



                    ],
                  ),

                ],

                ),
              ),

              SafeArea(child:
                  Container(child:  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        buildItem("omar",1,200),
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 0.0,
                        ),
                    itemCount: 5,
                  ),

                  )

                  ),


                //  Column(
                //   children: [
                //   buildItem("omar",1,200),
                //   buildItem("Ahmed ibrahim",2,300),
                //   buildItem("Ibrahim",3,500),
                //   buildItem("omar",4,800),
                //
                //
                // ],),
              //)




            ],

          ),
        ),




    );
  }
}
