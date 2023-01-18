import 'package:flutter/material.dart';
import 'package:flutter_application_1/abstract_classes/test_home_generic.dart';
import '../tests/test_normal.dart';

class TestNormalHome extends TestHomePageGeneric {
  const TestNormalHome({
    super.key,
    super.title = "Normal Reaction Time Test",
    super.descriptionText = "This is a standard reaction time test.\n\n"
        "When you begin, the screen will be red.\n\n "
        "When the screen turns green, tap as fast as you can.\n\n "
        "Your reaction time is measured by the time you took to tap "
        "after the screen turned green.",
  });

  @override
  State<TestHomePageGeneric> createState() => _TestNormalHomeState();
}

class _TestNormalHomeState extends TestHomePageGenericState {
  @override
  MaterialPageRoute initializeRoute() {
    return MaterialPageRoute(builder: (context) => const TestNormal());
  }

  @override
  void getScores() {
    setState(() {
      bestScore = scoreManager.getBestTime();
      medianScore = scoreManager.getAverageTime();
    });
  }
}
