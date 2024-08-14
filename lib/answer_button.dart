import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answer, this.func, {super.key});

  final String answer;
  final void Function() func;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            backgroundColor: const Color.fromARGB(255, 47, 0, 105),
            foregroundColor: Colors.white),
        onPressed: func,
        child: Text(answer, textAlign: TextAlign.center,)
      );
  }
}
