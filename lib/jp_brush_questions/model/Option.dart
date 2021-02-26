import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Option {
  String code;
  String text;
  bool correct;

  Option({
    @required this.text,
    @required this.code,
    @required this.correct,
  });

  Option.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    correct = json['correct'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['correct'] = this.correct;
    data['text'] = this.text;
    return data;
  }
}
