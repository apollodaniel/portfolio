import 'package:flutter/material.dart';

class StatsBase extends StatelessWidget {
  int value;
  String singleValue;
  String multipleValue;
  StatsBase(
      {required this.value,
      required this.singleValue,
      required this.multipleValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
              color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 8,
        ),
        Text(value > 1 ? multipleValue : singleValue)
      ],
    );
  }
}
