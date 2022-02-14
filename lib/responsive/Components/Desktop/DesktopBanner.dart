import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class DesktopBanner extends StatelessWidget {
  const DesktopBanner({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AspectRatio(
          aspectRatio: 3,
          child: Container(
            height: constraints.maxHeight,
            padding: EdgeInsets.only(left: 48),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("images/bg.jpg"),
                    fit: BoxFit.cover,
                    opacity: 0.5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Take a look...",
                  style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                                children: [
                              TextSpan(text: "<"),
                              TextSpan(
                                  text: "flutter",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: ">")
                            ])),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "I built a ",
                          style: TextStyle(fontSize: 24),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          child: AnimatedTextKit(animatedTexts: [
                            TyperAnimatedText("notepad app in flutter",
                                textStyle: TextStyle(fontSize: 24),
                                speed: Duration(milliseconds: 75)),
                            TyperAnimatedText("chat app with firebase",
                                textStyle: TextStyle(fontSize: 24),
                                speed: Duration(milliseconds: 75)),
                            TyperAnimatedText(
                                "covid monitor with rest api in flutter",
                                textStyle: TextStyle(fontSize: 24),
                                speed: Duration(milliseconds: 75)),
                          ]),
                        ),
                        RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                                children: [
                              TextSpan(text: "</"),
                              TextSpan(
                                  text: "flutter",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: ">")
                            ])),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
