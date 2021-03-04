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
                InkWell(
                  splashColor: Colors.black87,
                  onTap: () {
                    context.read<NavigationService>().pushReplacement('/');
                  },
                  child: ListTile(
                    leading: Icon(Icons.stacked_bar_chart),
                    title: Text("Home"),
                  ),
                ),
                InkWell(
                  splashColor: Colors.black87,
                  onTap: () {
                    context
                        .read<NavigationService>()
                        .pushReplacement('/product')
                        .then((value) => Navigator.of(context).pop());
                    ;
                  },
                  child: ListTile(
                    leading: Icon(Icons.stacked_bar_chart),
                    title: Text("Product"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
