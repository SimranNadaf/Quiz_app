import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(148, 251, 251, 252),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Learn Flutter The Fun Way!",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 168, 148, 245),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Color.fromARGB(255, 168, 148, 245),
            ),
            onPressed: startQuiz,
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                color: Color.fromARGB(255, 168, 148, 245),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
