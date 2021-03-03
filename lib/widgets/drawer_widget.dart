import 'package:dashboard_flutter/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MenuWidget(),
    );
  }
}
