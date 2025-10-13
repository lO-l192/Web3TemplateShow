import 'package:aspirehub/screens/quiz_screen.dart';
import 'package:flutter/material.dart';

class Testinformation extends StatelessWidget {
  const Testinformation({super.key});

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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 308,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Brief explanation about this test',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Mulish',
                    color: Color(0xFF333333),
                  ),
                ),
                SizedBox(height: 25),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFFF3F3F3),
                    child: Icon(Icons.feed_outlined, color: Colors.black),
                  ),
                  title: Text(
                    '15 Questions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Mulish',
                      color: Color(0xFF333333),
                    ),
                  ),
                  subtitle: Text(
                    '2 points for a correct answer',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Mulish',
                      color: Color(0xFF999999),
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFFF3F3F3),
                    child: Icon(Icons.access_time_rounded, color: Colors.black),
                  ),
                  title: Text(
                    '30 Minutes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Mulish',
                      color: Color(0xFF333333),
                    ),
                  ),
                  subtitle: Text(
                    'Time allowed to complete the test',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Mulish',
                      color: Color(0xFF999999),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Please read the text below carefully so you can understand it',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mulish',
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '2 points awarded for a correct answer and no marks for an incorrect answer',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Mulish',
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Tap on options to select the correct answer',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Mulish',
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Click submit if you are sure you want to complete all the quizzes',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Mulish',
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 199,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(0xFF1C1259),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Start Test',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mulish',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
