import 'package:flutter/material.dart';
import 'package:portfolio/Home.dart';

class CustomLinearProgressBar extends StatelessWidget {
  const CustomLinearProgressBar({
    Key? key,
    required this.title,
    required this.percentage,
  }) : super(key: key);

  final double percentage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: percentage),
      duration: Duration(seconds: 1),
      builder: (context, value, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${(value * 100).toInt().toString()}%",
                  style: TextStyle(color: Colors.white60),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            LinearProgressIndicator(
              color: Colors.red,
              backgroundColor: current_theme.scaffoldBackgroundColor,
              value: value,
            )
          ],
        );
      },
    );
  }
}
