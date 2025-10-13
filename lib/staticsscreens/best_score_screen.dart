import 'package:aspirehub/Models/DashBoard/ranking_item.dart';
import 'package:flutter/material.dart';

class BestScoreScreen extends StatelessWidget {
  const BestScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> rankingData = [
      {
        "name": "Ahmed Mohamed",
        "points": 300,
        "image": "assets/images/profile.png",
      },
      {"name": "Sara Ali", "points": 270, "image": "assets/images/profile.png"},
      {
        "name": "Mohamed Fathy",
        "points": 250,
        "image": "assets/images/profile.png",
      },
      {
        "name": "Youssef Salah",
        "points": 200,
        "image": "assets/images/profile.png",
      },
      {
        "name": "Mai Tarek",
        "points": 190,
        "image": "assets/images/profile.png",
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(4, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "#1",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mulish',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Expanded(
                  child: Text(
                    'You are doing better than \n60% of other people.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Mulish',
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Best score',
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          ...rankingData.asMap().entries.map((entry) {
            final index = entry.key;
            final data = entry.value;

            return RankingItem(
              rank: index + 1,
              name: data["name"],
              points: data["points"],
              imagePath: data["image"],
              onTap: () {
                print("Tapped on ${data["name"]}");
              },
            );
          }),
          // .toList(),
        ],
      ),
    );
  }
}
