import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:bank_misr/business_logic/videoBloc/video_cubit.dart';
import 'package:bank_misr/presentation/home/home_view.dart';
import 'package:bank_misr/presentation/navgpage/navigation_page.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:bank_misr/presentation/video/video_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../Data/models/Course.dart';
import '../../Data/models/MatcingItem.dart';
import '../../Data/models/Video.dart';
import '../Lesson8/banknoteTest.dart';
import '../Lesson8/lesson8.dart';
import '../lesson2/lesson2.dart';
import '../lesson4/pageslider.dart';
import '../lesson4/slide_show.dart';
import '../lesson5/ready_to_test_page.dart';
import '../lesson7/lesson7.dart';
import '../matching/matching_lesson.dart';
import '../matching/matching_levels.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class CourseView extends StatefulWidget {
  List<String> course;
  CourseView(this.course);

  @override
  _CourseViewState createState() => _CourseViewState(course);
}

class _CourseViewState extends State<CourseView> {

  late List<Video> AllVideos;
List<String>  course;
  _CourseViewState(this.course);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
  }

  Load() async {
    setState(() {
      AllVideos = [
        Video(id: "1", title: "Lesson 1", widget: VideoView(
            Video(id: "This is Lesson one ",title: "What is Egypt Currency ",widget: navgscreen(),))),
        Video(id: "2", title: "Lesson 2", widget: SixBoxesGame()),
        Video(id: "3", title: "Lesson 3", widget:pageslider() ),
        Video(id: "4", title: "Lesson 4", widget:Slideshow() ),
        Video(id: "5", title: "Lesson 5", widget: ReadyToTestPage()),
        Video(id: "6", title: "Lesson 6", widget:MatchingLesson(matching1,matching2) ),
        Video(id: "7", title: "Lesson 7", widget:lesson7() ),
        Video(id: "8", title: "Lesson 8", widget:banknoteTest()),
        Video(id: "1", title: "Lesson 9", widget: VideoView(Video(id: "This is Lesson Nine ",title: "What is Egypt Currency ",widget: navgscreen()))),
        Video(id: "1", title: "Lesson 10", widget: MatchingLevels())
      ];
    });

  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.Courses.tr()),  actions: [
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

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 1 / 825 * screensize.height * AppSize.s14,
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppPadding.p2),
              child: Container(
                  width: 1 / 393 * screensize.width * 360,
                  height: 1 / 825 * screensize.height * 180.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSize.s50),
                          topRight: Radius.circular(AppSize.s50)),
                      image: DecorationImage(
                  image:  NetworkImage(course[0])
                ,fit: BoxFit.cover,
              )),),
            ),
            Container(
              child:
                    AllVideos.isNotEmpty? ListView.builder(
                      padding: const EdgeInsets.all(AppPadding.p16),
                      shrinkWrap: true,
                      itemCount: AllVideos.length,
                      //scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            balance += 100;
                            pushNewScreen(context, screen: AllVideos[index].widget,withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    right: AppPadding.p12, left: AppPadding.p12),
                                height: 1 / 825 * screensize.height * 110.0,
                                width: 1 / 393 * screensize.width * 360,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(AppSize.s25),
                                      bottomRight: Radius.circular(AppSize.s25),
                                    ),
                                    color: ColorManager.lightPrimary,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 1.0), //(x,y)
                                        blurRadius: 6.0,
                                      ),
                                    ]),
                                child:   SizedBox(
                                      width: 1 / 393 * screensize.width * 250,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text((index + 1).toString(),
                                              style: getBoldtStyle(
                                                  fontSize: FontSize.s16,
                                                  color: ColorManager.black)),
                                          Container(
                                            height:
                                            1 / 825 * screensize.height * 110,
                                            width: 1 / 393 * screensize.width *
                                                110,
                                            margin: EdgeInsets.all(6.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/lesson_image.jpg"
                                                    ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 140,
                                                child: Text(
                                                    AllVideos[index].title,
                                                    style: getBoldtStyle(
                                                        fontSize: FontSize.s14,
                                                        color: ColorManager
                                                            .black),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          )
                                          ,Icon(Icons.check_circle_outline_outlined)
                                        ],
                                      ),
                                    ),
                                    
                                 
                              ),
                              SizedBox(
                                height: 1 / 825 * screensize.height * AppSize.s20,
                              )
                            ],
                          ),
                        );
                      },
                    ):
                       Center(child: CircularProgressIndicator())
            )
          ],
        ),
      ),
    );
  }
}
