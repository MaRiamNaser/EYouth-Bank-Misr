import 'package:bank_misr/presentation/home/parentHomeView/childHomeView.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../Data/models/Category.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import 'ParentNavBarView.dart';

class ParentHomeView extends StatefulWidget {
  @override
  _ParentHomeViewState createState() => _ParentHomeViewState();
}

class _ParentHomeViewState extends State<ParentHomeView> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>blocGenerator().profileCubit),
        BlocProvider(
            create: (context) => blocGenerator().courseCubit),
        BlocProvider(
            create: (context) => blocGenerator().goalCubit
        ),
        BlocProvider(
            create: (context) => blocGenerator().taskCubit
        ),

      ],
      child: Scaffold(
        appBar: AppBar(title: Text("Home"),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 1 / 825 * screensize.height * 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(AppSize.s18),
                            bottomLeft: Radius.circular(AppSize.s18))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 1 / 825 * screensize.height * 25,
                          ),
                          Center(
                              child: Text(
                            "Welcome Mr.Wael",
                            style: getSemiBoldStyle(
                                fontSize: 20, color: ColorManager.white),
                          )),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 1 / 825 * screensize.height * 150,
                      width: 1 / 825 * screensize.height * 150,
                      margin: EdgeInsets.only(top: 110),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            )
                          ]
                          ,image: DecorationImage(image: AssetImage(  "assets/images/image.jfif",
                      ),fit: BoxFit.cover)
                      ),
                    ),
                  )
                ],
              ),
               SizedBox(height: 11,),
               Center(
                 child: Text("Accounts Of Your Children",style: getSemiBoldStyle(
                     fontSize: 18, color: ColorManager.black)),
               ),
              SizedBox(height: 11,),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(AppPadding.p16),
                shrinkWrap: true,
                primary: false,
                itemCount: categories2.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>parentnavgscreen(categories2[index])));
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                                width: 1 / 393 * screensize.width * 360,
                                height: 1 / 825 * screensize.height * 100.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.grey),
                                  boxShadow: [
                                  BoxShadow(
                                  color: Colors.white70,
                                  offset: const Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 2.0,

                                )
                        ]
                    ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Hero(
                                          tag: categories2[index].img,
                                          child: CircleAvatar(
                                            minRadius: 32,
                                            backgroundImage: AssetImage(categories2[index].img),
                                          ),
                                        ),
                                        SizedBox(width: 40),
                                        Text(
                                          categories2[index].title,
                                          style: getBoldtStyle(
                                              fontSize: 15, color: ColorManager.black),
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios,size: 22,color: Colors.grey,)
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 1 / 825 * screensize.height * AppSize.s20,
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
