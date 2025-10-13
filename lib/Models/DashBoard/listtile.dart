import 'dart:io';
import 'package:aspirehub/Models/controller/profile_controller.dart';
import 'package:flutter/material.dart';

class DashListtile extends StatelessWidget {
  const DashListtile({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<File?>(
      valueListenable: ProfileImageNotifier.imageNotifier,
      builder: (context, image, _) {
        return ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage:
                image != null
                    ? FileImage(image)
                    : const AssetImage('assets/images/profile.png')
                        as ImageProvider,
          ),
          title: const Text(
            'Hi, Ahmed Mahmoud',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          subtitle: const Text(
            'Your personality type : ISTJ',
            style: TextStyle(
              fontSize: 8,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {},
            child: Container(
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFF6F6F6),
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
