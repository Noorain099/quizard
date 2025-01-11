import 'package:flutter/material.dart';
import 'package:quizard/counter.dart';
import 'package:quizard/quiz.dart';
import 'package:quizard/splash.dart';
//import 'package:quizard/results_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
       routes: {
        '/quizz': (context) => const Quizz(),
        '/splash': (context) => const SplashScreen(),
        '/counter': (context) =>  CountdownAnimation(),
       
      },
    );
  
  }
}
