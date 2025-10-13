import 'package:aspirehub/screens/pdf.screen.dart';
import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late CustomVideoPlayerController _customVideoPlayerController;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          _videoPlayerController.value.isInitialized
              ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 350,
                          child: CustomVideoPlayer(
                            customVideoPlayerController:
                                _customVideoPlayerController,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 10,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome to your journey toward becoming a Certified Public Accountant! '
                            'In this first lecture, we’ll cover the basics you need to know to kickstart your CPA preparation. '
                            'Let’s dive in and start learning!',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PdfScreen(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              foregroundColor: Colors.black,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'Click to download lecture summary',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.insert_drive_file_rounded, size: 20),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Next Lecture',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => const VideoPlayerScreen(),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: double.infinity,
                              height: 130,
                              child: Container(
                                height: 130,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x24000000),
                                      offset: Offset(4, 4),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 89,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          'assets/images/Rectangle 4.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 8,
                                            ),
                                        title: Row(
                                          children: [
                                            const Text(
                                              'Lec 2',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        subtitle: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            SizedBox(height: 4),
                                            Text(
                                              'Mohamed Workshop',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                                fontFamily: 'Quick',
                                              ),
                                            ),
                                            SizedBox(width: 50),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                '3 Hours',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Quick',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              : const Center(child: CircularProgressIndicator()),
    );
  }

  void initializeVideoPlayer() {
    _videoPlayerController = VideoPlayerController.asset('assets/video/1.mp4')
      ..initialize().then((_) {
        setState(() {
          _customVideoPlayerController = CustomVideoPlayerController(
            context: context,
            videoPlayerController: _videoPlayerController,
          );
        });
      });
  }
}
