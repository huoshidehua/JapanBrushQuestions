import 'dart:async';

import 'package:flutter/cupertino.dart';

/// common state for app ,like theme data or language etc
class CommonBloc with ChangeNotifier {
  //  app 外观主题
  CupertinoThemeData _themeData =  CupertinoThemeData(brightness: Brightness.light);

  //  app 显示语言
  String _appLanguage =  "zh";

  CupertinoThemeData get themeData => _themeData;

  String get appLanguage => _appLanguage;


  // 切换主题
  changeTheme() {
    _themeData = (_themeData.brightness == Brightness.light)
        ? CupertinoThemeData(brightness: Brightness.dark)
        : CupertinoThemeData(brightness: Brightness.light);
    notifyListeners();
  }

  // 切换语言
  changeLocale(String locale) {
    _appLanguage = locale;
    notifyListeners();
  }
}
