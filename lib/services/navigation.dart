import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class NavigationService with ChangeNotifier, DiagnosticableTreeMixin {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushReplacement(String routeName) {
    var state = navigatorKey.currentState;
    return state?.pushReplacementNamed(routeName) ?? Future.value(null);
  }

  void pop() {
    var state = navigatorKey.currentState;
    return state?.pop();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('navigatorKey', navigatorKey.toString()));
  }
}
