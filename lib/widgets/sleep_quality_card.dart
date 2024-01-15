import 'package:flutter/material.dart';
import '../contants.dart';
import './metrics/yeliscore.dart';
import 'package:intl/intl.dart';
import "../services/utils/month_string_util.dart";

class SleepQualityCard extends StatelessWidget {
  const SleepQualityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: kDefaultOrange, width: 1),
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)),
      width: double.infinity,
      height: size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Last recorded date: 2 Days ago',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Yeliscore(
                  gaugeNumberColor: Colors.black26,
                  rangePointerColor: kDefaultOrange,
                  axisLineColor: kDefaultOrange.withOpacity(0.3),
                  score: 80,
                  isBig: true),
              const SizedBox(
                width: 32,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.bed,
                        color: kDefaultOrange,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      RichText(
                          text: const TextSpan(
                              text: 'Sleep time \n',
                              style: TextStyle(color: Colors.black26),
                              children: [
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
                        color: kDefaultOrange,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      RichText(
                          text: const TextSpan(
                              text: 'My target \n',
                              style: TextStyle(color: Colors.black26),
                              children: [
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
        ],
      ),
    );
  }
}
