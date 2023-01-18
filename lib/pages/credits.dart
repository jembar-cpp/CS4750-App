/// Credits screen

import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme_manager.dart';

class Credits extends StatefulWidget {
  const Credits({
    super.key,
    this.title = "Credits",
  });

  final String title;

  @override
  State<Credits> createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
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
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Text(
              'I made this :)',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 24, color: ThemeManager.textColor()),
            ),
          ),
        ));
  }
}
