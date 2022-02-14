import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  late Widget mobileLayout;
  late Widget tabletLayout;
  late Widget desktopLayout;

  ResponsiveLayout(
      {required this.mobileLayout,
      required this.tabletLayout,
      required this.desktopLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        if (width < 1024) {
          return mobileLayout;
        } else if (width < 1680) {
          return tabletLayout;
        } else {
          return desktopLayout;
        }
      },
    );
  }
}
