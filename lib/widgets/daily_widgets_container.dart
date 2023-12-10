import 'package:flutter/material.dart';
import '../contants.dart';
import './metrics/yeliscore.dart';
import './tracker_card.dart';

class DailyTrackerContainer extends StatelessWidget {
  const DailyTrackerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          TrackerCard(
            isText: true,
            measurable: '5h 30m',
            cardName: 'Sleep Quality',
            icon: Icons.bed,
            iconColor: kDefaultPurple,
            iconBG: kDefaultPurple.withOpacity(0.2),
            trackItem: Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: const FittedBox(
                child: Text(
                  'On Target',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          TrackerCard(
            isText: false,
            measurable: 'Almost there!',
            cardName: 'Physical Activity',
            icon: Icons.run_circle,
            trackItem: Yeliscore(
              isBig: false,
              score: 55,
              gaugeNumberColor: Colors.blueAccent,
              rangePointerColor: Colors.blue,
              axisLineColor: Colors.blue.withOpacity(0.1),
            ),
            iconColor: kDefaultOrange,
            iconBG: kDefaultOrange.withOpacity(0.2),
          ),
          TrackerCard(
            isText: false,
            measurable: 'Getting there',
            cardName: 'Social Activity',
            icon: Icons.watch,
            trackItem: Yeliscore(
              isBig: false,
              score: 15,
              gaugeNumberColor: Colors.blueAccent,
              rangePointerColor: Colors.blue,
              axisLineColor: Colors.blue.withOpacity(0.1),
            ),
            iconColor: kDefaultGreen,
            iconBG: kDefaultGreen.withOpacity(0.2),
          ),
          TrackerCard(
            isText: true,
            measurable: 'Feeling good!',
            trackItem: Text(
              'Happy',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.6)),
            ),
            cardName: 'Mood Tracker',
            icon: Icons.emoji_emotions,
            iconColor: kDefaultPurple,
            iconBG: kDefaultPurple.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
