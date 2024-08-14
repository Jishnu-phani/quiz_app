import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.resetFunc});

  final void Function() resetFunc;
  final List<String> chosenAnswers;
  final numTotalQuestions = 0;
  final numCorrectQuestions = 0;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];
    for (var i=0; i<chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length; 
    final numCorrectQuestions= summaryData.where((data){
      return data["user_answer"] == data["correct_answer"];
    }).length; 
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!", style: GoogleFonts.lato(color: const Color.fromARGB(255, 158, 86, 194), fontSize: 20,), textAlign: TextAlign.center,),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData) ,
            const SizedBox(height: 30,),
            TextButton(
              onPressed: resetFunc,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.refresh, color: Colors.white,), // use the icon you want here
                  Text(" Restart Quiz!", style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
