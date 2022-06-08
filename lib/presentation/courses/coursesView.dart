import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../Data/models/Course.dart';
import '../../business_logic/courseBloc/course_cubit.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class coursesView extends StatefulWidget {
  @override
  State<coursesView> createState() => _coursesViewState();
}

class _coursesViewState extends State<coursesView> {
  @override
  late List<Course> AllCourses;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
  }

  Load() async {
    AllCourses = await BlocProvider.of<CourseCubit>(context).GetAllCourses("Url");
  }
  Widget build(BuildContext context) {
    return Scaffold(


        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(

        width: double.infinity,
        child: Column(

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
    BlocBuilder<CourseCubit, CourseState>(
    builder: (context, state) {
      if (state is CoursesLoaded) {
        AllCourses = (state).courses;
        print(AllCourses[0].id);
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: AllCourses.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, Routes.courseViewRoute,arguments: [AllCourses[index].image,AllCourses[index].title]);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: AppPadding.p14),
                child: Column(
            
                  children: [
            
                    Container(
            
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorManager.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: (Image.network(AllCourses[index].image)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(AllCourses[index].title),
                  ],
                ),
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

          ],
        ),
      ),
    )
    );
  }
}
