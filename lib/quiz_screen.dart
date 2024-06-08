import 'package:flutter/material.dart';
import 'package:quize_app/Question_Screen.dart';
import 'package:quize_app/data/question.dart';
import 'package:quize_app/result_screen.dart';
import 'package:quize_app/start_screen.dart';

class QuizeScreen extends StatefulWidget {
  const QuizeScreen({super.key});
  @override
  State<QuizeScreen> createState() {
    return _QuizeScreenState();
  }
}

class _QuizeScreenState extends State<QuizeScreen> {
  var active = 'start-screen';
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      active = 'question-screen';
    });
  }

  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        active = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget? activeScreen;
    if (active == 'start-screen') {
      activeScreen = StartScreen(switchScreen);
    } else if (active == 'question-screen') {
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    } else {
      activeScreen = ResultScreen(
          selectedAnswers: selectedAnswers, restartQuiz: switchScreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 35, 4, 86),
                Color.fromARGB(255, 59, 43, 180),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
