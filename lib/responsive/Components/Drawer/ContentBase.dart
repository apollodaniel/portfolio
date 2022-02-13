import 'package:flutter/material.dart';

class ContentBase extends StatelessWidget {
  const ContentBase({
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  final Widget content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Divider(),
        SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 32,
        ),
        content,
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
