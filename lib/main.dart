import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/credits.dart';
import 'package:flutter_application_1/home_screens/test_circle_home.dart';
import 'package:flutter_application_1/home_screens/test_normal_home.dart';
import 'package:flutter_application_1/pages/settings.dart';
import 'package:flutter_application_1/theme_manager.dart';
import 'pages/about.dart';
import 'home_screens/test_aim_home.dart';
import 'home_screens/test_circle2_home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.title = "Reaction Time Test"});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: ThemeManager.bgColor()),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Text(
                  'Test your reaction time with a variety of tests!\n\n'
                  'Select a test to begin. After you complete the test, you will see your reaction time in milliseconds (ms).\n\n'
                  'Compare your scores with others and try to improve your reaction time!',
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: 18, color: ThemeManager.textColor()),
                ),
              ),
              const SizedBox(height: 25),

              // Row 1 buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // Button 1 - normal test
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 100),
                    ),
                    child: Text(
                      "Normal\nTest",
                      style: TextStyle(
                          fontSize: 20, color: ThemeManager.buttonTextColor()),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TestNormalHome()));
                    },
                  ),
                  // Button 2 - region test
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 100),
                    ),
                    child: Text(
                      "Circle\nTest",
                      style: TextStyle(
                        fontSize: 20,
                        color: ThemeManager.buttonTextColor(),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TestCircleHome()));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 25),
              // Row 2 buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // Button 3 - circle2 test
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 100),
                    ),
                    child: Text(
                      "Two\nCircles",
                      style: TextStyle(
                          fontSize: 20, color: ThemeManager.buttonTextColor()),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TestCircle2Home()));
                    },
                  ),
                  // Button 4 - aim test
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 100),
                    ),
                    child: Text(
                      "Aim\nTest",
                      style: TextStyle(
                          fontSize: 20, color: ThemeManager.buttonTextColor()),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TestAimHome()));
                    },
                  ),
                ],
              ),

              // Row 3 - credits and about button
              const SizedBox(height: 75),
              Material(
                color: ThemeManager.bgColor(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 50),
                      ),
                      child: Text(
                        "Credits",
                        style: TextStyle(
                            fontSize: 20,
                            color: ThemeManager.buttonTextColor()),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Credits()));
                      },
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                          color: Colors.cyanAccent, shape: CircleBorder()),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const About(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.question_mark),
                          color: ThemeManager.buttonTextColor()),
                    ),
                    Ink(
                      decoration: ShapeDecoration(
                          color: Colors.cyan[300], shape: const CircleBorder()),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Settings(),
                              ),
                            ).then((value) => setState(() => {}));
                          },
                          icon: const Icon(Icons.settings),
                          color: ThemeManager.buttonTextColor()),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
