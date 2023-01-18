/// Settings

import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme_manager.dart';

class Settings extends StatefulWidget {
  const Settings({
    super.key,
    this.title = "Settings",
  });

  final String title;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool curTheme = ThemeManager.getTheme() == Themes.light ? false : true;
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
            Row(
              children: <Widget>[
                Text(
                  "Dark mode   ",
                  style: TextStyle(
                    fontSize: 22,
                    color: ThemeManager.textColor(),
                  ),
                ),
                Switch(
                  activeColor: Colors.cyan[400],
                  activeTrackColor: Colors.cyan[100],
                  value: curTheme,
                  onChanged: (value) {
                    setState(
                      () {
                        ThemeManager.setTheme(
                            value ? Themes.dark : Themes.light);
                        curTheme = value;
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
