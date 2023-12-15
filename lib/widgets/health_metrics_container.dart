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
            iconColor: kGreenColor,
            imageDir: 'assets/images/asset3.png',
            icon: Icons.favorite,
            cardName: 'Yeli Score',
            childScore: Yeliscore(
              isBig: true,
              score: 86,
              rangePointerColor: kGreenColor,
              axisLineColor: kGreenColor.withOpacity(0.2),
              gaugeNumberColor: kGreenColor,
            ),
          ),
          const MetricCard(
            iconColor: kDefaultPurple,
            imageDir: 'assets/images/happy.png',
            cardName: 'Mood',
            icon: Icons.emoji_emotions,
            childScore: MoodScore(),
          ),
          MetricCard(
            iconColor: kBlue,
            imageDir: 'assets/images/sleeping.png',
            cardName: 'Sleep',
            icon: Icons.bed,
            childScore: Yeliscore(
              isBig: true,
              score: 89,
              rangePointerColor: kBlue,
              axisLineColor: kBlue.withOpacity(0.2),
              gaugeNumberColor: kBlue,
            ),
          )
        ],
      ),
    );
  }
}
