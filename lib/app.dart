import 'package:dashboard_flutter/services/navigation.dart';
import 'package:dashboard_flutter/templates/app_template.dart';
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
      title:
          'Flutter Demo - ' + Provider.of<NavigationService>(context).titlePage,
      theme: ThemeData(
        hoverColor: Colors.blue.withOpacity(0.2),
        splashColor: Colors.black87,
        primarySwatch: Colors.blue,
      ),
      home: AppTemplate(),
    );
  }
}
