import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/Home.dart';
import 'package:portfolio/responsive/Components/Desktop/DesktopBanner.dart';
import 'package:portfolio/responsive/Components/Desktop/DesktopProjectContainer.dart';
import 'package:portfolio/responsive/Components/Desktop/DesktopStats.dart';
import 'package:portfolio/responsive/Components/StatsBase.dart';

class DesktopContent extends StatefulWidget {
  const DesktopContent({Key? key}) : super(key: key);

  @override
  _DesktopContentState createState() => _DesktopContentState();
}

class _DesktopContentState extends State<DesktopContent> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var height = MediaQuery.of(context).size.height;
        var width = constraints.maxWidth;

        int allStarsCount = 0;

        for (Repository repo in repositories) {
          allStarsCount += repo.stargazersCount;
        }

        return Container(
          height: height,
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DesktopBanner(width: width),
                SizedBox(
                  height: 32,
                ),
                DesktopStats(allStarsCount: allStarsCount),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "My Projects",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 48,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: repositories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    return DesktopProjectContainer(index: index);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
