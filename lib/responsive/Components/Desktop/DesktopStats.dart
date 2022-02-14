import 'package:flutter/material.dart';
import 'package:portfolio/Home.dart';
import 'package:portfolio/responsive/Components/StatsBase.dart';

class DesktopStats extends StatelessWidget {
  const DesktopStats({
    Key? key,
    required this.allStarsCount,
  }) : super(key: key);

  final int allStarsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StatsBase(
            value: user.publicReposCount!,
            singleValue: "repository",
            multipleValue: "repositories"),
        StatsBase(
            value: user.followersCount!,
            singleValue: "follower",
            multipleValue: "followers"),
        StatsBase(
            value: allStarsCount, singleValue: "star", multipleValue: "stars"),
      ],
    );
  }
}
