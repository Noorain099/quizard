import 'package:flutter/material.dart';
import 'package:quizard/answer_button.dart';
import 'package:quizard/data/questions.dart';

import 'package:quizard/result_screen.dart';

class Quizz extends StatefulWidget {
  const Quizz({super.key});

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  var currentQuestionIndex = 0;
  final List<Map<String, String>> correctAnswers = [];
  final List<Map<String, String>> incorrectAnswers = [];
//  final List<String> selectedAnswer = [];

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
    // Navigate to results screen if the quiz is completed
    if (currentQuestionIndex >= questions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            correctAnswers: correctAnswers,
            incorrectAnswers: incorrectAnswers,
          ),
        ),
      );
    }
  }

  chooseAnswer(String answer) {
    final currentQuestion = questions[currentQuestionIndex];
    final isCorrect = answer == currentQuestion.answers[0];
    if (isCorrect) {
      correctAnswers.add({
        "question": currentQuestion.text,
        "answer": answer,
      });
    } else {
      incorrectAnswers.add({
        "question": currentQuestion.text,
        "answer": answer,
      });
    }
    answerQuestion();
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= questions.length) {
      return const Center(
        child: Text("Quiz Completed"),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFAA79D6),
              Color(0xFFDAB5F7), // Top purple shade
              // Color(0xFFEACCFB), // Middle soft purple shade
              Color(0xFFEACCFB),
              Color(0xFFDAB5F7),
              Color(0xFFAA79D6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Text(
                  currentQuestion.text,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 118, 48, 172),
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 25),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    // Debug log for interaction
                    debugPrint("Answer selected: $answer");
                    chooseAnswer(answer);
                  }, // Pass selected answer
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
