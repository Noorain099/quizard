import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });
  final String answerText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 121, 55, 172).withOpacity(0.7),
          ),
          child: Text(
            answerText,
            style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
