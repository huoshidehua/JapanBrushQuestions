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
    var textColor = CupertinoColors.black;
    var iconColor = CupertinoColors.black;

    /// 图标字体大小
    double iconSize = 28.0;

    /// 导航条 右侧图标按钮 paddinng
    var traingBtnsPadding = const EdgeInsets.only(left: 0, right: 0);
    return CupertinoPageScaffold(
      backgroundColor: mainColor,
      navigationBar: CupertinoNavigationBar(
        padding: const EdgeInsetsDirectional.only(start: 10.0, end: 2.0),

        /// 左侧关闭按钮
        leading: CupertinoButton(
          padding: traingBtnsPadding,
          color: mainColor,
          minSize: 20.0,
          child: Icon(
            CupertinoIcons.clear_thick_circled,
            size: iconSize,
            color: iconColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        middle: Text(
          level + questionType.toString(),
          style: TextStyle(
            color: textColor,
          ),
        ),
        backgroundColor: mainColor,
        border: Border(bottom: BorderSide.none),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// 右侧保存进度按钮
            CupertinoButton(
              padding: traingBtnsPadding,
              color: mainColor,
              child: Icon(
                Icons.save_rounded,
                size: iconSize + 4,
                color: iconColor,
              ),
              onPressed: () {},
            ),

            /// 右侧设置按钮 设置字体大小之类的
            CupertinoButton(
              padding: traingBtnsPadding,
              color: mainColor,
              child: Icon(
                CupertinoIcons.settings_solid,
                size: iconSize,
                color: iconColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      child: SafeArea(
          
      ),
    );
  }
}
