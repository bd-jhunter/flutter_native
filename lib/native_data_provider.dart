import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutternative/util/navigator_config.dart';
import 'package:flutternative/util/tab_bar_controller.dart';

class NativeDataProvider {
  factory NativeDataProvider() => _sharedInstance();

  static NativeDataProvider _shared = NativeDataProvider._();
  final _nativeChannel = MethodChannel('com.jh.flutter/hybridstack');

  NativeDataProvider._() {
    _prepare();
  }

  static NativeDataProvider _sharedInstance() => _shared;

  Future invokeMethod(PlatformMethod method, [Map<String, dynamic> arguments]) => _invokeMethodInChannel(_nativeChannel, method.rawValue, arguments);

  void _prepare() {
    _nativeChannel.setMethodCallHandler((call) {
      switch (call.method) {
        case 'openTab':
          if (call.arguments is int) {
            int pageIndex = call.arguments;
            Navigator.of(NavigatorConfig.navigatorContext).popUntil((route) => route.isFirst);
            TabBarController().switchTabBar(pageIndex);
          }
          break;
        case 'pushNamed':
          break;
        default:
          break;
      }

      return null;
    });
  }

  Future _invokeMethodInChannel(MethodChannel channel, String method, Map<String, dynamic> arguments) => channel.invokeMethod(method, arguments);
}

enum PlatformMethod {
  openTab,
  openNative,
  pushNamed,
  close,
}

extension on PlatformMethod {
  String get rawValue => describeEnum(this);
}
