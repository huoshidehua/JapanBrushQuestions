import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsuper/fsuper.dart';
import 'Today.dart';
import 'bloc/CommonBloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsuper/fsuper.dart';
import 'package:animations/animations.dart';
import 'package:myapp/jp_brush_questions/model/OpenPaperFunctionParam.dart';
import 'package:myapp/jp_brush_questions/QuestionPaper.dart';

class BrushQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var brightness = Provider.of<CommonBloc>(context, listen: true).themeData.brightness;
    var N5Image = const AssetImage("images/kyotomomiji.jpg");
    var N4Image = const AssetImage("images/donbori.jpg");
    var N3Image = const AssetImage("images/fujisan.jpg");
    var N2Image = const AssetImage("images/donbori.jpg");
    var N1Image = const AssetImage("images/donbori.jpg");
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text(AppLocalizations.of(context).brushQuestions),
          ),
          // 主题部分
          SliverSafeArea(
            top: false,
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                // 可滑动的 日语组件
                JapaneseLevelScroller(context, "N5", N5Image, brightness),
                JapaneseLevelScroller(context, "N4", N4Image, brightness),
                JapaneseLevelScroller(context, "N3", N3Image, brightness),
                JapaneseLevelScroller(context, "N2", N2Image, brightness),
                JapaneseLevelScroller(context, "N1", N1Image, brightness),
              ]),
            ),
          )
        ],
      ),
    );
  }

  /// 日语考试等级 横向滑动
  Widget JapaneseLevelScroller(BuildContext context, String level, AssetImage levelImage, Brightness brightness) {
    // 文字颜色
    var wordColor = const Color(0xFF76D7C4);
    ContainerTransitionType _transitionType = ContainerTransitionType.fade;

    /* void _showMarkedAsDoneSnackbar(bool isMarkedAsDone) {
      if (isMarkedAsDone ?? false)
        Scaffold.of(context).showSnackBar(const SnackBar(
          content: Text('Marked as done!'),
        ));
    }*/

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(12, 12, 0, 0),
          child: Text(level, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        // SizedBox(height: 16),
        Container(
          height: 160,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              /// ios appstore 动画 弹出页面
              /// 综合 就是模拟 考试了
              toTestPaper(OpenPaperFunctionParam(brightness, context, _transitionType, wordColor, levelImage, AppLocalizations.of(context).comprehensive, level, 0)),

              /// 文字词汇
              toTestPaper(OpenPaperFunctionParam(brightness, context, _transitionType, wordColor, levelImage, AppLocalizations.of(context).words, level, 1)),

              /// 语法
              toTestPaper(OpenPaperFunctionParam(brightness, context, _transitionType, wordColor, levelImage, AppLocalizations.of(context).grammar, level, 2)),

              /// 阅读理解
              toTestPaper(OpenPaperFunctionParam(brightness, context, _transitionType, wordColor, levelImage, AppLocalizations.of(context).read, level, 3)),

              /// 听力
              toTestPaper(OpenPaperFunctionParam(brightness, context, _transitionType, wordColor, levelImage, AppLocalizations.of(context).listen, level, 4)),
            ],
          ),
        ),
      ],
    );
  }

  /// 打开刷题页面
  OpenContainer<bool> toTestPaper(OpenPaperFunctionParam param) {
    return OpenContainer<bool>(
      useRootNavigator: false,
      closedShape: const RoundedRectangleBorder(),
      closedElevation: 0.0,
      closedColor: param.brightness == Brightness.light ? CupertinoTheme.of(param.context).scaffoldBackgroundColor : CupertinoTheme.of(param.context).primaryContrastingColor,
      transitionType: param.transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return  QuestionPaper(level: param.level, questionType: param.questionType);
      },
      onClosed: (data) {
        //print(1);
      },
      tappable: true,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return FSuper(
          text: param.cardText,
          style: TextStyle(fontSize: 65, fontWeight: FontWeight.bold, color: param.wordColor),
          textAlignment: Alignment.center,
          height: 160,
          margin: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          width: MediaQuery.of(param.context).size.width * 0.65,
          corner: FCorner.all(15),
          shadowBlur: 5,
          backgroundImage: param.levelImage,
          onClick: () {
            openContainer();
          },
        );
      },
    );
  }
}
