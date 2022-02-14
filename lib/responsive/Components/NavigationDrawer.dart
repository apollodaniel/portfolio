import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Home.dart';
import 'package:portfolio/responsive/Components/Drawer/Coding.dart';
import 'dart:js' as js;

import 'package:portfolio/responsive/Components/Drawer/ContentBase.dart';
import 'package:portfolio/responsive/Components/Drawer/Knowledge.dart';
import 'package:portfolio/responsive/Components/Drawer/Local.dart';
import 'package:portfolio/responsive/Components/Drawer/MyInfo.dart';
import 'package:portfolio/responsive/Components/Drawer/Skills.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  bool downloadCvHover = false;
  bool downloadCertificateHover = false;

  @override
  Widget build(BuildContext context) {
    double percentage = 0.8;
    //Color(0xFF1e0040)
    return Drawer(
      elevation: 10,
      child: Container(
        color: Color(0xFF1e0040),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.23,
                child: MyInfo(),
              ),
              Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Local(),
                      ContentBase(title: "Skills", content: Skills()),
                      ContentBase(
                        title: "Coding",
                        content: Coding(),
                      ),
                      ContentBase(
                        title: "Knowledge",
                        content: Knowledge(),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Divider(),
                      SizedBox(
                        height: 16,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onEnter: (event) {
                          setState(() {
                            downloadCvHover = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            downloadCvHover = false;
                          });
                        },
                        child: GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "DOWNLOAD CV",
                                style: downloadCvHover
                                    ? TextStyle(color: Colors.red)
                                    : null,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.download,
                                color: downloadCvHover ? Colors.red : null,
                              )
                            ],
                          ),
                          onTap: () {
                            js.context.callMethod("open", ["files/cv.pdf"]);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onEnter: (event) {
                          setState(() {
                            downloadCertificateHover = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            downloadCertificateHover = false;
                          });
                        },
                        child: GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "DOWNLOAD CERTIFICATION",
                                style: downloadCertificateHover
                                    ? TextStyle(color: Colors.red)
                                    : null,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.download,
                                color: downloadCertificateHover
                                    ? Colors.red
                                    : null,
                              )
                            ],
                          ),
                          onTap: () {
                            js.context.callMethod("open", [
                              "https://udemy-certificate.s3.amazonaws.com/pdf/UC-777bfb43-fbf5-4fd2-a312-24954cfd9fc7.pdf"
                            ]);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: current_theme.scaffoldBackgroundColor
                                .withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  js.context.callMethod("open", [
                                    "https://www.instagram.com/_dev_apollo/"
                                  ]);
                                },
                                icon: Icon(FontAwesomeIcons.instagram)),
                            SizedBox(
                              width: 4,
                            ),
                            IconButton(
                                onPressed: () {
                                  js.context.callMethod("open",
                                      ["https://github.com/apollodaniel"]);
                                },
                                icon: Icon(FontAwesomeIcons.github)),
                            SizedBox(
                              width: 4,
                            ),
                            IconButton(
                                onPressed: () {
                                  js.context.callMethod("open",
                                      ["https://twitter.com/_apollo_dev"]);
                                },
                                icon: Icon(FontAwesomeIcons.twitter)),
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
