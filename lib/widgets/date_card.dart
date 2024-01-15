import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../contants.dart';

class DateCard extends StatelessWidget {
  const DateCard(
      {super.key,
      required this.num,
      required this.month,
      required this.date,
      required this.timeSlept});

  final double num;
  final String month;
  final String date;
  final String timeSlept;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.only(bottom: 16),
      height: 80,
      decoration: BoxDecoration(
          color: kBackgroundColor, borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  month,
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('You slept for $timeSlept'),
              const SizedBox(
                height: 4,
              ),
              Stack(
                children: [
                  Container(
                    width: 200,
                    height: 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.3)),
                  ),
                  Container(
                    width: num,
                    height: 8,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20)),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
