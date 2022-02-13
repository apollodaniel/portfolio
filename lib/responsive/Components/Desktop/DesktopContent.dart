import 'package:flutter/material.dart';

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

        return Container(
          height: height,
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 48),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("images/bg.jpg"),
                        fit: BoxFit.cover,
                        opacity: 0.5)),
                height: 500,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 72,
                              fontFamily: "Poppins.ttf",
                              color: Colors.white,
                            ),
                            children: [
                          TextSpan(text: "Discover my\n"),
                          TextSpan(
                              text: "MAGIC!",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ])),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
