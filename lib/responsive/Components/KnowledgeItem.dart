import 'package:flutter/material.dart';

class KnowledgeItem extends StatelessWidget {
  const KnowledgeItem({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_outlined,
          color: Colors.red,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white70),
        )
      ],
    );
  }
}
