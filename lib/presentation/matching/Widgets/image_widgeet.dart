import 'package:bank_misr/presentation/resources/strings_manager.dart';
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
            ? 50.0
            : 40.0,
        child: CircleAvatar(
          backgroundImage: NetworkImage(item.img),
          radius: item.chossing || item.accepting
              ? 46
              : 35,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
