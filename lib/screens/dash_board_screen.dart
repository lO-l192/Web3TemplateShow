import 'package:aspirehub/Models/DashBoard/dashcard.dart';
import 'package:aspirehub/Models/DashBoard/dashmodel.dart';
import 'package:aspirehub/Models/DashBoard/listtile.dart';
import 'package:aspirehub/screens/course_dash_board_screen.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashBoardScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> recommendedJobs = [
    {'imagePath': 'assets/images/pers1.png', 'title': 'Software Engineer'},
    {'imagePath': 'assets/images/pers2.png', 'title': 'UI/UX Designer'},
    {'imagePath': 'assets/images/pers3.png', 'title': 'Data Analyst'},
    {'imagePath': 'assets/images/pers3.png', 'title': 'UI/UX Designer'},
    {'imagePath': 'assets/images/pers3.png', 'title': 'Software Engineer'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                child: DashListtile(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AnimSearchBar(
                  width: double.maxFinite,
                  textController: _searchController,
                  onSuffixTap: () => _searchController.clear(),
                  onSubmitted: (value) {},
                  color: const Color(0xFFF1F1F1),
                  helpText: 'Search',
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recommended job for you',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedJobs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: DashModel(
                        imagePath: recommendedJobs[index]['imagePath']!,
                        title: recommendedJobs[index]['title']!,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => CourseDashBoard(),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
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
                targetPage: CourseDashBoard(),
              ),
              ProgressCard(
                title: 'Certified Public Accountant',
                subtitle: 'All can be perfect in Certified Public...',
                progress: 0.2,
                cardext: 'Description...',
                targetPage: CourseDashBoard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
