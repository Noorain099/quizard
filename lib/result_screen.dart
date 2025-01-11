import 'package:flutter/material.dart';
import 'package:quizard/data/questions.dart';
import 'package:quizard/models/quiz_questions.dart';

class ResultsScreen extends StatelessWidget {
  final List<Map<String, String>> correctAnswers;
  final List<Map<String, String>> incorrectAnswers;

  const ResultsScreen({
    super.key,
    required this.correctAnswers,
    required this.incorrectAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Results",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFFAA79D6),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color(0xFFAA79D6),
                Color(0xFFDAB5F7), 
                // Color(0xFFEACCFB), 
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Correct Answers: ${correctAnswers.length}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),
                ...correctAnswers.map((item) => ListTile(
                      title: Text(item["question"]!),
                      subtitle: Text("Your Answer: ${item["answer"]!}"),
                      leading: const Icon(Icons.check, color: Colors.green),
                    )),
                const SizedBox(height: 20),
                Text(
                  "Incorrect Answers: ${incorrectAnswers.length}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                
                // const SizedBox(height: 10),
                // ...incorrectAnswers.map((item) => ListTile(
                  
                //       title: Text(item["question"]!),
                //       subtitle: Text("Your Answer: ${item["answer"]!}"),
                
                //       leading: const Icon(Icons.close, color: Colors.red),
                //     )),
                 const SizedBox(height: 10),
                ...incorrectAnswers.map((item) {
                  // Ensure we retrieve a QuizQuestions instance
                  final question = questions.firstWhere(
                    (q) => q.text == item["question"],
                    orElse: () => QuizQuestions("Unknown Question", ["N/A"]),
                  );

                  // Get the correct answer; assuming it's the first answer in the answers list
                  String correctAnswer = question.answers.isNotEmpty ? question.answers[0] : "N/A";

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(item["question"]!),
                        subtitle: Text("Your Answer: ${item["answer"]!}"),
                        leading: const Icon(Icons.close, color: Colors.red),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0), // Indent for alignment
                        child: Text(
                          "Correct Answer: $correctAnswer",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to quiz
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAA79D6),
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.all(12.0),
                      child:  Text(
                        "Restart Quiz",
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
           ) ))));
                }
       
            
  }


