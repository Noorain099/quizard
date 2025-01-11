import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizard/quiz.dart';
import 'package:quizard/splash.dart';

class CountdownAnimation extends StatefulWidget {
  @override
  _CountdownAnimationState createState() => _CountdownAnimationState();
}

class _CountdownAnimationState extends State<CountdownAnimation> {
  int _currentNumber = 3;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentNumber == 1) {
        timer.cancel();
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const Quizz()), // Replace with your screen widget
          );
        });
      }
      setState(() {
        _currentNumber--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Text(
              _currentNumber > 0 ? '$_currentNumber' : 'GO!',
              key: ValueKey<int>(_currentNumber),
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 148, 98, 187),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
