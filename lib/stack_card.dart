import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false; // Set to true for visual layout
  runApp(StackCard());
}

class StackCard extends StatelessWidget {
  static final showCard = true; // Set to false to show Stack
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        bottomNavigationBar: buildBottomBar(),
        appBar: AppBar(
          title: Text('Flutter layout demo'),
          bottom: TabBar(
            isScrollable: false,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(icon: Icon(Icons.home), text: '推荐'),
              Tab(icon: Icon(Icons.star), text: 'N5'),
              Tab(icon: Icon(Icons.face), text: 'N4'),
              Tab(icon: Icon(Icons.settings), text: 'N3'),
              Tab(icon: Icon(Icons.settings), text: 'N2'),
              Tab(icon: Icon(Icons.settings), text: 'N1')
            ],
          ),
          elevation: 20,
          titleSpacing: 20,
        ),
        body: Center(child: showCard ? _buildCard() : _buildStack()),
      ),
    );
  }

  // #docregion Card
  Widget _buildCard() => SizedBox(
        height: 210,
        child: Card(
          elevation: 24,
          child: Column(
            children: [
              ListTile(
                title: Text('1625 Main Street',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Text('My City, CA 99984'),
                leading: Icon(
                  Icons.restaurant_menu,
                  color: Colors.blue[500],
                ),
              ),
              Divider(),
              ListTile(
                title: Text('(408) 555-1212',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                leading: Icon(
                  Icons.contact_phone,
                  color: Colors.blue[500],
                ),
              ),
              ListTile(
                title: Text('costa@example.com'),
                leading: Icon(
                  Icons.contact_mail,
                  color: Colors.blue[500],
                ),
              ),
            ],
          ),
        ),
      );

  // #enddocregion Card

  // #docregion Stack
  Widget _buildStack() => Stack(
        alignment: const Alignment(0.6, 0.6),
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/pic0.jpg'),
            radius: 100,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              'Mia B',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Colors.purple,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Text('AppBar', style: style),
          label: 'Normal',
        ),
        BottomNavigationBarItem(
          icon: Text('AppBar', style: style),
          label: 'Transparent',
        ),
      ],
      onTap: (int index) => () => this.index = index,
    );
  }

// #enddocregion Stack
}
