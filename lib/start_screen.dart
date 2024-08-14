import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/quiz-logo.png", width: 300, color: const Color.fromARGB(136, 255, 255, 255),),
          const SizedBox(height: 80,),
          Text(
            "Learn flutter the fun way!",
            style: GoogleFonts.lato(color: Colors.white),
          ),
          const SizedBox(height: 80,),
          OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
            label: const Text(
              "Start quiz",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
