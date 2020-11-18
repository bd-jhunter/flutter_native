import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin ITopPage {
  String get title;

  Widget get icon;

  Widget body(BuildContext context);
}

// ignore: must_be_immutable
class RootTabBarPage extends StatefulWidget {
  final RootTabBarPageState _state;

  RootTabBarPage({Key key, @required List<ITopPage> pages})
      : _state = RootTabBarPageState(pages),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _state;
}

class RootTabBarPageState extends State<RootTabBarPage> {
  final List<ITopPage> _pages;
  final PageController _pageController = PageController(keepPage: true);
  int _currentIndex = 0;

  RootTabBarPageState(this._pages);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是一个Flutter'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        //底部导航栏按钮选中时的颜色
        type: BottomNavigationBarType.fixed,
        //底部导航栏的适配，当item多的时候都展示出来
        currentIndex: _currentIndex,
        onTap: _onPageChanged,
        items: _pages.map((e) => BottomNavigationBarItem(icon: e.icon, title: Text(e.title))).toList(),
      ),
      body: _pageView(context),
    );
  }

  void openTab(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _pageView(BuildContext context) {
    return PageView(
      children: _pages.map((e) => e.body(context)).toList(),
      controller: _pageController,
    );
  }

  void _onPageChanged(int index) {
    openTab(index);
  }

}

/*
* 存档
     return Scaffold(
      appBar: AppBar(
        title: Text('我是一个Flutter'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        //底部导航栏按钮选中时的颜色
        type: BottomNavigationBarType.fixed,
        //底部导航栏的适配，当item多的时候都展示出来
        currentIndex: _currentIndex,
        onTap: _onPageChanged,
        items: _pages.map((e) => BottomNavigationBarItem(icon: e.icon, title: Text(e.title))).toList(),
      ),
      body: PageView(
        children: _pages.map((e) => e.body(context)).toList(),
        controller: _pageController,
      ),
    );

*/