import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternative/first_page.dart';
import 'package:flutternative/tabbar/common_widgets.dart';
import 'package:flutternative/util/tab_bar_controller.dart';
import '../main.dart';

import '../root_tab_page.dart';

class ContractsPage extends StatefulWidget with ITopPage {

  @override
  Widget body(BuildContext context) => this;

  @override
  String get title => '联系人';

  @override
  Widget get icon => Icon(Icons.contact_phone);

  @override
  State<StatefulWidget> createState() => _ContractsPageState();
}

class _ContractsPageState extends State<ContractsPage> with AutomaticKeepAliveClientMixin {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      // width: double.infinity,
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '我是一个联系人页面，我是一级页面',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '$_count',
                style: Theme.of(context).textTheme.headline4,
              )),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: JHButtons.applyButton(
              onPressed: _incrementCounter,
              title: '+++',
                height: 30,
            ),
          ),
          JHButtons.applyButton(
            title: '二级页面',
            height: 45,
            fontSize: 16,
            onPressed: () => _pressSomeButton(context),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: JHButtons.applyButton(
              onPressed: _switchTab,
              title: '切换到第一个tab',
              height: 45,
            ),
          ),
        ],
      ),
    );
  }

  // Private methods
  void _pressSomeButton(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) => SecondPage()
        )
    );
  }

  void _switchTab() {
    // GlobalKey rootKey = tabBarKey;
    // RootTabBarPageState rootState = rootKey.currentState;
    // rootState.openTab(0);
    TabBarController().switchTabBar(0);
  }

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  bool get wantKeepAlive => true;
}