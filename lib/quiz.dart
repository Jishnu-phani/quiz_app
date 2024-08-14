import "package:flutter/material.dart";
import "package:quiz_app/start_screen.dart";
import "package:quiz_app/questions_screen.dart";
import "package:quiz_app/data/questions.dart";
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState(); 
  }
}


class _QuizState extends State<Quiz>{ 

  List<String> selectedAnswers = [];

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = ResultsScreen(chosenAnswers: selectedAnswers, resetFunc: restart,);
      });
    }
  }

  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    });
  }

  void restart(){
    setState(() {
    selectedAnswers = [];
    activeScreen = StartScreen(switchScreen);
    });
  }

  @override
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(255, 44, 10, 107), Color.fromARGB(255, 74, 5, 79)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}