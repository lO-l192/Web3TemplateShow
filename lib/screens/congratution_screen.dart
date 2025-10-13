import 'package:aspirehub/Models/question.dart';
import 'package:aspirehub/screens/quiz_result_screen.dart';
import 'package:aspirehub/screens/dash_board_screen.dart';
import 'package:aspirehub/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CongratutionScreen extends StatelessWidget {
  final List<int?> selectedAnswers;
  final List<Question> questions;

  const CongratutionScreen({
    super.key,
    required this.selectedAnswers,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Congratulation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            const Text(
              'Great job! You Did It',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFF3F3F3),
                child: Icon(Icons.feed_outlined, color: Colors.black),
              ),
              title: const Text(
                'Your Score',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
              subtitle: Text(
                '${selectedAnswers.whereType<int>().where((answer) => answer == questions[selectedAnswers.indexOf(answer)].correctAnswer).length}/${questions.length} correct answers',
                style: const TextStyle(fontSize: 14, color: Color(0xFF999999)),
              ),
            ),
            const SizedBox(height: 60),
            CustomButton(
              width: 193,
              height: 42,
              borderRadius: 15,
              color: const Color(0xFF1C1259),
              text: 'Viewing your answer',
              buttontext: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => QuizResultScreen(
                          selectedAnswers: selectedAnswers,
                          questions: questions,
                        ),
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
            CustomButton(
              borderRadius: 15,
              width: 193,
              height: 42,
              color: const Color(0xFFF3F3F3),
              text: 'Go to home',
              buttontext: Colors.black,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoardScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
