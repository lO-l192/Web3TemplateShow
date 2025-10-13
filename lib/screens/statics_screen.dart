import 'dart:io';
import 'package:flutter/material.dart';
import 'package:aspirehub/Models/controller/profile_controller.dart';
import 'package:aspirehub/staticsscreens/best_score_screen.dart';
import 'package:aspirehub/staticsscreens/personal_screen.dart';
import 'package:aspirehub/staticsscreens/test_knowledge_screen.dart';

class StaticsScreen extends StatefulWidget {
  const StaticsScreen({super.key});

  @override
  State<StaticsScreen> createState() => _StaticsScreenState();
}

class _StaticsScreenState extends State<StaticsScreen> {
  int _selectedIndex = 0;

  final List<String> tabs = [
    'Personal statistics',
    'Test your knowledge',
    'Best score',
  ];

  final List<Widget> tabContents = [
    const PersonalScreen(),
    TestKnowledgeScreen(),
    const BestScoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F3F3),
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.account_circle,
              size: width * 0.07,
              color: const Color(0xFF221763),
            ),
            SizedBox(width: width * 0.025),
            const Text(
              'Career',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14, // يمكنك تغييره إلى نسبة إن أردت
                fontWeight: FontWeight.w800,
                fontFamily: 'Musedo',
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: height * 0.12,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: height * 0.07,
                left: width * 0.05,
                right: width * 0.05,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(tabs.length, (index) {
                        final isSelected = _selectedIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontFamily: 'Mulish',
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                              color: isSelected ? Colors.black : Colors.grey,
                            ),
                            child: Text(tabs[index]),
                          ),
                        );
                      }),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                      height: height * 0.04,
                    ),
                    SizedBox(height: height * 0.03),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (child, animation) =>
                              FadeTransition(opacity: animation, child: child),
                      child: Container(
                        key: ValueKey(_selectedIndex),
                        child: tabContents[_selectedIndex],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.04,
            child: ValueListenableBuilder<File?>(
              valueListenable: ProfileImageNotifier.imageNotifier,
              builder: (context, image, _) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: width * 0.1,
                    backgroundImage:
                        image != null
                            ? FileImage(image)
                            : const AssetImage('assets/images/profile.png')
                                as ImageProvider,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
