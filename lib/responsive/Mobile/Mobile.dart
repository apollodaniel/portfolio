import 'package:flutter/material.dart';
import 'package:portfolio/Home.dart';
import 'package:portfolio/responsive/Components/NavigationDrawer.dart';
import 'package:portfolio/responsive/Components/Tablet/TabletContent.dart';
import 'package:portfolio/responsive/Mobile/MobileContent.dart';

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var height = MediaQuery.of(context).size.height;
        var width = constraints.maxWidth;

        return Scaffold(
          drawer: NavigationDrawer(),
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: current_theme.scaffoldBackgroundColor,
            shadowColor: Colors.transparent,
          ),
          body: MobileContent(),
        );
      },
    );
  }
}
