import 'package:flutter/cupertino.dart';

class NavigatorConfig {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static BuildContext get overlayContext => navigatorKey.currentState.overlay.context;

  static BuildContext get navigatorContext => navigatorKey.currentContext;
  // 屏幕宽度
  static double get screenWidth => MediaQuery.of(navigatorContext).size.width;
  // 屏幕高度
  static double get screenHeight => MediaQuery.of(navigatorContext).size.height;
}
