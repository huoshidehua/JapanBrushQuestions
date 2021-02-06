import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myapp/stack_card.dart';

import 'package:provider/provider.dart';

import 'gsy_book_learning/lesson1.dart';
import 'jp_brush_questions/Layout.dart';
import 'jp_brush_questions/bloc/CommonBloc.dart';
import 'model/app_state_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// 传统风格
//void main() => runApp(new MyApp());
void main() {
  var commonBloc = CommonBloc();
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: commonBloc),
      ],
      child: JapaneseBrushQuestionsApp(),
    ),
  );
}

// 日语刷题页面
class JapaneseBrushQuestionsApp extends StatelessWidget {
  @override
  Widget build(context) {
    Locale deviceLocale = Localizations.localeOf(context, nullOk: true);

    return Consumer<CommonBloc>(
      builder: (context, CommonBloc commonBloc, child) => CupertinoApp(
        locale: (null ==
                Provider.of<CommonBloc>(context, listen: false).appLanguage)
            ? deviceLocale
            : Locale(
                Provider.of<CommonBloc>(context, listen: false).appLanguage),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        // Add this line
        supportedLocales: AppLocalizations.supportedLocales,
        // Add this line
        debugShowCheckedModeBanner: false,
        home: Layout(),
        theme: commonBloc.themeData,
      ),
    );

    /*return StreamBuilder(
      initialData: CupertinoThemeData(brightness: Brightness.light),
      stream: Provider.of<CommonBloc>(context).themeStream,
      builder: (context, snapshot) {
        return CupertinoApp(
          locale: (null == Provider.of<CommonBloc>(context,listen: false).appLocale)
              ? deviceLocale
              : Locale(Provider.of<CommonBloc>(context,listen: false).appLocale),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          // Add this line
          supportedLocales: AppLocalizations.supportedLocales,
          // Add this line
          debugShowCheckedModeBanner: false,
          home: Layout(),
          theme: snapshot.data,
        );
      },
    );*/
  }
}

// ios 风格
/*void main() {
  // This app is designed only to work vertically, so we limit
  // orientations to portrait up and down.
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  return runApp(
    ChangeNotifierProvider<AppStateModel>(
      builder: (context) {
        return AppStateModel()..loadProducts();
      },
      //create: (context) => AppStateModel()..loadProducts(), // NEW
      child: CupertinoStoreApp(), // NEW
    ),
  );
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      theme: new ThemeData(primaryColor: Colors.white),
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
          new IconButton(
              icon: new Icon(Icons.access_alarms),
              onPressed: _learningNavigator),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _learningNavigator() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      //return CupertinoStoreApp();
      return StackCard();
      //return DemoPage();
      //return GridList();
      //return new Layout();
      /* return new ShoppingList(
        products: <Product>[
          new Product(name: 'Eggs'),
          new Product(name: 'Flour'),
          new Product(name: 'Chocolate chips'),
        ],
      ); */
      // return new Counter();
      //return new TutorialHome();
      /* new Scaffold(
          appBar: new AppBar(title: new Text('测试学习中')),
          // body: new Learning().appbarTest(new Text('测试中测试中测试中')));
          body: new Learning().paperTest(context));*/
    }));
  }

  // 导航到收藏页面
  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map(
        (pair) {
          return new ListTile(
            title: new Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      );
      final divided =
          ListTile.divideTiles(tiles: tiles, context: context).toList();
      return new Scaffold(
        appBar: new AppBar(title: new Text('Saved Suggestions')),
        body: new ListView(children: divided),
      );
    }));
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
