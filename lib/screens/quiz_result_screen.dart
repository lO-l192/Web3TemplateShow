import 'package:flutter/material.dart';
import 'package:aspirehub/Models/question.dart';
import 'package:aspirehub/widgets/custom_button.dart';
import 'package:aspirehub/screens/statics_screen.dart';

class QuizResultScreen extends StatelessWidget {
  final List<int?> selectedAnswers;
  final List<Question> questions;

  const QuizResultScreen({
    super.key,
    required this.selectedAnswers,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    int score = 0;
    for (int i = 0; i < selectedAnswers.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswer) {
        score++;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Score: $score/${questions.length}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Column(
              children: List.generate(questions.length, (index) {
                final question = questions[index];
                final selectedAnswer = selectedAnswers[index];
                final isCorrect = selectedAnswer == question.correctAnswer;

                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        isCorrect
                            ? Colors.green.withOpacity(0.1)
                            : Colors.red.withOpacity(0.1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question.question,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(question.options.length, (i) {
                          final optionText = question.options[i];
                          return Text(
                            '${String.fromCharCode(65 + i)}. $optionText',
                            style: TextStyle(
                              fontWeight:
                                  selectedAnswer == i
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                              color:
                                  selectedAnswer == i
                                      ? (isCorrect ? Colors.green : Colors.red)
                                      : Colors.black,
                            ),
                          );
                        }),
                      ),
                      if (!isCorrect)
                        Text(
                          'Correct Answer: ${String.fromCharCode(65 + question.correctAnswer)}',
                          style: const TextStyle(color: Colors.blue),
                        ),
                    ],
                  ),
                );
              }),
            ),
            Center(
              child: CustomButton(
                width: 140,
                height: 40,
                borderRadius: 12,
                text: 'Next',
                color: const Color(0xFF221763),
                buttontext: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StaticsScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
