import 'package:flutter/material.dart';
import 'package:flutter_application_1/abstract_classes/test_home_generic.dart';
import 'package:flutter_application_1/score_singleton.dart';
import '../tests/test_aim.dart';

class TestAimHome extends TestHomePageGeneric {
  const TestAimHome({
    super.key,
    super.title = "Aim Test",
    super.descriptionText = "This is an aim-based reaction time test.\n\n"
        "When the test starts, three circles will appear. "
        "You must tap all the circles as fast as possible.\n\n"
        "After all three circles are gone, you complete the test. "
        "Your reaction time is measured by the time you took to tap all the circles.",
  });

  @override
  State<TestHomePageGeneric> createState() => _TestAimHomeState();
}

class _TestAimHomeState extends TestHomePageGenericState {
  @override
  MaterialPageRoute initializeRoute() {
    return MaterialPageRoute(builder: (context) => const TestAim());
  }

  @override
  void getScores() {
    setState(() {
      bestScore = scoreManager.getBestTime(type: TestType.aim);
      medianScore = scoreManager.getAverageTime(type: TestType.aim);
    });
  }
}
