import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.onClick, required this.answer});

  final void Function(String answer) onClick;
  final String answer;

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 25),
      child: ElevatedButton(
        onPressed: () {
          onClick(answer);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: const Color.fromARGB(255, 17, 7, 73),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        ),
        // style: const ButtonStyle(
        //   foregroundColor: MaterialStatePropertyAll(
        //     Color.fromARGB(255, 242, 242, 246),
        //   ),
        //   backgroundColor: MaterialStatePropertyAll(
        //     Color.fromARGB(255, 15, 4, 65),
        //   ),
        // ),
        child: Text(
          answer,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
