import 'package:flutter/material.dart';
import 'package:portfolio/responsive/Components/NavigationDrawer.dart';

class Desktop extends StatefulWidget {
  Desktop({Key? key}) : super(key: key);

  @override
  _DesktopState createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var height = MediaQuery.of(context).size.height;
        var width = constraints.maxWidth;

        return Scaffold(
          body: Container(
            child: Row(
              children: [
                Expanded(flex: 2, child: NavigationDrawer()),
                Expanded(flex: 9, child: Text("A")),
              ],
            ),
          ),
        );
      },
    );
  }
}
