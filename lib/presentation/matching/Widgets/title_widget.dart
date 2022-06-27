import 'package:bank_misr/Data/models/MatcingItem.dart';
import 'package:flutter/cupertino.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class TitleWidget extends StatelessWidget {
  MatchingItem item;
  TitleWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(8.0),
      height: item.chossing || item.accepting
          ? 80 : 60,
      width:item.chossing || item.accepting
          ? 150 : 130,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: item.chossing || item.accepting
            ? ColorManager.darkPrimary
            : ColorManager.primary,
      ),
      child: Text(item.name,
        style:
        getSemiBoldStyle(color: ColorManager.white),
        textAlign: TextAlign.center,),
    )
;
  }
}
