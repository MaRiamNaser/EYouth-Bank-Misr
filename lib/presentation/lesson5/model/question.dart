import 'package:flutter/cupertino.dart';

import 'option.dart';

class Question {
  final String? text;
  final List<Option>? options;
  final String? solution;
  bool? isLocked;
  Option? selectedOption;
  List<Option?>?  selectedOptions  ;

  Question({
    @required this.text,
    @required this.options,
    @required this.solution,
    this.isLocked = false,
    this.selectedOption,
    this.selectedOptions
  });

  void pushAnswer(Option option){
    selectedOptions!.add(option);
  }
}
