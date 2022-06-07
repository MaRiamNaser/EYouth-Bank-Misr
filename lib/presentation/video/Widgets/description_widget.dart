import 'package:flutter/cupertino.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class Description extends StatelessWidget {
  String description;
  Description(this.description);

  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(left: AppPadding.p20, top: AppPadding.p20),
      height: 1/825 * screensize.height * 160,
      width: 1/393* screensize.width * 360,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(AppSize.s25) ,bottomRight: Radius.circular(AppSize.s25)),
          color: ColorManager.darkPrimary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description :",style: getSemiBoldStyle(color: ColorManager.white),),
          SizedBox(height: 1/825 * screensize.height * AppSize.s8,),
          Text(description ,style: getRegularStyle(fontSize: FontSize.s14,color: ColorManager.white),),
        ],
      ),
    );
  }
}
