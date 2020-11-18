import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../root_tab_page.dart';
import 'common_widgets.dart';

class SettingPage extends StatelessWidget with ITopPage {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '我是一个设置页，我是一级页面',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          JHButtons.applyButton(
            title: '二级页面',
            height: 45,
            fontSize: 16,
            onPressed: _pressSomeButton,
          )
        ],
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return build(context);
  }

  @override
  String get title => '设定';

  @override
  Widget get icon => Icon(Icons.people);

  // Private methods
  void _pressSomeButton() {}
}