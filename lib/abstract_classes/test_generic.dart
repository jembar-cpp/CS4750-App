/// Generic test which other tests inherit from

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/score_singleton.dart';

abstract class TestGeneric extends StatefulWidget {
  const TestGeneric({super.key, required this.title});

  final String title;
}

abstract class TestGenericState extends State<TestGeneric> {
  /* Variables */
  var col = Colors.blue; // Current canvas color
  var curText = "Tap anywhere to start"; // Current text to display
  var started = false; // Whether the test has started or not
  int startTime = 0;
  late int endTime;
  Timer timer = Timer(const Duration(seconds: 0), () {});
  bool valid = false; // Whether the test result is valid or not
  ScoreManager scoreManager = ScoreManager();

  /* Instance widgets */

  // Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (!started) {
              started = true;
              startTest();
              timer = Timer(
                Duration(
                    milliseconds:
                        Random().nextInt(1500) + 1000 /* 1 - 2.5 seconds*/),
                () {
                  valid = true;
                  transition();
                  startTime = DateTime.now().millisecondsSinceEpoch;
                },
              );
            } else {
              endTest();
            }
          },
          child: Container(
            color: col,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: double.infinity,
                ),
                Text(
                  curText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Starts the test
  void startTest();

  // Transition to user input required
  void transition();

  // Ends the test
  void endTest();

  // Adds the score
  void addScore(score);

  // Resets the variables to restart the test
  void restartTest();
}
