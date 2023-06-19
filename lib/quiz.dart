//here it will be new material app for the quiz screen

//This file is the main file which takes care of the screens

//  1
import 'package:flutter/material.dart';
import 'package:quizz_app/create_body.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/results_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(this.screenState, {super.key});

  final String screenState;
  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

//_makes the class private and it extends the State we want in the UI.
//In this we made the main function also applicable and the change of screen on button tap
//Here the button is in the create_body file
//To connect the button when creating the object for CreateBody(we pass the switchScreen)

class _QuizScreenState extends State<QuizScreen> {
  var activeScreen = 'inital-screen';

  List<String> selectedAnswers = [];
  //initstate -> we need as initialization of activeScreen and function switchScreen happens at the same time

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  //to store the answers we receive from questions screen

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = CreateBody(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = Quiz(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
          chosenAnswers: selectedAnswers, restartQuiz: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 238, 234, 241),
                Color.fromARGB(255, 121, 79, 189),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
