import 'package:aspirehub/Models/question.dart';
import 'package:aspirehub/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestKnowledgeScreen extends StatefulWidget {
  const TestKnowledgeScreen({super.key});

  @override
  State<TestKnowledgeScreen> createState() => _TestKnowledgeScreenState();
}

class _TestKnowledgeScreenState extends State<TestKnowledgeScreen> {
  bool isDeleted = false;
  List<int?> selectedAnswers = [];
  List<Question> questions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTestCard(
          title: 'Certified Public Accountant',
          subtitle: '15 Question _ 30 min',
          onStart: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizScreen()),
            );

            if (result != null) {
              setState(() {
                selectedAnswers = result['selectedAnswers'];
                questions = result['questions'];
              });
            }
          },
        ),
        SizedBox(height: 25.h),
        _buildTestCard(
          title: 'Accounting Fundamentals',
          subtitle: '15 Question _ 30 min',
          onStart: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizScreen()),
            );

            if (result != null) {
              setState(() {
                selectedAnswers = result['selectedAnswers'];
                questions = result['questions'];
              });
            }
          },
        ),
        SizedBox(height: 25.h),
        Text(
          'Your previous tests.',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w900,
            fontFamily: 'Mulish',
            color: const Color(0xFF333333),
          ),
        ),
        SizedBox(height: 25.h),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child:
              isDeleted
                  ? TextButton(
                    key: const ValueKey('deleted'),
                    onPressed: () {},
                    child: Text(
                      "haven't taken a test before",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xFF999999),
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  )
                  : SizedBox(
                    key: const ValueKey('notDeleted'),
                    width: double.infinity,
                    height: 112.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/testpic.png',
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Financial Accounting',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Mulish',
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                '20 / 30 Question _ 30 min',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF999999),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Mulish',
                                ),
                              ),
                              SizedBox(height: 10.h),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context, {
                                    'selectedAnswers': selectedAnswers,
                                    'questions': questions,
                                  });
                                },
                                child: Container(
                                  width: 170.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF201B39),
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Viewing your answer',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Mulish',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isDeleted = true;
                            });
                          },
                          icon: const Icon(Icons.delete_outline),
                          color: const Color(0xFF999999),
                        ),
                      ],
                    ),
                  ),
        ),
      ],
    );
  }

  Widget _buildTestCard({
    required String title,
    required String subtitle,
    required VoidCallback onStart,
  }) {
    return GestureDetector(
      onTap: onStart,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 54.r,
              offset: Offset(10.w, 24.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
                fontFamily: 'Mulish',
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xFF999999),
                fontFamily: 'Mulish',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
