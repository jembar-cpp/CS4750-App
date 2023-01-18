/// Generic results screen which other results screens inherit from

import 'package:flutter/material.dart';

import '../main.dart';
import '../theme_manager.dart';

class TestResults extends StatefulWidget {
  const TestResults(
      {super.key,
      this.title = "Test results",
      required this.result,
      required this.valid,
      this.failed = false,
      this.failMessage = ""});

  final String title;
  final int result;
  final bool valid;
  final bool failed;
  final String failMessage;

  @override
  State<TestResults> createState() => _TestResultsState();
}

class _TestResultsState extends State<TestResults> {
  /* Variables */
  var col = Colors.white; // Current canvas color
  late String curText; // Current text to display

  // Build
  @override
  Widget build(BuildContext context) {
    if (!widget.valid) {
      setState(() {
        curText = "Too fast!\nOnly tap when the screen turns green.";
      });
    } else if (widget.failed) {
      curText = widget.failMessage;
    } else {
      setState(() {
        curText = "Reaction time:\n ${widget.result} ms.";
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: ThemeManager.bgColor(),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(
                width: double.infinity,
              ),
              Text(
                curText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: ThemeManager.textColor(),
                ),
              ),
              const SizedBox(height: 50),

              // Button to go back to the previous test
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  "Try again",
                  style: TextStyle(
                      fontSize: 24, color: ThemeManager.buttonTextColor()),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              // Button to go back to the test's home page
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  "Back to home",
                  style: TextStyle(
                      fontSize: 24, color: ThemeManager.buttonTextColor()),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const App()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
