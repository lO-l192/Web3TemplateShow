import 'package:aspirehub/screens/video_screen.dart';
import 'package:aspirehub/widgets/circularprogress.dart';
import 'package:aspirehub/widgets/videocard.dart';
import 'package:flutter/material.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({super.key});

  @override
  State<PlayListScreen> createState() => _PlaylistscreenState();
}

class _PlaylistscreenState extends State<PlayListScreen> {
  List<Map<String, dynamic>> videoData = [
    {'lec': 1, 'time': 3},
    {'lec': 2, 'time': 3},
    {'lec': 3, 'time': 3},
    {'lec': 4, 'time': 3},
    {'lec': 5, 'time': 3},
    {'lec': 6, 'time': 3},
    {'lec': 7, 'time': 3},
    {'lec': 8, 'time': 3},
    {'lec': 9, 'time': 3},
  ];

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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: SizedBox(
              width: double.infinity,
              height: 155,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F2FA),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Certified Public \nAccountant ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.access_time_filled_sharp),
                          Text(
                            ' 3 hours',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CircularProgress(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 210, left: 20),
            child: SingleChildScrollView(
              child: Column(
                children:
                    videoData.map((video) {
                      return VideoCard(
                        lec: video['lec'],
                        time: video['time'],
                        index:
                            videoData.indexOf(video) +
                            1, // to get the index dynamically
                        targetPage: VideoPlayerScreen(),
                      );
                    }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
