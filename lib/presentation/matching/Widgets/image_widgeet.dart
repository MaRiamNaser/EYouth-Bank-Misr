import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_misr/Data/models/MatcingItem.dart';
import '../../resources/color_manager.dart';

class ImageWidget extends StatelessWidget {
  MatchingItem item;
  ImageWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18.0, top: 15.0),
      child:
      CircleAvatar(
        backgroundColor: item.accepting ? ColorManager
            .green : Colors.white,
        radius: item.chossing || item.accepting
            ? 46.0
            : 35.0,
        child: CircleAvatar(
          backgroundImage: AssetImage(item.img),
          radius: item.chossing || item.accepting
              ? 41
              : 30,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
