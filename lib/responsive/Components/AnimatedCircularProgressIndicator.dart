import 'package:flutter/material.dart';
import 'package:portfolio/Home.dart';

class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator(
      {Key? key, required this.percentage, required this.title})
      : super(key: key);

  final double percentage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: percentage),
            duration: Duration(seconds: 1),
            builder: (context, value, child) {
              return Stack(fit: StackFit.expand, children: [
                CircularProgressIndicator(
                  value: value,
                  color: Colors.red,
                  backgroundColor: current_theme.scaffoldBackgroundColor,
                ),
                Center(
                  child: Text("${(value * 100).toInt().toString()}%"),
                )
              ]);
            },
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }
}
