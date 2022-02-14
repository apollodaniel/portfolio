import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:portfolio/Tools/GithubTools.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/responsive/Desktop/Desktop.dart';
import 'package:portfolio/responsive/ResponsiveLayout.dart';
import 'package:portfolio/responsive/Tablet/Tablet.dart';

// Dinamic values
final logo =
    theme_mode == ThemeMode.dark ? "images/logo_white.png" : "images/logo.png";
final current_theme = theme_mode == ThemeMode.dark ? theme_dark : theme;

final double appBarSize = 150;
final double mobileAppBarSize = 50;
final List<Map> knowledgeImages = [
  {"image": "images/iphone.png", "title": "IOS"},
  {"image": "images/android.png", "title": "Android"},
  {"image": "images/desktop.png", "title": "Desktop"},
  {"image": "images/web.png", "title": "Web"}
];

List<Repository> repositories = [];
late User user;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool done = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGithubInfo();
  }

  getGithubInfo() async {
    setState(() {
      done = false;
    });
    List githubRequests = await Future.wait([GithubTools.getGithubUser()]);

    User _user = githubRequests[0];
    Stream<Repository> _repositoryStream =
        GithubTools.getRepositories("apollodaniel");

    List<Repository> _repositories = [];
    _repositoryStream.listen((event) {
      print(event.htmlUrl);
      _repositories.add(event);
    }).onDone(() {
      repositories = _repositories;
      user = _user;
      _done();
    });
  }

  _done() {
    setState(() {
      done = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (done) {
      return ResponsiveLayout(
        mobileLayout: Container(),
        tabletLayout: Tablet(),
        desktopLayout: Desktop(),
      );
    } else {
      return Container(
        color: current_theme.scaffoldBackgroundColor,
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        ),
      );
    }
  }
}
