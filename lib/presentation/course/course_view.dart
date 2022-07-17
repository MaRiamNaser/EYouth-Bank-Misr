import 'package:bank_misr/Data/models/Lesson.dart';
import 'package:bank_misr/business_logic/LessonBloc/lesson_cubit.dart';
import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:bank_misr/business_logic/videoBloc/video_cubit.dart';
import 'package:bank_misr/presentation/course/Widgets/lesson_route.dart';
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
  late List<Lesson> AllLessons;

  List<String> course;

  _CourseViewState(this.course);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
    print("*********************************");
  }

  Load() async {
    AllLessons = await BlocProvider.of<LessonCubit>(context).GetAllLessons(course[2]);
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.Lessons.tr()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  ImageAssets.profilePhoto,
                  fit: BoxFit.fitWidth,
                  width: 45,
                ),
                maxRadius: 34),
          )
        ],
      ),
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
                      image: NetworkImage(course[0]),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Container(
                child: BlocBuilder<LessonCubit, LessonState>(
                        builder: (context, state) {
                          if (state is LessonsLoaded) {
                            AllLessons=(state).lessons;
                            return ListView.builder(
                              padding: const EdgeInsets.all(AppPadding.p16),
                              shrinkWrap: true,
                              itemCount: AllLessons.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    print("yeeeeeeeeeeeeeeeeees");
                                   // print(index.toString());
                                    pushNewScreen(context, screen: lesson_route(AllLessons[index]).Pages[index],withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);
                                    //print(AllLessons[index].lessonType!+""+AllLessons[index].title!);
                                    },
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            right: AppPadding.p12,
                                            left: AppPadding.p12),
                                        height:
                                        1 / 825 * screensize.height * 110.0,
                                        width: 1 / 393 * screensize.width * 360,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft:
                                              Radius.circular(AppSize.s25),
                                              bottomRight:
                                              Radius.circular(AppSize.s25),
                                            ),
                                            color: ColorManager.lightPrimary,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(0.0, 1.0),
                                                //(x,y)
                                                blurRadius: 6.0,
                                              ),
                                            ]),
                                        child: SizedBox(
                                          width: 1 / 393 * screensize.width *
                                              250,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text((index + 1).toString(),
                                                  style: getBoldtStyle(
                                                      fontSize: FontSize.s16,
                                                      color: ColorManager
                                                          .black)),
                                              Container(
                                                height: 1 /
                                                    825 *
                                                    screensize.height *
                                                    110,
                                                width: 1 /
                                                    393 *
                                                    screensize.width *
                                                    110,
                                                margin: EdgeInsets.all(6.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(8.0),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        AllLessons[index]
                                                            .image),
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
                                                      AllLessons[index].title,
                                                      style: getBoldtStyle(
                                                          fontSize: FontSize
                                                              .s14,
                                                          color:
                                                          ColorManager.black),
                                                      maxLines: 2,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(Icons
                                                  .check_circle_outline_outlined)
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1 /
                                            825 *
                                            screensize.height *
                                            AppSize.s20,
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                          else
                          {
                            return Center(child: CircularProgressIndicator());
                          }
                        }
                      )
                    )
          ],
        ),
      ),
    );
  }
}
