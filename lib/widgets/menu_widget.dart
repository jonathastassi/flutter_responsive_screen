import 'package:dashboard_flutter/pages/product_page.dart';
import 'package:dashboard_flutter/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuWidget extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    print("buildou o menu");

    return Column(
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            child: Text("JT"),
          ),
          accountEmail: Text(
            "jonathastassi@hotmail.com",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          accountName: Text(
            "Jonathas",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        Expanded(
          child: Scrollbar(
            isAlwaysShown: true,
            controller: _scrollController,
            showTrackOnHover: true,
            child: ListView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              children: [
                MenuItem(
                  routeName: '/',
                  pageName: 'Home',
                ),
                MenuItem(
                  routeName: '/product',
                  pageName: 'Products',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final String routeName;
  final String pageName;

  MenuItem({required this.routeName, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black87,
      onTap: () {
        context.read<NavigationService>().pushReplacement(routeName,
            titlePage: pageName, context: context, closeDrawer: true);
      },
      child: ListTile(
        leading: Icon(Icons.stacked_bar_chart),
        title: Text(
          pageName,
          style: TextStyle(
              fontWeight:
                  context.read<NavigationService>().routeActual == routeName
                      ? FontWeight.bold
                      : FontWeight.normal),
        ),
      ),
    );
  }
}
