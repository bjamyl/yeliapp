import 'package:flutter/material.dart';
import '../contants.dart';
import './metrics/yeliscore.dart';
import './tracker_card.dart';
import '../screens/sleep_screen.dart';

class DailyTrackerContainer extends StatelessWidget {
  const DailyTrackerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TrackerCard(
          routeName: SleepScreen.routeName,
          statsWidget: BarLoader(barColor: kDefaultOrange),
          trackDesc: '5h30m',
          trackTitle: 'Sleep time',
        ),
        const TrackerCard(
          routeName: SleepScreen.routeName,
          statsWidget: Icon(
            Icons.emoji_emotions,
            color: kPurple,
          ),
          trackTitle: 'Mood tracker',
          trackDesc: 'Happy',
        ),
        TrackerCard(
          routeName: SleepScreen.routeName,
          statsWidget: Yeliscore(
              gaugeNumberColor: kBlue,
              rangePointerColor: kBlue,
              axisLineColor: kBlue.withOpacity(0.3),
              score: 20,
              isBig: false),
          trackTitle: 'Physical activity',
          trackDesc: 'Good',
        ),
        const TrackerCard(
          routeName: SleepScreen.routeName,
          statsWidget: BarLoader(
            barColor: kGreenColor,
          ),
          trackTitle: 'Social activity',
          trackDesc: 'Good',
        ),
      ],
    );
  }
}

class BarLoader extends StatelessWidget {
  const BarLoader({
    super.key,
    required this.barColor,
  });

  final Color barColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 8,
          decoration: BoxDecoration(
            color: barColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          width: 80,
          height: 8,
          decoration: BoxDecoration(
            color: barColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
