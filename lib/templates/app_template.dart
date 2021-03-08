import 'package:dashboard_flutter/router_custom.dart';
import 'package:dashboard_flutter/services/navigation.dart';
import 'package:dashboard_flutter/widgets/drawer_widget.dart';
import 'package:dashboard_flutter/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dashboard_flutter/widgets/menu_widget.dart';

class AppTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<NavigationService>().scaffoldKey,
      appBar: ResponsiveWidget.isDesktop(context) == false
          ? AppBar(
              title: Text(Provider.of<NavigationService>(context).titlePage),
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
                ),
              ),
          ),
        ],
      ),
    );
  }
}
