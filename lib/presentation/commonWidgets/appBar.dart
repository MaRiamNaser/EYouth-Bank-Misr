import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
class _CustomAppBarState extends State<CustomAppBar>{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('App Bar'),
        leading: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Container(

              child: CircleAvatar(

                backgroundImage: AssetImage("assets/images/BM Juniors colored small.jpg"),

              ),
            ),
          ),

          actions: [
            Padding(
              padding: const EdgeInsets.only(right:10.0),
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
        );

  }
}