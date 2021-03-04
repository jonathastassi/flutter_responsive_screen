import 'package:dashboard_flutter/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  static const String route = '/product';

  @override
  Widget build(BuildContext context) {
    print("Buildou ProductPage");

    return Column(
      children: [
        Text(
          "Products",
          style: TextStyle(fontSize: 50),
        ),
        ResponsiveWidget(
          showDesktop: true,
          child: Container(
            child: Text("Somente Desktop"),
          ),
        ),
        ResponsiveWidget(
          showTablet: true,
          child: Container(
            child: Text("Somente Tablet"),
          ),
        ),
        ResponsiveWidget(
          showMobile: true,
          child: Container(
            child: Text("Somente Mobile"),
          ),
        ),
        ResponsiveWidget(
          showMobile: true,
          showTablet: true,
          child: Container(
            child: Text("Somente Mobile e tablet"),
          ),
        ),
        ResponsiveWidget(
          showDesktop: true,
          showMobile: true,
          child: Container(
            child: Text("Somente Mobile e desktop"),
          ),
        ),
        ResponsiveWidget(
          showTablet: true,
          showDesktop: true,
          child: Container(
            child: Text("Somente tablet e desktop"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              height: ResponsiveWidget.isDesktop(context)
                  ? 600
                  : (ResponsiveWidget.isTablet(context) ? 450 : 200),
              color: ResponsiveWidget.isDesktop(context)
                  ? Colors.blue
                  : (ResponsiveWidget.isTablet(context)
                      ? Colors.green
                      : Colors.red),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ResponsiveWidget(
                    showDesktop: true,
                    child: Text("Desktop - Blue and big"),
                  ),
                  ResponsiveWidget(
                    showTablet: true,
                    child: Text("Tablet - Green and middle"),
                  ),
                  ResponsiveWidget(
                    showMobile: true,
                    child: Text("Mobile - Red and small"),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
