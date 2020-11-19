import 'package:flutter/cupertino.dart';

class TabBarController {
  factory TabBarController() => _sharedInstance();
  final PageController pageController = PageController();

  static TabBarController _shared = TabBarController._();
  TabBarController._();

  static TabBarController _sharedInstance() => _shared;

  void switchTabBar(int index) {
    // pageController.animateToPage(index, duration: Duration(milliseconds: 150), curve: Curves.easeInOut);
    // return;
    pageController.jumpToPage(index);
  }
}