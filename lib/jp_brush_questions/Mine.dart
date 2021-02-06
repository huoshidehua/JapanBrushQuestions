import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'config/size_config.dart';
import 'package:fsuper/fsuper.dart';
import 'bloc/CommonBloc.dart';
import 'package:provider/provider.dart';

class Mine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 当前主题
    var brightness =
        Provider.of<CommonBloc>(context, listen: true).themeData.brightness;
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              AppLocalizations.of(context).mine,
            ),
          ),
          // 设置部分
          SliverSafeArea(
            top: false,
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                FSuper(
                  height: 80,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                  corner: FCorner.all(10),
                  backgroundColor: brightness == Brightness.light
                      ? Colors.black38.withOpacity(0.37)
                      : Colors.white38.withOpacity(0.37),
                  margin: EdgeInsets.only(left: 12, right: 12, top: 12),
                  shadowColor: brightness == Brightness.light
                      ? Colors.white38.withOpacity(0.8)
                      : Colors.black38.withOpacity(0.8),
                  shadowBlur: 5,
                  child1: Container(
                    width: 360,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // 登录状态展示 头像, 否则展示登录图标
                        FSuper(
                          width: 60,
                          height: 60,
                          backgroundColor: Colors.white,
                          corner: FCorner.all(90),
                        ),
                        // 主题切换
                        FSuper(
                          width: 60,
                          height: 60,
                          backgroundColor: brightness == Brightness.light
                              ? Colors.black38.withOpacity(0.5)
                              : Colors.white38.withOpacity(0.5),
                          corner: FCorner.all(90),
                          shadowOffset: Offset(0.0, 1.0),
                          child1: Icon(
                            brightness == Brightness.light
                                ? CupertinoIcons.moon
                                : CupertinoIcons.sun_max,
                            color: Colors.white,
                            size: 40,
                          ),
                          onChild1Click: () {
                            Provider.of<CommonBloc>(context, listen: false)
                                .changeTheme();
                          },
                        ),
                        // 语言切换
                        CupertinoContextMenu(

                          child: FSuper(
                            width: 60,
                            height: 60,
                            backgroundColor: brightness == Brightness.light
                                ? Colors.black38.withOpacity(0.5)
                                : Colors.white38.withOpacity(0.5),
                            corner: FCorner.all(90),
                            child1: Text(
                              Provider.of<CommonBloc>(context, listen: false)
                                  .appLanguage,
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          actions: [
                            // 中文
                            CupertinoContextMenuAction(
                              child: Text("zh"),
                              onPressed: () {
                                Provider.of<CommonBloc>(context, listen: false)
                                    .changeLocale("zh");
                                Navigator.pop(context);
                              },
                            ),
                            // 日语
                            CupertinoContextMenuAction(
                              child: Text("ja"),
                              onPressed: () {
                                Provider.of<CommonBloc>(context, listen: false)
                                    .changeLocale("ja");
                                Navigator.pop(context);
                              },
                            ),
                            // 英语
                            CupertinoContextMenuAction(
                              child: Text("en"),
                              onPressed: () {
                                Provider.of<CommonBloc>(context, listen: false)
                                    .changeLocale("en");
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                FSuper(
                  height: 86,
                  padding: EdgeInsets.fromLTRB(12.0 + 80.0 + 12.0, 0, 0, 0),
                  text: '泰国之行',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  textAlignment: Alignment.centerLeft,
                  textAlign: TextAlign.left,
                  spans: [
                    FSuper.VerticalSpace(8),
                    TextSpan(
                        text: '**月**日-**月**日 | **天',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffb8b4b8),
                            fontWeight: FontWeight.normal)),
                  ],
                  corner: FCorner.all(10),
                  backgroundColor: Colors.white,
                  margin: EdgeInsets.only(left: 12, right: 12, top: 12),
                  shadowColor: Colors.black38.withOpacity(0.12),
                  shadowBlur: 5,
                  child1: Container(
                    width: 80,
                    height: 53,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://bkimg.cdn.bcebos.com/pic/023b5bb5c9ea15cef6ee42feb7003af33b87b2c1@wm_1,g_7,k_d2F0ZXIvYmFpa2U5Mg==,xp_5,yp_5",
                        ),
                      ),
                    ),
                  ),
                  child1Alignment: Alignment.centerLeft,
                  child1Margin: EdgeInsets.only(left: 12),
                  child2: FSuper(
                    width: 76,
                    height: 30,
                    text: '查看',
                    style: TextStyle(color: Color(0xff333333)),
                    textAlignment: Alignment.center,
                    corner: FCorner.all(15),
                    strokeWidth: 1,
                    strokeColor: Color(0xfff3f1f7),
                  ),
                  child2Alignment: Alignment.centerRight,
                  child2Margin: EdgeInsets.only(right: 12),
                  onChild2Click: () {},
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
