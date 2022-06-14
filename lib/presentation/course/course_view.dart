import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:bank_misr/business_logic/videoBloc/video_cubit.dart';
import 'package:bank_misr/presentation/home/home_view.dart';
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

import '../../Data/models/Course.dart';
import '../../Data/models/Video.dart';
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
    AllVideos = await BlocProvider.of<VideoCubit>(context).GetAllVideos(course[2]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BlocProvider.of<VideoCubit>(context).close();
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
      // appBar: AppBar(
      //   title: Text(course[1]),
      //   iconTheme: IconThemeData(color: Colors.black),
      // ),
      body: Column(
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
          Expanded(
            child: BlocBuilder<VideoCubit, VideoState>(
              builder: (context, state) {
                if(state is VideosLoaded) {
                  AllVideos = (state).Videos;
                  return ListView.builder(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    shrinkWrap: true,
                    itemCount: AllVideos.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          balance += 100;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BlocProvider(
            create: (context) => blocGenerator().videoCubit,
            child: VideoView(AllVideos[index]),
          ),));
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
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                AllVideos[index].image
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
                  );
                }
                else
                  {
                    return Center(child: CircularProgressIndicator());

                  }
              },
            ),
          )
        ],
      ),
    );
  }
}
