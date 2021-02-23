import 'package:flutter/cupertino.dart';
import 'Question.dart';

/// 日语等级 实体
class JapaneseLevel{

  final String level;
  final String description;
  final List<Question> questions;
  final String audioUrl;


  JapaneseLevel({
    @required this.level,
    @required this.description,
    @required this.questions,
    this.audioUrl
  });

}