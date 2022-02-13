import 'package:flutter/material.dart';
import 'package:portfolio/responsive/Components/Drawer/InfoLocal.dart';

class Local extends StatelessWidget {
  const Local({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoLocal(
          title: "Country",
          value: "Brazil",
        ),
        SizedBox(
          height: 8,
        ),
        InfoLocal(
          title: "City",
          value: "Dom Basílio",
        ),
        SizedBox(
          height: 8,
        ),
        InfoLocal(
          title: "Age",
          value: "15",
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
