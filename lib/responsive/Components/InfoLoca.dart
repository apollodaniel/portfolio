import 'package:flutter/material.dart';

class InfoLocal extends StatelessWidget {
  String title;
  String value;

  InfoLocal({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        Text(value, style: TextStyle(fontSize: 16, color: Colors.white70))
      ],
    );
  }
}
