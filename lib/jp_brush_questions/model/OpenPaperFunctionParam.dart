import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';

/// 刷题 卡片组件 打开 参数
class OpenPaperFunctionParam {
  Brightness brightness;
  BuildContext context;
  ContainerTransitionType transitionType;
  Color wordColor;
  AssetImage levelImage;

  // 卡片文字标题
  String cardText;

  // 等级
  String level;

  // 模块 0:综合，1 文字词汇 2语法 3阅读 4听力
  int questionType;

   OpenPaperFunctionParam(
      this.brightness,
      this.context,
      this.transitionType,
      this.wordColor,
      this.levelImage,
      this.cardText,
      this.level,
      this.questionType);
}
