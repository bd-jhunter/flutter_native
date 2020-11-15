import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirstPage extends StatelessWidget {
  MethodChannel _methodChannelPlugin = const MethodChannel('com.jh.rootchannel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('我是一只Flutter Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('我是一个Flutter页面，我是First'),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text('打开Native'),
              onPressed: _openNative,
            ),
            _SomeDataWidget(),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text('回到Native'),
              onPressed: () => _backToNative(context),
            ),
          ],
        ),
      ),
    );
  }

  void _openNative() {
    _methodChannelPlugin.invokeMethod('openfirst');
  }

  void _backToNative(BuildContext context) {
    Navigator.of(context).pop();
    _methodChannelPlugin.invokeMethod('close');
  }
}

class SecondPage extends StatelessWidget {
  MethodChannel _methodChannelPlugin = const MethodChannel('com.jh.rootchannel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('我是一只Flutter Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('我是第二个Flutter页面，我是Second'),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text('打开Native'),
              onPressed: _openNative,
            ),
            _SomeDataWidget(),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text('回到Native'),
              onPressed: () => _backToNative(context),
            ),
          ],
        ),
      ),
    );
  }

  void _openNative() {
    _methodChannelPlugin.invokeMethod('opensecond');
  }

  void _backToNative(BuildContext context) {
    Navigator.of(context).pop();
    _methodChannelPlugin.invokeMethod('close');
  }
}

class _SomeDataWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SomeDataState();

}

class _SomeDataState extends State<_SomeDataWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, bottom: 50),
      child: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ],
      ),
    );
  }

}