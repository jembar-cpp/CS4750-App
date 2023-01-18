/// About this app screen

import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme_manager.dart';

class About extends StatefulWidget {
  const About({
    super.key,
    this.title = "About this app",
  });

  final String title;

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  var about = Text(
    "This app was made by Jeremy Embar for the Cal Poly Pomona CS 4750 Mobile App development project. "
    "It is inspired by and modeled after Human Benchmark's reaction time test, but has additional features.\n\n"
    "It was made during the Winter 2022-2023 semester, so I had 4 weeks to learn and make this app.\n\n"
    "I did not have any prior experience with mobile app programming or development with Dart / Flutter prior to this.\n\n"
    "The app is very rudimentary for now but more features could be added in the future.",
    style: TextStyle(
      fontSize: 20,
      color: ThemeManager.textColor(),
    ),
  );
  // Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: ThemeManager.bgColor(),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            about,
          ],
        ),
      ),
    );
  }
}
