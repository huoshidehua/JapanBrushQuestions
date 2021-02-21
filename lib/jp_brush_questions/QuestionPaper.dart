import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionPaper extends StatelessWidget {
  // 等级
  String level;

  // 模块 0:综合，1 文字词汇 2语法 3阅读 4听力
  int questionType;

  QuestionPaper(this.level, this.questionType);

  @override
  Widget build(BuildContext context) {
    var mainColor = const Color(0xFFF1EFE3);
    return CupertinoPageScaffold(
      backgroundColor: mainColor,
      navigationBar: CupertinoNavigationBar(
        middle: Text(level+questionType.toString()),
        backgroundColor: mainColor,
        border: Border(bottom:BorderSide.none),
      ),
      child: Container(),
    );
  }
}
