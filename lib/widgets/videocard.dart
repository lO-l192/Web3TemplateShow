import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final int lec;
  final int time;
  final int index;
  final Widget targetPage;
  const VideoCard({
    super.key,
    required this.lec,
    required this.time,
    required this.index,
    required this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Positioned(
        top: 266.0 + (index * 90),
        left: 14.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 30),
          child: Container(
            width: double.infinity,
            height: 77,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              title: Text(
                'Lec $lec',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Row(
                children: [
                  SizedBox(width: 4),
                  Text(
                    '$time hours',
                    style: TextStyle(fontSize: 14, color: Colors.black45),
                  ),
                ],
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(bottom: 13, left: 10),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => targetPage),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  icon: Icon(Icons.play_circle, color: Colors.black, size: 25),
                  label: SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
