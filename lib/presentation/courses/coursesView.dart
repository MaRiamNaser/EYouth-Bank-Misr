import 'package:bank_misr/presentation/course/course_view.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../Data/models/Course.dart';
import '../../business_logic/courseBloc/course_cubit.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

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
            SingleChildScrollView(
              child: BlocBuilder<CourseCubit, CourseState>(
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
            return
              InkWell(
              onTap: (){
                pushNewScreen(context, screen: CourseView([AllCourses[index].image,AllCourses[index].title,AllCourses[index].id]),
                withNavBar: true,pageTransitionAnimation: PageTransitionAnimation.cupertino);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: AppPadding.p14),
                child: Column(
            
                  children: [
            
                    CachedNetworkImage(

                      imageUrl: AllCourses[index].image,
                      imageBuilder:(context, imageProvider) =>
                          Container(
                        height: 130,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)
                        ,
                        image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover,
                        )),

                  //    child: (Image.network(AllCourses[index].image,fit: BoxFit.cover,)),
                      ),
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error)
                      => Icon(Icons.error),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(AllCourses[index].title),
                  ],

                ),
              )
            );
          },
        );
      }
      else
      {
        return  Container(margin: EdgeInsets.only(top: 100),child: Center(child: CircularProgressIndicator()));
      }
    }
    ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
