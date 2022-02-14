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
import 'package:portfolio/responsive/Mobile/MobileBanner.dart';

class MobileContent extends StatefulWidget {
  const MobileContent({Key? key}) : super(key: key);

  @override
  _MobileContentState createState() => _MobileContentState();
}

class _MobileContentState extends State<MobileContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _statsAnimation;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat();

    _statsAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.decelerate));
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();

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
                FadeTransition(
                  opacity: _statsAnimation,
                  child: MobileBanner(width: width),
                ),
                SizedBox(
                  height: 32,
                ),
                FadeTransition(
                  opacity: _statsAnimation,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: DesktopStats(allStarsCount: allStarsCount),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "My Projects",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: repositories.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: width < 600 ? 1 : 2,
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
