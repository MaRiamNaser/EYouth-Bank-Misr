import 'package:bank_misr/business_logic/rankingBloc/ranking_cubit.dart';
import 'package:bank_misr/presentation/home/Widgets/stack_widget.dart';
import 'package:bank_misr/presentation/rankingPage/rankingWidgets.dart';
import 'package:bank_misr/presentation/resources/color_manager.dart';
import 'package:bank_misr/presentation/resources/font_manager.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/models/User.dart';
import '../../business_logic/taskBloc/task_cubit.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';

class rankingView extends StatefulWidget {
  // late List<rank> ranks = [];
  @override
  State<rankingView> createState() => _rankingViewState();
}

class _rankingViewState extends State<rankingView> {
  List<User> ranks = [];
  final ScrollController _scrollController = ScrollController();
  var _isLoad = false;
  late int index;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
    index=1;
    _scrollController.addListener(() async {
      print(ranks.length.toString());
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        ranks.addAll(
            await BlocProvider.of<RankingCubit>(context).GetNextUsers(index));
        index++;
        setState(() {
          _isLoad = true;
          print(_isLoad);
        });
      }
    });
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  Load()async
  {
    await BlocProvider.of<RankingCubit>(context).GetFirstUsers();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.Ranking.tr()), actions: [
        CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              ImageAssets.profilePhoto,
              fit: BoxFit.fitWidth,
              width: 45,
            ),
            maxRadius: 34),
      ]),
      body: BlocBuilder<RankingCubit, RankingState>(
        builder: (context, state) {
          if(state is RankingLoaded) {
            ranks=(state).users;
            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 260,
                    width: double.infinity,
                    color: ColorManager.primary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildRankWidget(115,105,"2",ranks[1]),
                            buildRankWidget(160,155,"1",ranks[0]),
                            buildRankWidget(115,105,"3",ranks[2]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SafeArea(
                      child: Container(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return index == ranks.length -3
                                ? Center(child: const CircularProgressIndicator())
                                : buildItem(ranks, index);
                          },
                          itemCount: !_isLoad ? ranks.length - 2 :  ranks.length -3,
                        ),
                      )),
                ],
              ),
            );
          }
          else
            {
           return   Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Center(child: CircularProgressIndicator(),),
              );
            }
        },
      ),
    );

  }
  Stack buildRankWidget(double height, double width, String index, User rankk) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: width,
              height: height,
              child: ClipPolygon(
                borderRadius: 2,
                sides: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipPolygon(
                    borderRadius: 10,
                    sides: 5,
                    child:  Image(
                          image: NetworkImage(rankk.image),
                        ),
                  ),
                ),
              ),
            ),
            Text(rankk.fullname!,style: getMediumStyle(
              fontSize: 16,
              color: ColorManager.black,
            ),)
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorManager.darkPrimary,
            borderRadius: BorderRadius.circular(7),
          ),
          padding: EdgeInsets.all(6),
          child: Text(
            index,
            style: TextStyle(color: ColorManager.white),
          ),
        )
      ],
    );
  }

}
