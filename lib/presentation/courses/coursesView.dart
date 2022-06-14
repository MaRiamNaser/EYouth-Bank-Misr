import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../Data/models/Course.dart';
import '../../business_logic/courseBloc/course_cubit.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class coursesView extends StatefulWidget {
  int i;
  coursesView(this.i);

  @override
  State<coursesView> createState() => _coursesViewState(i);
}

class _coursesViewState extends State<coursesView> {
  @override
  late List<Course> AllCourses;
  int i;
  _coursesViewState(this.i);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
  }

  Load() async {
    AllCourses = await BlocProvider.of<CourseCubit>(context).GetAllCourses("Url");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BlocProvider.of<CourseCubit>(context).close();
  }
  Widget build(BuildContext context) {
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
        // appBar: i==1?AppBar(
        //   leadingWidth: 60,
        //   title: Text(
        //     "Courses",
        //     style: getBoldtStyle(fontSize:FontSize.s20,color: ColorManager.white)
        //     ,),
        // ):null

        //   leading: Padding(
        //     padding: const EdgeInsets.only(left:8.0),
        //     child: Container(
        //
        //       child: CircleAvatar(
        //
        //         backgroundImage: AssetImage("assets/images/BM Juniors colored small.jpg"),
        //
        //       ),
        //     ),
        //   ),
        //
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.only(right:10.0),
        //       child: CircleAvatar(
        //           backgroundColor: Colors.white,
        //           child: Image.asset(
        //             ImageAssets.profilePhoto,
        //             fit: BoxFit.fitWidth,
        //             width: 45,
        //           ),
        //           maxRadius: 34),
        //     )
        //   ],
        // ),

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
                      'assets/images/video.gif',
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
                Navigator.pushNamed(context, Routes.courseViewRoute,arguments: [AllCourses[index].image,AllCourses[index].title,AllCourses[index].id]);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: AppPadding.p14),
                child: Column(
            
                  children: [
            
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)
                      ,
                      image: DecorationImage(
                        image: NetworkImage(AllCourses[index].image)
                            ,fit: BoxFit.cover,
                      )),

                  //    child: (Image.network(AllCourses[index].image,fit: BoxFit.cover,)),
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
