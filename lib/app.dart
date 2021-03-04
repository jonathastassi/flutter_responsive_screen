import 'package:dashboard_flutter/pages/home_page.dart';
import 'package:dashboard_flutter/pages/product_page.dart';
import 'package:dashboard_flutter/router_custom.dart';
import 'package:dashboard_flutter/services/navigation.dart';
import 'package:dashboard_flutter/widgets/drawer_widget.dart';
import 'package:dashboard_flutter/widgets/menu_widget.dart';
import 'package:dashboard_flutter/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        hoverColor: Colors.blue.withOpacity(0.2),
        splashColor: Colors.black87,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: AppLayout(),
    );
  }
}

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveWidget.isDesktop(context) == false
          ? AppBar(
              title: Text("Product"),
            )
          : null,
      drawer:
          ResponsiveWidget.isDesktop(context) == false ? DrawerWidget() : null,
      body: Row(
        children: [
          ResponsiveWidget(
            showDesktop: true,
            child: Container(
              width: 300,
              color: Colors.black.withOpacity(.2),
              child: MenuWidget(),
            ),
          ),
          Expanded(
            child: Container(
              child: Navigator(
                key: context.watch<NavigationService>().navigatorKey,
                onGenerateRoute: RouterCustom.onGenerateRoute,
                reportsRouteUpdateToEngine: true,
                onPopPage: (route, result) {
                  if (!route.didPop(result)) return false;
                  return true;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
