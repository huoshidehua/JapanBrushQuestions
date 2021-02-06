import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var descTextStyle = new TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        fontSize: 18.0,
        height: 2.0);

    /* 图标 文字 */
    var iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Column(
                children: [
                  new Icon(Icons.kitchen, color: Colors.green[500]),
                  new Text('PERP:'),
                  new Text('25 min')
                ],
              ),
              new Column(
                children: [
                  new Icon(Icons.timer, color: Colors.green[500]),
                  new Text('COOK:'),
                  new Text('1 hr')
                ],
              ),
              new Column(
                children: [
                  new Icon(Icons.restaurant, color: Colors.green[500]),
                  new Text('FEEDS:'),
                  new Text('4-6')
                ],
              ),
            ],
          ),
        ));
    /* 评分 */
    var ratings = new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new Icon(Icons.star, color: Colors.green[500]),
              new Icon(Icons.star, color: Colors.green[500]),
              new Icon(Icons.star, color: Colors.green[500]),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
            ],
          ),
          new Text(
            "170 Reviews",
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );
    /* 3张图片 */
    var images3 = new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        new Expanded(child: new Image.asset('images/pic1.jpg')),
        new Expanded(child: new Image.asset('images/pic2.jpg')),
        new Expanded(child: new Image.asset('images/pic3.jpg')),
      ],
    );

    final titleText = Container(
      padding: EdgeInsets.all(20),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );

    final subTitle = Text(
      'Pavlova is a meringue-based dessert named after the Russian ballerina '
      'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
      'topped with fruit and whipped cream.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25,
      ),
    );

    final leftColumn = new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: new Column(
        children: [
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );

    final mainImage = Image.asset(
      'images/pavlova.jpg',
      fit: BoxFit.cover,
    );

    Widget buildHomePage(String title) {
      return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            height: 1000,
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 440,
                    child: leftColumn,
                  ),
                  mainImage
                ],
              ),
            ),
          ),
        ),
      );
    }

    return new MaterialApp(
      title: 'Flutter layout demo',
      home: buildHomePage('Strawberry Pavlova Recipe'),
    );

    /* return Scaffold(
      appBar: new AppBar(
        title: new Text("布局操作"),
      ),
      body: new Center(
          child: Column(
        children: [
          // 3个图片
          images3,
          // 评价和评论数量
          ratings,
          // 3个图标和文字
          iconList
        ],
      )),
    ); */
  }
}
