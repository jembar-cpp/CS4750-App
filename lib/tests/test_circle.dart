/// Circle reaction time test
/// Starts blue: click to start
/// Transitions to red: wait to click
/// Turns blue: click the green circle as fast as possible
/// Reaction time: the total amount of time the circle appeared

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/score_singleton.dart';
import 'package:flutter_application_1/abstract_classes/test_generic.dart';
import '../pages/test_results.dart';

class TestCircle extends TestGeneric {
  const TestCircle({super.key, super.title = "Circle Test"});

  @override
  State<TestGeneric> createState() => _TestCircleState();
}

class _TestCircleState extends TestGenericState {
  Positioned circle =
      const Positioned(child: SizedBox.shrink()); // Empty box for now
  int circleX = 0;
  int circleY = 0;
  bool failed = false; // Whether the test was failed or not

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
              failed = true;
              endTest();
            }
          },
          child: Stack(
            children: <Widget>[
              Container(
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
              circle,
            ],
          ),
        ),
      ),
    );
  }

  // Starts the test
  @override
  void startTest() {
    setState(() {
      col = Colors.red; // Make the background red
      curText = "Wait for circle to appear ...";
    });
  }

  // Transition to green
  @override
  void transition() {
    setState(() {
      col = Colors.lightBlue;
      curText = "";
      circle = Positioned(
        top:
            Random().nextInt(MediaQuery.of(context).size.height.round() - 220) +
                10,
        left:
            Random().nextInt(MediaQuery.of(context).size.width.round() - 120) +
                10,
        child: GestureDetector(
          onTap: () {
            endTest();
          },
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.green),
            child: const Text(
              textAlign: TextAlign.center,
              "Click\nme!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
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
                builder: (context) => TestResults(
                    result: elapsed,
                    valid: valid,
                    failed: failed,
                    failMessage: "Test failed.\nClick the circle!")))
        .then((value) => setState(() => {restartTest()}));
  }

  @override
  void addScore(score) {
    scoreManager.addTime(score, type: TestType.circle);
  }

  @override
  void restartTest() {
    // Reset variables
    col = Colors.blue;
    valid = false;
    curText = "Tap anywhere to start";
    started = false;
    failed = false;
    timer.cancel();
    circle = const Positioned(child: SizedBox.shrink());
  }
}
