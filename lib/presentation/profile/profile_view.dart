import 'package:bank_misr/presentation/profile/Widgets/balance_Widget.dart';
import 'package:bank_misr/presentation/profile/Widgets/bottom_row_widget.dart';
import 'package:bank_misr/presentation/resources/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Data/models/Profile.dart';
import '../../business_logic/profileBloc/profile_cubit.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'dart:math' as math;

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Profile profile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
  }

  Load() async {
    profile = await BlocProvider.of<ProfileCubit>(context).GetProfile("Url");
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 1 / 825 * screensize.height * 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppSize.s50))),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, top: 180),
              child: Container(
                padding: EdgeInsets.all(AppPadding.p18),
                height: 1 / 825 * screensize.height * 480,
                width: 1 / 393 * screensize.width * 300,
                decoration: BoxDecoration(
                    color: ColorManager.lightGrey,
                    border: Border.all(color: ColorManager.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSize.s50),
                    )),
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if(state is ProfilesLoaded) {
                      profile=(state).profile;
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Container(
                            child: Center(
                              child: Column(
                                children: [
                                  Center(
                                      child: Text(profile.fullname,
                                          style: getSemiBoldStyle(
                                              fontSize: 16,
                                              color: ColorManager.black))),
                                  SizedBox(
                                    height: 1 / 825 * screensize.height * 4.0,
                                  ),
                                  Text(
                                    profile.username,
                                    style: getMediumStyle(
                                        fontSize: 12, color: ColorManager.black),
                                  ),
                                  SizedBox(
                                      height: 1 / 825 * screensize.height * 10),
                                  BalanceWidget(profile.balance),
                                  SizedBox(
                                    height: 1 / 825 * screensize.height * 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        profile.email,
                                        style: getMediumStyle(
                                            fontSize: 16,
                                            color: ColorManager.black),
                                      ),
                                      Icon(Icons.email)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1 / 825 * screensize.height * 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(profile.age + " Year",
                                          style: getMediumStyle(
                                              fontSize: 16,
                                              color: ColorManager.black)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1 / 825 * screensize.height * 25,
                                  ),
                                  Divider(
                                    color: ColorManager.black,
                                    height: 1 / 825 * screensize.height * 8,
                                  ),
                                  RowWidget()
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    else
                      {
                        return Center(child: CircularProgressIndicator(),);
                      }
                  },
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 135, top: 100),
                child: Container(
                  height: 1 / 825 * screensize.height * 130,
                  width: 1 / 393 * screensize.width * 120,
                  child: Image.asset(
                    ImageAssets.profilePhoto,
                    fit: BoxFit.cover,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
