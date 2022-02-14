import 'package:flutter/material.dart';
import 'package:portfolio/Home.dart';
import 'package:portfolio/responsive/Components/NavigationDrawer.dart';
import 'package:portfolio/responsive/Components/Tablet/TabletContent.dart';

class Tablet extends StatefulWidget {
  const Tablet({Key? key}) : super(key: key);

  @override
  _TabletState createState() => _TabletState();
}

class _TabletState extends State<Tablet> {
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
          body: TabletContent(),
        );
      },
    );
  }
}
