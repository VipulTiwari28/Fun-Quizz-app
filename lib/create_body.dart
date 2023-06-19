import 'package:flutter/material.dart';

class CreateBody extends StatelessWidget {
  const CreateBody(this.screenChange, {super.key}); //constructor

  final void Function() screenChange;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('./assets/images/quiz-logo.png'),
          const Text(
            'Leaning is fun !!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 25),
          OutlinedButton.icon(
              onPressed: screenChange,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(25),
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz'))
        ],
      ),
    );
  }
}
