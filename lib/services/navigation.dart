import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavigationService with ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String _titlePage = "Home";
  String get titlePage => _titlePage;
  String _routeActual = "/";
  String get routeActual => _routeActual;

  Future<dynamic> pushReplacement(String routeName,
      {String titlePage = "",
      BuildContext? context,
      bool closeDrawer = false}) {
    var state = navigatorKey.currentState;
    _titlePage = titlePage;
    _routeActual = routeName;
    notifyListeners();

    if (scaffoldKey.currentState?.isDrawerOpen == true &&
        closeDrawer == true &&
        context != null) {
      Navigator.of(context).pop();
    }
    return state?.pushReplacementNamed(routeName) ?? Future.value(null);
  }

  void pop() {
    var state = navigatorKey.currentState;
    return state?.pop();
  }
}
