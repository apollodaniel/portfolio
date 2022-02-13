import 'package:flutter/material.dart';
import 'package:portfolio/responsive/Components/Drawer/AnimatedCircularProgressIndicator.dart';

class Skills extends StatelessWidget {
  const Skills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: AnimatedCircularProgressIndicator(
                percentage: 0.8, title: "Flutter")),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: AnimatedCircularProgressIndicator(
                percentage: 0.4, title: "Firebase")),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: AnimatedCircularProgressIndicator(
                percentage: 0.5, title: "English")),
      ],
    );
  }
}
