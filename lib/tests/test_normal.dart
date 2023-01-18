/// Normal reaction time test
/// Starts blue: click to start
/// Transitions to red: wait to click
/// Turns green: click as soon as possible
/// Reaction time: the total amount of time the screen was green

import 'package:flutter/material.dart';
import 'package:flutter_application_1/abstract_classes/test_generic.dart';
import '../pages/test_results.dart';

class TestNormal extends TestGeneric {
  const TestNormal({super.key, super.title = "Normal Test"});

  @override
  State<TestGeneric> createState() => _TestNormalState();
}

class _TestNormalState extends TestGenericState {
  // Starts the test
  @override
  void startTest() {
    setState(() {
      col = Colors.red; // Make the background red
      curText = "Wait for green ...";
    });
  }

  // Transition to green
  @override
  void transition() {
    setState(() {
      col = Colors.green;
      curText = "Click anywhere!";
    });
    startTime = DateTime.now().millisecondsSinceEpoch;
  }

  // Ends the test
  @override
  void endTest() {
    endTime = DateTime.now().millisecondsSinceEpoch;
    int elapsed = endTime - startTime;
    if (valid) {
      addScore(elapsed);
    }
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TestResults(result: elapsed, valid: valid)))
        .then((value) => setState(() => {restartTest()}));
  }

  @override
  void addScore(score) {
    scoreManager.addTime(score);
  }

  @override
  void restartTest() {
    // Reset variables
    valid = false;
    col = Colors.blue;
    curText = "Tap anywhere to start";
    started = false;
    if (timer.isActive) {
      timer.cancel();
    }
  }
}
