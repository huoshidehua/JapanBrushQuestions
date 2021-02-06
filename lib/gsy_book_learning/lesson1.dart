import 'package:flutter/material.dart';

class DemoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      appBar: AppBar(
        title: Text('Gsy lesson 1'),
      ),
      body: newLayout(),
    );*/
    return newLayout();
  }

  Widget _getBottomItem(IconData icon, String text) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Icon(
              icon,
              size: 16,
              color: Colors.grey,
            ),
            Padding(padding: EdgeInsets.only(left: 5)),
            Text(
              text,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget newLayout() {
    return Container(
      child: Card(
        child: FlatButton(
          onPressed: () {
            print("点击");
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: 0,
              top: 10,
              right: 10,
              bottom: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Text(
                    "这是一点描述",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: EdgeInsets.only(top: 6, bottom: 2),
                  alignment: Alignment.topLeft,
                ),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getBottomItem(Icons.star, "1000"),
                    _getBottomItem(Icons.link, "1000"),
                    _getBottomItem(Icons.subject, "1000"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return DemoItem();
        },
        itemCount: 20,
      ),
    );
  }
}
