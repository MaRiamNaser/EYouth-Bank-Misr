import 'package:bank_misr/Data/models/MatcingItem.dart';
import 'package:flutter/cupertino.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class TargetTitleWidget extends StatelessWidget {
  MatchingItem item;
  TargetTitleWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: item.accepting ? 70 : 50,
      width: item.accepting ? 140 : 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: item.accepting
            ? ColorManager.darkPrimary
            : ColorManager.primary,
      ),
      child: Text(item.name,
          style: getSemiBoldStyle(
              color: ColorManager.white),textAlign: TextAlign.center,),
    )
;
  }
}
