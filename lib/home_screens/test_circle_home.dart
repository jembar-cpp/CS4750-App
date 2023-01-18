import 'package:flutter/material.dart';
import 'package:flutter_application_1/abstract_classes/test_home_generic.dart';
import 'package:flutter_application_1/score_singleton.dart';
import 'package:flutter_application_1/tests/test_circle.dart';

class TestCircleHome extends TestHomePageGeneric {
  const TestCircleHome({
    super.key,
    super.title = "Circle Reaction Time Test",
    super.descriptionText = "This is a circle reaction time test.\n\n"
        "It measures how quickly you react and click a green circle.\n\n"
        "When you begin, the screen will be red.\n\n "
        "When the screen turns blue, a green circle will appear. "
        "Your reaction time is measured by the time you took to tap the circle.",
  });

  @override
  State<TestHomePageGeneric> createState() => _TestCircleHomeState();
}

class _TestCircleHomeState extends TestHomePageGenericState {
  @override
  MaterialPageRoute initializeRoute() {
    return MaterialPageRoute(builder: (context) => const TestCircle());
  }

  @override
  void getScores() {
    setState(() {
      bestScore = scoreManager.getBestTime(type: TestType.circle);
      medianScore = scoreManager.getAverageTime(type: TestType.circle);
    });
  }
}
