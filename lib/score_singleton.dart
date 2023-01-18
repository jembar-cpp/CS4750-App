/// Score Manager to manage high scores and average scores for each test

// Test types
enum TestType {
  normal,
  circle,
  circle2,
  aim,
}

class ScoreManager {
  static final ScoreManager _instance = ScoreManager._internal();

  factory ScoreManager() => _instance;

  // Scores
  late int _bestNormalTime;
  final List<int> _normalTimes = [];

  late int _bestCircleTime;
  final List<int> _circleTimes = [];

  late int _bestCircle2Time;
  final List<int> _circle2Times = [];

  late int _bestAimTime;
  final List<int> _aimTimes = [];

  // Variable initializer
  ScoreManager._internal() {
    _bestNormalTime = -1;
    _bestCircleTime = -1;
    _bestCircle2Time = -1;
    _bestAimTime = -1;
  }

  // Adders also adjust the best time if appropriate
  void addTime(int time, {type = TestType.normal}) {
    // yes, there's a better way to do all this
    switch (type) {
      case TestType.normal:
        _normalTimes.add(time);
        if (time < _bestNormalTime || _bestNormalTime == -1) {
          _bestNormalTime = time;
        }
        break;
      case TestType.circle:
        _circleTimes.add(time);
        if (time < _bestCircleTime || _bestCircleTime == -1) {
          _bestCircleTime = time;
        }
        break;
      case TestType.circle2:
        _circle2Times.add(time);
        if (time < _bestCircle2Time || _bestCircle2Time == -1) {
          _bestCircle2Time = time;
        }
        break;
      case TestType.aim:
        _aimTimes.add(time);
        if (time < _bestAimTime || _bestAimTime == -1) {
          _bestAimTime = time;
        }
        break;
    }
  }

  // Getters return as string for simplicity
  String getBestTime({type = TestType.normal}) {
    late int time;
    switch (type) {
      case TestType.normal:
        time = _bestNormalTime;
        break;
      case TestType.circle:
        time = _bestCircleTime;
        break;
      case TestType.circle2:
        time = _bestCircle2Time;
        break;
      case TestType.aim:
        time = _bestAimTime;
        break;
    }
    if (time < 0) {
      return "N/A";
    }
    return time.toString();
  }

  String getAverageTime({type = TestType.normal}) {
    late List times;
    switch (type) {
      case TestType.normal:
        times = List.from(_normalTimes);
        break;
      case TestType.circle:
        times = List.from(_circleTimes);
        break;
      case TestType.circle2:
        times = List.from(_circle2Times);
        break;
      case TestType.aim:
        times = List.from(_aimTimes);
        break;
    }
    if (times.isEmpty) {
      return "N/A";
    }
    times.sort();
    var middle = times.length ~/ 2;
    if (times.length % 2 == 1) {
      return times[middle].toString();
    } else {
      return ((times[middle - 1] + times[middle]) / 2).round().toString();
    }
  }
}
