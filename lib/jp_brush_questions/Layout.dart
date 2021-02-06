import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'BrushQuestions.dart';
import 'Mine.dart';
import 'Today.dart';
import 'config/size_config.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // 初始化 页面 列表
    List tableView = [
      Today(),
      BrushQuestions(),
      Mine(),
    ];
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.today,
              size: SizeConfig.defaultSize * 2.5,
            ),
            label: AppLocalizations.of(context).today,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.paperplane_fill,
              size: SizeConfig.defaultSize * 2.5,
            ),
            label: AppLocalizations.of(context).brushQuestions,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_crop_circle,
              size: SizeConfig.defaultSize * 2.5,
            ),
            label: AppLocalizations.of(context).mine,
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          defaultTitle: AppLocalizations.of(context).today,
          builder: (context) {
            return tableView[index];
          },
        );
      },
    );
  }
}
