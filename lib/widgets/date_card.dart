import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateCard extends StatelessWidget {
  const DateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.only(bottom: 16),
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(247, 244, 242, 1),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(8),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'NOV',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
                Text(
                  '30',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('You slept for 4.2h'),
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
                          color: Color.fromRGBO(247, 244, 242, 1)),
                    ),
                    Container(
                      width: 50,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/icons/sad.svg',
            width: 35,
          )
        ],
      ),
    );
  }
}
