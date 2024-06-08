import 'package:flutter/material.dart';
import 'package:quize_app/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key, required this.selectedAnswers, required this.restartQuiz});

  final List<String> selectedAnswers;
  final void Function() restartQuiz;
  List<Map<String, Object>> summary = [];

  @override
  Widget build(context) {
    var currentAnswers = 0;
    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i + 1,
        'question': questions[i].text,
        'current_answer': questions[i].answers[0],
        'choose_answer': selectedAnswers[i],
      });
      if (questions[i].answers[0] == selectedAnswers[i]) {
        currentAnswers++;
      }
    }
    var total = selectedAnswers.length;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              'Out of $total You Got $currentAnswers !',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...summary.map(
                    (data) {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: (data['current_answer'] ==
                                      data['choose_answer'])
                                  ? const Color.fromARGB(255, 152, 240, 165)
                                  : const Color.fromARGB(255, 240, 164, 158),
                            ),
                            child: Text(
                              (data['question_index']).toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 13, 13, 13),
                                // backgroundColor:
                                //     Color.fromARGB(255, 240, 175, 171),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.left,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  (data['question']).toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  (data['choose_answer']).toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 135, 239, 150),
                                  ),
                                ),
                                Text(
                                  (data['current_answer']).toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: (data['current_answer'] ==
                                            data['choose_answer'])
                                        ? const Color.fromARGB(
                                            255, 160, 243, 170)
                                        : const Color.fromARGB(
                                            255, 241, 161, 156),
                                  ),
                                ),
                                // const SizedBox(
                                //   height: 20,
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
            onPressed: () {
              restartQuiz();
            },
            style: const ButtonStyle(
              foregroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 201, 195, 242)),
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 15, 10, 85)),
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
              ),
            ),
            child: const Text(
              'Restart Quiz!',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
