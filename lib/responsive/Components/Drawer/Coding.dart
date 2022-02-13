import 'package:flutter/material.dart';
import 'package:portfolio/responsive/Components/Drawer/CustomLinearProgressBar.dart';
import 'package:portfolio/responsive/Components/NavigationDrawer.dart';

class Coding extends StatelessWidget {
  const Coding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLinearProgressBar(title: "Dart", percentage: 0.7),
        SizedBox(
          height: 16,
        ),
        CustomLinearProgressBar(title: "Java", percentage: 0.5),
        SizedBox(
          height: 16,
        ),
        CustomLinearProgressBar(title: "Python", percentage: 0.45),
        SizedBox(
          height: 16,
        ),
        CustomLinearProgressBar(title: "C#", percentage: 0.1),
      ],
    );
  }
}
