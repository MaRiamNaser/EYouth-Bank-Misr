import 'package:bank_misr/app/app_prefs.dart';
import 'package:bank_misr/presentation/choose_which_view/choose_which_view_page.dart';
import 'package:bank_misr/presentation/home/parentHomeView/parentHomeView.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:bank_misr/presentation/resources/routes_manager.dart';
import 'package:bank_misr/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/presentation/resources/styles_manager.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login/login_view.dart';
import '../resources/assets_manager.dart';

bool langSwitch = false;
bool notifySwitch = false;
bool signoutSwitch = false;

class settingView extends StatefulWidget {
  @override
  State<settingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<settingView> {
  late AppPreferences _appPreferences;

  _changeLanguage() {
    _appPreferences = AppPreferences();
    _appPreferences.changeAppLanguage();
    Phoenix.rebirth(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.Setting.tr()),
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
      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back,color:ColorManager.black,size:FontSize.s20,),
      //   title: Text(
      //     "Setting",
      //     style: getBoldtStyle(fontSize:FontSize.s20,color: ColorManager.black)
      //     ,)
      //   ,),
      body: Column(
        children: [
          Container(
            child: ImageSlideshow(
              width: double.infinity,
              height: 200,
              initialPage: 0,
              children: [
                Lottie.asset("assets/images/setting.json"),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // ListView.separated(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   itemBuilder: (context, index) => Buildtask(),
                  //   separatorBuilder: (context, index) => SizedBox(
                  //     height: 25.0,
                  //   ),
                  //
                  //   itemCount: 2,
                  // ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          border:
                              Border.all(color: ColorManager.grey, width: 1.5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                AppStrings.Laguage.tr(),
                                style: getBoldtStyle(
                                  fontSize: FontSize.s16,
                                  color: ColorManager.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(AppStrings.ar.tr()),
                                          Container(
                                            child: Switch(
                                              activeColor: ColorManager.green,
                                              value: langSwitch,
                                              onChanged: (value) {
                                                _changeLanguage();
                                                setState(() {
                                                  langSwitch = value;
                                                });
                                              },
                                            ),
                                          ),
                                          Text(AppStrings.en.tr()),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          border:
                              Border.all(color: ColorManager.grey, width: 1.5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                AppStrings.notifications.tr(),
                                style: getBoldtStyle(
                                  fontSize: FontSize.s16,
                                  color: ColorManager.black,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Switch(
                                        activeColor: ColorManager.green,
                                        value: notifySwitch,
                                        onChanged: (value) {
                                          setState(() {
                                            notifySwitch = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return WhichViewPage();
                          },
                        ),
                        (_) => false,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorManager.primary,
                            border: Border.all(
                                color: ColorManager.grey, width: 1.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  AppStrings.signOut.tr(),
                                  style: getBoldtStyle(
                                    fontSize: FontSize.s16,
                                    color: ColorManager.black,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: (Container(
                                    height: 60,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          alignment: Alignment.bottomRight,
                                          icon: Icon(
                                            Icons.logout,
                                          ),
                                          color: ColorManager.black,
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
