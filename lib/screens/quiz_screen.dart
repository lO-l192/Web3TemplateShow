import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // مهم جداً
import 'package:aspirehub/Models/question.dart';
import 'package:aspirehub/screens/congratution_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  final List<int?> selectedAnswers = List.filled(questions.length, null);

  void nextQuestion() {
    if (selectedAnswers[currentQuestion] != null &&
        currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    }
  }

  void previousQuestion() {
    if (currentQuestion > 0) {
      setState(() {
        currentQuestion--;
      });
    }
  }

  void submitQuiz() {
    if (selectedAnswers[currentQuestion] != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => CongratutionScreen(
                selectedAnswers: selectedAnswers,
                questions: questions,
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final bool hasSelectedAnswer = selectedAnswers[currentQuestion] != null;
    final bool isLastQuestion = currentQuestion == questions.length - 1;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20.sp,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.question,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.h),

                // الخيارات
                ...List.generate(question.options.length, (index) {
                  final isSelected = selectedAnswers[currentQuestion] == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAnswers[currentQuestion] = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 16.r,
                            backgroundColor:
                                isSelected
                                    ? const Color(0xFFCACAEA)
                                    : const Color(0xFFD4D4D4),
                            child: Text(
                              String.fromCharCode(65 + index),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: isSelected ? Colors.black : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              question.options[index],
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight:
                                    isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),

                const Spacer(),

                // أزرار التنقل
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 24.r,
                      backgroundColor:
                          currentQuestion > 0
                              ? const Color(0xFF1E1659)
                              : const Color(0xFFD4D4D4),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_new, size: 18.sp),
                        color: Colors.white,
                        onPressed:
                            currentQuestion > 0 ? previousQuestion : null,
                      ),
                    ),
                    if (!isLastQuestion)
                      CircleAvatar(
                        radius: 24.r,
                        backgroundColor:
                            hasSelectedAnswer
                                ? const Color(0xFF1E1659)
                                : const Color(0xFFD4D4D4),
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward_ios, size: 18.sp),
                          color: Colors.white,
                          onPressed: hasSelectedAnswer ? nextQuestion : null,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

          // زر Submit
          if (isLastQuestion && hasSelectedAnswer)
            Positioned(
              bottom: 80.h,
              left: MediaQuery.of(context).size.width * 0.5 - 60.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E1659),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 14.h,
                  ),
                ),
                onPressed: submitQuiz,
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
