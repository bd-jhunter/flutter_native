import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutternative/root_tab_page.dart';
import 'package:flutternative/tabbar/contracts_page.dart';
import 'package:flutternative/tabbar/home_page.dart';
import 'package:flutternative/tabbar/setting_page.dart';

import 'first_page.dart';

GlobalKey<RootTabBarPageState> tabBarKey = GlobalKey<RootTabBarPageState>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<ITopPage> pages = [HomePage(), ContractsPage(), SettingPage()];
    var home = RootTabBarPage(key: tabBarKey, pages: pages);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
     home: home,
//       initialRoute: 'firstPage',
//       routes: {
//         'firstPage': (context) => FirstPage(),
//         'secondPage': (context) => SecondPage(),
//       },
    );
  }
}
