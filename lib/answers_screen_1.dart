import 'package:flutter/material.dart';

//This is will be another wigdet for buttons so that we don't have to repeat code;

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.function});

  final String answerText;
  final void Function() function;

  //here we need to define the types for both the objects

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 111, 72, 141),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
