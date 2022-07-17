import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Optionn {
  final String? code;
  final String? text;
  final bool? isCorrect;

  const Optionn({
    @required this.text,
    @required this.code,
    @required this.isCorrect,
  });
}
