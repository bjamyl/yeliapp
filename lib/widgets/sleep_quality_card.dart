import 'package:flutter/material.dart';
import './metrics/yeliscore.dart';
import 'package:intl/intl.dart';
import "../services/utils/month_string_util.dart";

class SleepQualityCard extends StatelessWidget {
  const SleepQualityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    DateTime now = DateTime.now();
    int monthNumber = now.month;
    String monthWord = monthNumberToWord(monthNumber);

    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(33, 32, 64, 1),
          borderRadius: BorderRadius.circular(25)),
      width: double.infinity,
      height: size.height * 0.25,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Yeliscore(
              gaugeNumberColor: Colors.white,
              rangePointerColor: Color.fromRGBO(196, 253, 255, 1),
              axisLineColor: Colors.white,
              score: 80,
              isBig: true),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.bed,
                    color: Color.fromRGBO(196, 253, 255, 1),
                    size: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  RichText(
                      text: const TextSpan(
                          text: 'Sleep time \n',
                          style: TextStyle(
                              color: Color.fromRGBO(196, 253, 255, 1)),
                          children: [
                        TextSpan(
                            text: '7hr 35m',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
                    color: Color.fromRGBO(196, 253, 255, 1),
                    size: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  RichText(
                      text: const TextSpan(
                          text: 'My target \n',
                          style: TextStyle(
                              color: Color.fromRGBO(196, 253, 255, 1)),
                          children: [
                        TextSpan(
                            text: '7hr 35m',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
