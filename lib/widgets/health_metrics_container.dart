import 'package:flutter/material.dart';
import './metric_card.dart';
import './metrics/yeliscore.dart';
import './metrics/moodscore.dart';
import '../contants.dart';

class HealthMetricsContainer extends StatelessWidget {
  const HealthMetricsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          MetricCard(
            imageDir: 'assets/images/asset3.png',
            icon: Icons.favorite,
            color: kDefaultGreen,
            cardName: 'Yeli Score',
            childScore: Yeliscore(
              isBig: true,
              score: 86,
              rangePointerColor: kDefaultWhite,
              axisLineColor: kDefaultWhite.withOpacity(0.5),
              gaugeNumberColor: kDefaultWhite,
            ),
          ),
          const MetricCard(
            imageDir: 'assets/images/happy.png',
            color: kDefaultOrange,
            cardName: 'Mood',
            icon: Icons.emoji_emotions,
            childScore: MoodScore(),
          ),
          MetricCard(
            imageDir: 'assets/images/sleeping.png',
            color: kDefaultPurple,
            cardName: 'Sleep',
            icon: Icons.bed,
            childScore: Yeliscore(
              isBig: true,
              score: 89,
              rangePointerColor: kDefaultWhite,
              axisLineColor: kDefaultWhite.withOpacity(0.5),
              gaugeNumberColor: kDefaultWhite,
            ),
          )
        ],
      ),
    );
  }
}
