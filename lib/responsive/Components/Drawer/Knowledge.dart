import 'package:flutter/material.dart';
import 'package:portfolio/responsive/Components/Banner/KnowledgeItem.dart';

class Knowledge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KnowledgeItem(
          title: "Dart & flutter",
        ),
        KnowledgeItem(
          title: "Firebase & Sqlite",
        ),
        KnowledgeItem(
          title: "Android, IOS, Web & desktop coding",
        ),
        KnowledgeItem(
          title: "English and portuguese",
        ),
        KnowledgeItem(
          title: "Git and github",
        ),
      ],
    );
  }
}
