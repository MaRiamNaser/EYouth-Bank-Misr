import 'package:bank_misr/Data/models/Video.dart';
import 'package:bank_misr/business_logic/courseBloc/course_cubit.dart';
import 'package:bank_misr/business_logic/videoBloc/video_cubit.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:bank_misr/presentation/resources/values_manager.dart';
import 'package:bank_misr/presentation/video/video_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/models/Course.dart';

class CourseView extends StatefulWidget {
  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {

  late List<Video> AllVideos;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
  }

  Load() async {
    AllVideos = await BlocProvider.of<VideoCubit>(context).GetAllVideos("Url");
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Name"),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 1 / 825 * screensize.height * AppSize.s14,
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p16),
            child: Container(
                width: 1 / 393 * screensize.width * 360,
                height: 1 / 825 * screensize.height * 180.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s50),
                        topRight: Radius.circular(AppSize.s50))),
                child: Image.asset(ImageAssets.CoursePageHeaderPhoto,
                    fit: BoxFit.cover)),
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => VideoView()));
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  right: AppPadding.p12, left: AppPadding.p12),
                              height: 1 / 825 * screensize.height * 110.0,
                              width: 1 / 393 * screensize.width * 340,
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
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
                                          1 / 825 * screensize.height * 90,
                                          width: 1 / 393 * screensize.width *
                                              90,
                                          margin: EdgeInsets.all(6.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  ImageAssets.videoImg1),
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
                                            SizedBox(
                                              height: 1 /
                                                  825 *
                                                  screensize.height *
                                                  5.0,
                                            ),
                                            SizedBox(
                                              child: Text("01:30 mins",
                                                  style: getRegularStyle(
                                                      fontSize: FontSize.s12,
                                                      color: ColorManager
                                                          .black)),
                                            ),
                                            SizedBox(
                                              height: 1 /
                                                  825 *
                                                  screensize.height *
                                                  AppSize.s4,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.check_circle_outline_outlined)
                                ],
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
