import 'package:flutter/material.dart';
import '../contants.dart';
import './metrics/yeliscore.dart';

class SleepQualityCard extends StatelessWidget {
  const SleepQualityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // DateTime now = DateTime.now();

    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Yeliscore(
              gaugeNumberColor: kDefaultPurple,
              rangePointerColor: kDefaultPurple,
              axisLineColor: kDefaultPurple.withOpacity(0.3),
              score: 80,
              isBig: true),
          const SizedBox(
            width: 32,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.bed,
                    color: kDefaultPurple,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Sleep duration \n',
                          style:
                              TextStyle(color: kDefaultPurple.withOpacity(0.4)),
                          children: const [
                        TextSpan(
                            text: '7hr 35m',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Barlow',
                            ))
                      ]))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time_filled,
                    color: kDefaultPurple,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'My target \n',
                          style:
                              TextStyle(color: kDefaultPurple.withOpacity(0.4)),
                          children: const [
                        TextSpan(
                            text: '8hr',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Barlow',
                            ))
                      ]))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
