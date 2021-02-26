import 'package:flutter/cupertino.dart';

import 'package:myapp/jp_brush_questions/model/Option.dart';

class Question {
  String text;
  List<Option> options;
  String solution;
  bool locked;
  Option selectedOption;

  Question({
    @required this.text,
    @required this.options,
    @required this.solution,
    this.locked = false,
    this.selectedOption,
  });

  Question.fromJson(Map<String, dynamic> json) {
    solution = json['solution'];
    if (json['options'] != null) {
      options = new List<Option>();(json['options'] as List).forEach((v) { options.add(new Option.fromJson(v)); });
    }
    text = json['text'];
    locked = json['locked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['solution'] = this.solution;
    if (this.options != null) {
      data['options'] =  this.options.map((v) => v.toJson()).toList();
    }
    data['text'] = this.text;
    data['locked'] = this.locked;
    return data;
  }
}