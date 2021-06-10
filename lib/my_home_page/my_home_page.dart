import 'package:flutter/material.dart';
import 'package:share_app/my_home_page/video_list.dart';
import 'package:share_app/model/abc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bottomNavigationBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('video')),
        ],
        currentIndex: bottomNavigationBarIndex,
        onTap: bottomNavigationBarOnTap,
      ),
    );
  }

  void bottomNavigationBarOnTap(int index) {
    setState(() {
      bottomNavigationBarIndex = index;
    });
  }

  Widget body() {
    switch (bottomNavigationBarIndex) {
      case 0:
        return VideoPlayerApp();
      case 1:
        return VideoList();
    }
    return Text('ghi');
  }
}

