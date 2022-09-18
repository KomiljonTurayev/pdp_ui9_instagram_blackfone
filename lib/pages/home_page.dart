import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdp_ui9_instagram_blackfone/pages/feed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  var _pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Center(
          child: Text(
            'Instagram',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          icon: Icon(Feather.camera),
          color: Colors.grey,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Feather.tv),
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesome.send_o),
            color: Colors.grey,
          )
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i) {
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Foundation.home),label: ('Feed')),
            BottomNavigationBarItem(icon: Icon(Feather.search),label: ('Search')),
            BottomNavigationBarItem(icon: Icon(Feather.plus_square),label: ('Upload')),
            BottomNavigationBarItem(icon: Icon(Feather.heart),label: ('Likes')),
            BottomNavigationBarItem(icon: Icon(Feather.user),label: ('Account')),
          ],
      ),
    );
  }
}
