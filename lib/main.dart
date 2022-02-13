import 'dart:ui';

import 'package:flutter/material.dart';

import 'Home.dart';

final theme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.purple[700], secondary: Colors.purpleAccent[700]));

final theme_dark = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.purple[700], secondary: Colors.purpleAccent[700]),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Color(0xFF130029));

var theme_mode = ThemeMode.dark;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: theme_dark,
      themeMode: theme_mode,
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
