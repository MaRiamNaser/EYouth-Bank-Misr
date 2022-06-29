import 'package:bank_misr/Data/models/MatcingItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class TargetDescriptionWidget extends StatelessWidget {
  MatchingItem item;
  TargetDescriptionWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(11),
      height:item.accepting ? 120 : 110,
      width:item.accepting ? 180 : 180,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:item.accepting
            ? Colors.green[800]
            : ColorManager.lightPrimary,
      ),
      child: Text(item.value,
          style: getRegularStyle(
              color:item.accepting
                  ? Colors.white
                  : ColorManager.black)),
    );
  }
}
