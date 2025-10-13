import 'package:aspirehub/Models/DashBoard/dashcard.dart';
import 'package:aspirehub/Models/DashBoard/listtile.dart';
import 'package:aspirehub/screens/play_list_screen.dart';
import 'package:flutter/material.dart';

class CourseDashBoard extends StatelessWidget {
  const CourseDashBoard({super.key});

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: DashListtile(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Image.asset('assets/images/pers22.png'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Your Courses',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            ProgressCard(
              title: 'Certified Public Accountant',
              subtitle: 'All can be perfect in Certified Public...',
              progress: 0.2,
              cardext: 'Description...',
              targetPage: PlayListScreen(),
            ),
            ProgressCard(
              title: 'Certified Public Accountant',
              subtitle: 'All can be perfect in Certified Public...',
              progress: 0.2,
              cardext: 'Description...',
              targetPage: PlayListScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
