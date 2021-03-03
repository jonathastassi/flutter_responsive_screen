import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
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
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
                ListTile(
                  leading: Icon(Icons.stacked_bar_chart),
                  title: Text("Informações"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
