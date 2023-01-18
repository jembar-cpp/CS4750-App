/// Aim reaction time test
/// Starts blue: click to start
/// Transitions to red: wait to click
/// Turns blue: click the three green circle as fast as possible
/// Reaction time: the total amount of time the circles appeared

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/score_singleton.dart';
import 'package:flutter_application_1/abstract_classes/test_generic.dart';
import '../pages/test_results.dart';

class TestAim extends TestGeneric {
  const TestAim({super.key, super.title = "Aim Test"});

  @override
  State<TestGeneric> createState() => _TestAimState();
}

class _TestAimState extends TestGenericState {
  Positioned circle1 =
      const Positioned(child: SizedBox.shrink()); // Empty box for now
  Positioned circle2 = const Positioned(child: SizedBox.shrink());
  Positioned circle3 = const Positioned(child: SizedBox.shrink());

  bool failed = false; // Whether the test was failed or not
  int numClicked = 0; // Numbers of circles clicked

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
              circle1,
              circle2,
              circle3,
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
      curText = "Wait for circles to appear ...";
    });
  }

  // Please do NOT look at this function
  @override
  void transition() {
    setState(() {
      col = Colors.lightBlue;
      curText = "";

      // Initialize the circles with unique non-overlapping coordinates
      int circle1X =
          Random().nextInt(MediaQuery.of(context).size.width.round() - 120) +
              10;
      int circle1Y =
          Random().nextInt(MediaQuery.of(context).size.height.round() - 220) +
              10;
      int circle2X = 0;
      int circle2Y = 0;
      int circle3X = 0;
      int circle3Y = 0;
      do {
        circle2X =
            Random().nextInt(MediaQuery.of(context).size.width.round() - 120) +
                10;
      } while ((circle1X - circle2X).abs() < 50);
      do {
        circle2Y =
            Random().nextInt(MediaQuery.of(context).size.height.round() - 220) +
                10;
      } while ((circle1Y - circle2Y).abs() < 75);
      do {
        circle3X =
            Random().nextInt(MediaQuery.of(context).size.width.round() - 120) +
                10;
      } while (((circle1X - circle3X).abs() < 50) ||
          ((circle2X - circle3X).abs() < 50));
      do {
        circle3Y =
            Random().nextInt(MediaQuery.of(context).size.height.round() - 220) +
                10;
      } while (((circle1Y - circle3Y).abs() < 75) ||
          ((circle2Y - circle3Y).abs() < 75));

      circle1 = Positioned(
        top: circle1Y.toDouble(),
        left: circle1X.toDouble(),
        child: GestureDetector(
          onTap: () {
            setState(() {
              circle1 = const Positioned(child: SizedBox.shrink());
            });
            numClicked++;
            if (numClicked == 3) {
              endTest();
            }
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
      circle2 = Positioned(
        top: circle2Y.toDouble(),
        left: circle2X.toDouble(),
        child: GestureDetector(
          onTap: () {
            setState(() {
              circle2 = const Positioned(child: SizedBox.shrink());
            });
            numClicked++;
            if (numClicked == 3) {
              endTest();
            }
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
      circle3 = Positioned(
        top: circle3Y.toDouble(),
        left: circle3X.toDouble(),
        child: GestureDetector(
          onTap: () {
            setState(() {
              circle3 = const Positioned(child: SizedBox.shrink());
            });
            numClicked++;
            if (numClicked == 3) {
              endTest();
            }
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
                    failMessage:
                        "Test failed.\nClick the circles and not the background!")))
        .then((value) => setState(() => {restartTest()}));
  }

  @override
  void addScore(score) {
    scoreManager.addTime(score, type: TestType.aim);
  }

  @override
  void restartTest() {
    // Reset variables
    col = Colors.blue;
    valid = false;
    curText = "Tap anywhere to start";
    started = false;
    failed = false;
    numClicked = 0;
    timer.cancel();
    circle1 = const Positioned(child: SizedBox.shrink());
    circle2 = const Positioned(child: SizedBox.shrink());
    circle3 = const Positioned(child: SizedBox.shrink());
  }
}
