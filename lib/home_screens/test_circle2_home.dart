import 'package:flutter/material.dart';
import 'package:flutter_application_1/abstract_classes/test_home_generic.dart';
import 'package:flutter_application_1/score_singleton.dart';
import '../tests/test_circle2.dart';

class TestCircle2Home extends TestHomePageGeneric {
  const TestCircle2Home({
    super.key,
    super.title = "Two Circles Test",
    super.descriptionText = "This is similar to the circle reaction time test.\n\n"
        "When the test starts, two circles will appear. "
        "One circle will be green, and the other circle will be yellow.\n\n"
        "If you tap the green circle, you succeed the test. If you tap the yellow circle, you fail. "
        "Your reaction time is measured by the time you took to tap the green circle.",
  });

  @override
  State<TestHomePageGeneric> createState() => _TestCircle2HomeState();
}

class _TestCircle2HomeState extends TestHomePageGenericState {
  @override
  MaterialPageRoute initializeRoute() {
    return MaterialPageRoute(builder: (context) => const TestCircle2());
  }

  @override
  void getScores() {
    setState(() {
      bestScore = scoreManager.getBestTime(type: TestType.circle2);
      medianScore = scoreManager.getAverageTime(type: TestType.circle2);
    });
  }
}
