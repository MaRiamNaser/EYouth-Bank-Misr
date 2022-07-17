
import 'package:bank_misr/presentation/lesson2/small_box.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';

Widget showMyDialog(BuildContext context, String title, String content,StateSetter?_setState,speaking)  {
  return AlertDialog(
    content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
        _setState = setState;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: DefaultTextStyle(
                    style: getLightStyle(
                        color: ColorManager.black, fontSize: 20),
                    child: Text(content),
                  ),
                ),
                Visibility(
                  visible: speaking,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0),
                              child: SmallBox(
                                  child: Icon(
                                    Icons.close,
                                    size: 32,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    ),
  );
}

