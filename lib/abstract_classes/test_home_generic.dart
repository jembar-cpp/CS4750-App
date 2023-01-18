/// Generic home page which other pages inherit from.

import 'package:flutter/material.dart';
import 'package:flutter_application_1/score_singleton.dart';
import '../main.dart';
import '../theme_manager.dart';

abstract class TestHomePageGeneric extends StatefulWidget {
  const TestHomePageGeneric(
      {super.key, required this.title, required this.descriptionText});

  final String title;
  final String descriptionText; // Text for the description
}

abstract class TestHomePageGenericState extends State<TestHomePageGeneric> {
  ScoreManager scoreManager = ScoreManager();
  late String bestScore;
  late String medianScore;

  // Build
  @override
  Widget build(BuildContext context) {
    // Initialize the route
    MaterialPageRoute route = initializeRoute();
    getScores();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: ThemeManager.bgColor(),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Description of the test
              Text(
                widget.descriptionText,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  color: ThemeManager.textColor(),
                ),
              ),
              const SizedBox(height: 25),

              // Score display
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Text(
                      "Best time: $bestScore",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22,
                        color: ThemeManager.textColor(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: Text(
                      "Average time (median): $medianScore",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22,
                        color: ThemeManager.textColor(),
                      ),
                    ),
                  ),
                ],
              ),

              // Button to go to the test
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  "Start Test",
                  style: TextStyle(
                      fontSize: 24, color: ThemeManager.buttonTextColor()),
                ),
                onPressed: () {
                  Navigator.push(context, route);
                },
              ),
              const SizedBox(height: 50),
              // Button to go back
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: Text(
                  "Go back",
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

  // A function to initialize the route.
  MaterialPageRoute initializeRoute();

  // Get the high score, the median score, and refresh.
  void getScores();
}
