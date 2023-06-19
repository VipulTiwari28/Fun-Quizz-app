import 'package:flutter/material.dart';
import 'package:quizz_app/answers_screen_1.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

// 2
class Quiz extends StatefulWidget {
  const Quiz({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var currentIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentIndex];

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...currentQuestion.shuffledList().map(
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  function: () {
                    answerQuestion(
                        answer); //anonmous function was made so that the function was not directly called
                  },
                );
                //... -> is the spread operator which expands element from the iterator
                //as we want to change the question and at the same time the answer should also be recorded
              },
            )
          ],
        ),
      ),
    );
  }
}



//setState is needed for changing the state when the function is called