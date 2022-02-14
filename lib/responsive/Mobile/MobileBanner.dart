import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Home.dart';

class MobileBanner extends StatelessWidget {
  const MobileBanner({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    Widget _mobile;

    if (width < 700) {
      _mobile = SmallMobileBanner();
    } else if (width < 800) {
      _mobile = MiddleMobileBanner();
    } else {
      _mobile = BigMobileBanner();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return AspectRatio(
          aspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
          child: Container(
            height: constraints.maxHeight,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("images/bg.jpg"),
                    fit: BoxFit.cover,
                    opacity: 0.5)),
            child: _mobile,
          ),
        );
      },
    );
  }
}

class SmallMobileBanner extends StatelessWidget {
  const SmallMobileBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Take a look...",
          style: TextStyle(
              shadows: defaultShadow,
              fontSize: 36,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          margin: EdgeInsets.only(right: 16),
          child: AnimatedTextKit(animatedTexts: [
            TyperAnimatedText("I built a notepad app in flutter",
                textStyle: TextStyle(
                  fontSize: 16,
                  shadows: defaultShadow,
                ),
                speed: Duration(milliseconds: 75)),
            TyperAnimatedText("I built a chat app with firebase",
                textStyle: TextStyle(
                  fontSize: 16,
                  shadows: defaultShadow,
                ),
                speed: Duration(milliseconds: 75)),
            TyperAnimatedText(
                "I built a covid monitor with rest api in flutter",
                textStyle: TextStyle(
                  fontSize: 16,
                  shadows: defaultShadow,
                ),
                speed: Duration(milliseconds: 75)),
          ]),
        ),
      ],
    );
  }
}

class MiddleMobileBanner extends StatelessWidget {
  const MiddleMobileBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Take a look...",
          style: TextStyle(
              shadows: defaultShadow,
              fontSize: 48,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 18,
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
                            shadows: defaultShadow,
                            fontSize: 18,
                            color: Colors.white),
                        children: [
                      TextSpan(text: "<"),
                      TextSpan(
                          text: "flutter",
                          style: TextStyle(
                              shadows: defaultShadow,
                              color: Colors.red,
                              fontWeight: FontWeight.bold)),
                      TextSpan(text: ">")
                    ])),
                SizedBox(
                  width: 16,
                ),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: AnimatedTextKit(animatedTexts: [
                    TyperAnimatedText("I built a notepad app in flutter",
                        textStyle: TextStyle(
                          fontSize: 18,
                          shadows: defaultShadow,
                        ),
                        speed: Duration(milliseconds: 75)),
                    TyperAnimatedText("I built a chat app with firebase",
                        textStyle: TextStyle(
                          fontSize: 18,
                          shadows: defaultShadow,
                        ),
                        speed: Duration(milliseconds: 75)),
                    TyperAnimatedText(
                        "I built a covid monitor with rest api in flutter",
                        textStyle: TextStyle(
                          fontSize: 18,
                          shadows: defaultShadow,
                        ),
                        speed: Duration(milliseconds: 75)),
                  ]),
                ),
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                            shadows: defaultShadow,
                            fontSize: 18,
                            color: Colors.white),
                        children: [
                      TextSpan(text: "</"),
                      TextSpan(
                          text: "flutter",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                      TextSpan(text: ">")
                    ])),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class BigMobileBanner extends StatelessWidget {
  const BigMobileBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Take a look...",
          style: TextStyle(
              shadows: defaultShadow,
              fontSize: 72,
              fontWeight: FontWeight.bold),
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
                            shadows: defaultShadow,
                            fontSize: 24,
                            color: Colors.white),
                        children: [
                      TextSpan(text: "<"),
                      TextSpan(
                          text: "flutter",
                          style: TextStyle(
                              shadows: defaultShadow,
                              color: Colors.red,
                              fontWeight: FontWeight.bold)),
                      TextSpan(text: ">")
                    ])),
                SizedBox(
                  width: 16,
                ),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: AnimatedTextKit(animatedTexts: [
                    TyperAnimatedText("I built a notepad app in flutter",
                        textStyle: TextStyle(
                          fontSize: 24,
                          shadows: defaultShadow,
                        ),
                        speed: Duration(milliseconds: 75)),
                    TyperAnimatedText("I built a chat app with firebase",
                        textStyle: TextStyle(
                          fontSize: 24,
                          shadows: defaultShadow,
                        ),
                        speed: Duration(milliseconds: 75)),
                    TyperAnimatedText(
                        "I built a covid monitor with rest api in flutter",
                        textStyle: TextStyle(
                          fontSize: 24,
                          shadows: defaultShadow,
                        ),
                        speed: Duration(milliseconds: 75)),
                  ]),
                ),
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                            shadows: defaultShadow,
                            fontSize: 24,
                            color: Colors.white),
                        children: [
                      TextSpan(text: "</"),
                      TextSpan(
                          text: "flutter",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                      TextSpan(text: ">")
                    ])),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
