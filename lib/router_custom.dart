import 'package:dashboard_flutter/pages/home_page.dart';
import 'package:dashboard_flutter/pages/local_storage_page.dart';
import 'package:dashboard_flutter/pages/product_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouterCustom {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.route:
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => HomePage(),
          transitionDuration: Duration(seconds: 0),
          settings: settings,
        );
      case LocalStoragePage.route:
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => LocalStoragePage(),
          transitionDuration: Duration(seconds: 0),
          settings: settings,
        );
      case ProductPage.route:
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => ProductPage(),
          transitionDuration: Duration(seconds: 0),
          settings: settings,
        );
      default:
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => HomePage(),
          transitionDuration: Duration(seconds: 0),
          settings: settings,
        );
    }
  }
}
