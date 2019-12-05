import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:news_appv2/screens/businessScreen.dart';
import 'package:news_appv2/screens/entertainmentScreen.dart';
import 'package:news_appv2/screens/scienScreen.dart';
import 'package:news_appv2/screens/techScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentpage = 0;

  final List<Widget> _children = [
    Business(),
    Tech(),
    Entertainment(),
    Science()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: _children[currentpage],
      bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.business, title: "Business"),
            TabData(iconData: Icons.computer, title: "Technology"),
            TabData(iconData: Icons.play_arrow, title: "Entertainment"),
            TabData(iconData: Icons.school, title: "Science")
          ],
          onTabChangedListener: (position) {
            setState(() {
              currentpage = position;
            });
          }),
    );
  }
}
