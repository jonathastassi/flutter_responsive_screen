import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final bool showMobile;
  final bool showTablet;
  final bool showDesktop;
  final Widget child;

  ResponsiveWidget(
      {this.showMobile = false,
      this.showTablet = false,
      this.showDesktop = false,
      required this.child});

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isDesktop(context) && showDesktop) {
      return child;
    }
    if (ResponsiveWidget.isTablet(context) && showTablet) {
      return child;
    }
    if (ResponsiveWidget.isMobile(context) && showMobile) {
      return child;
    }
    return Container();
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 992;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 768 &&
        MediaQuery.of(context).size.width < 992;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }
}
