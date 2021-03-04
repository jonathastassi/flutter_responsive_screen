import 'package:dashboard_flutter/app.dart';
import 'package:dashboard_flutter/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationService()),
      ],
      child: App(),
    ),
  );
}
