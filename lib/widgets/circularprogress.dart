import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress({super.key});

  @override
  State<CircularProgress> createState() => _CircularprogressState();
}

class _CircularprogressState extends State<CircularProgress> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 50),
      child: CircularPercentIndicator(
        radius: 45,
        animation: true,
        animationDuration: 1200,
        lineWidth: 10.0,
        percent: 0.5,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: Colors.black,
        backgroundColor: const Color(0xFFA6A6A6),
        center: Text(
          '50%',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
