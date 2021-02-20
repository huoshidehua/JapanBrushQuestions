import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsuper/fsuper.dart';
import 'Today.dart';
import 'bloc/CommonBloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsuper/fsuper.dart';
import 'package:animations/animations.dart';

class BrushQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var brightness =
        Provider.of<CommonBloc>(context, listen: true).themeData.brightness;
    var N5Image = const AssetImage("images/kyotomomiji.jpg");
    var N4Image = const AssetImage("images/donbori.jpg");
    var N3Image = const AssetImage("images/fujisan.jpg");
    var N2Image = const AssetImage("images/donbori.jpg");
    var N1Image = const AssetImage("images/donbori.jpg");
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              AppLocalizations.of(context).brushQuestions,
            ),
          ),
          // 主题部分
          SliverSafeArea(
            top: false,
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                // 可滑动的 日语组件
                JapaneseLevelScroller(context, "N5", N5Image,brightness),
                JapaneseLevelScroller(context, "N4", N4Image,brightness),
                JapaneseLevelScroller(context, "N3", N3Image,brightness),
                JapaneseLevelScroller(context, "N2", N2Image,brightness),
                JapaneseLevelScroller(context, "N1", N1Image,brightness),

                // N5 框框
                /*JapaneseLevel("N5", "images/kyotomomiji.jpg", () {
                  print("N5");
                }),*/

                // N4
                /*JapaneseLevel("N4", "images/donbori.jpg", () {
                  print("N4");
                }),*/

                // N3
                /*JapaneseLevel("N3", "images/fujisan.jpg", () {
                  print("N3");
                }),*/
                // N2
                /*JapaneseLevel("N2", "images/fujisan.jpg", () {
                  print("N2");
                }),*/
                // N1
                /* JapaneseLevel("N1", "images/fujisan.jpg", () {
                  print("N1");
                }),*/
              ]),
            ),
          )
        ],
      ),
    );
  }

  /// 日语语言等级 初版 废弃
  Widget JapaneseLevel(String level, String imageUrl, Function clickFunction) {
    return FSuper(
      isSupportNeumorphism: true,
      float: true,
      text: level,
      style: TextStyle(
        fontSize: 132,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent.withOpacity(0.8),
      ),
      textAlignment: Alignment.center,
      height: 160,
      margin: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
      padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
      width: double.infinity,
      corner: FCorner.all(15),
      shadowBlur: 5,
      backgroundImage: AssetImage(imageUrl),
      onClick: () {
        clickFunction();
      },
    );
  }

  /// 日语考试等级 横向滑动
  Widget JapaneseLevelScroller(
      BuildContext context, String level, AssetImage levelImage, Brightness brightness) {
    // 文字颜色
    var wordColor = const Color(0xFF76D7C4);
    ContainerTransitionType _transitionType = ContainerTransitionType.fade;

    void _showMarkedAsDoneSnackbar(bool isMarkedAsDone) {
      if (isMarkedAsDone ?? false)
        Scaffold.of(context).showSnackBar(const SnackBar(
          content: Text('Marked as done!'),
        ));
    }

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(12, 12, 0, 0),
          child: Text(
            level,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        // SizedBox(height: 16),
        Container(
          height: 160,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              /// ios appstore 动画 弹出页面
              OpenContainer<bool>(
                closedShape: const RoundedRectangleBorder(),
                closedElevation: 0.0,
                closedColor:  brightness == Brightness.light
                    ? CupertinoTheme.of(context).scaffoldBackgroundColor
                    : CupertinoTheme.of(context).primaryContrastingColor,
                transitionType: _transitionType,
                openBuilder: (BuildContext context, VoidCallback _) {
                  return  Today();
                },
                onClosed: _showMarkedAsDoneSnackbar,
                tappable: true,
                closedBuilder: (BuildContext _, VoidCallback openContainer) {
                  return FSuper(
                    text: AppLocalizations.of(context).comprehensive,
                    style: TextStyle(
                      fontSize: 65,
                      fontWeight: FontWeight.bold,
                      color: wordColor,
                    ),
                    textAlignment: Alignment.center,
                    height: 160,
                    margin: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                    padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                    width: MediaQuery.of(context).size.width * 0.65,
                    corner: FCorner.all(15),
                    shadowBlur: 5,
                    backgroundImage: levelImage,
                    onClick: () {
                      openContainer();
                    },
                  );
                },
              ),

              /// 综合 就是模拟 考试了
              FSuper(
                text: AppLocalizations.of(context).comprehensive,
                style: TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                  color: wordColor,
                ),
                textAlignment: Alignment.center,
                height: 160,
                margin: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                width: MediaQuery.of(context).size.width * 0.65,
                corner: FCorner.all(15),
                shadowBlur: 5,
                backgroundImage: levelImage,
                onClick: () {},
              ),

              /// 文字词汇
              FSuper(
                text: AppLocalizations.of(context).words,
                style: TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                  color: wordColor,
                ),
                textAlignment: Alignment.center,
                height: 160,
                margin: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                width: MediaQuery.of(context).size.width * 0.65,
                corner: FCorner.all(15),
                shadowBlur: 5,
                backgroundImage: levelImage,
                onClick: () {},
              ),

              /// 语法
              FSuper(
                text: AppLocalizations.of(context).grammar,
                style: TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                  color: wordColor,
                ),
                textAlignment: Alignment.center,
                height: 160,
                margin: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                width: MediaQuery.of(context).size.width * 0.65,
                corner: FCorner.all(15),
                shadowBlur: 5,
                backgroundImage: levelImage,
                onClick: () {},
              ),

              /// 阅读理解
              FSuper(
                text: AppLocalizations.of(context).read,
                style: TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                  color: wordColor,
                ),
                textAlignment: Alignment.center,
                height: 160,
                margin: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                width: MediaQuery.of(context).size.width * 0.65,
                corner: FCorner.all(15),
                shadowBlur: 5,
                backgroundImage: levelImage,
                onClick: () {},
              ),

              /// 听力
              FSuper(
                text: AppLocalizations.of(context).listen,
                style: TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                  color: wordColor,
                ),
                textAlignment: Alignment.center,
                height: 160,
                margin: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                width: MediaQuery.of(context).size.width * 0.65,
                corner: FCorner.all(15),
                shadowBlur: 5,
                backgroundImage: levelImage,
                onClick: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
