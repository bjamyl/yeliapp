import 'package:flutter/material.dart';

class MetricCard extends StatefulWidget {
  const MetricCard(
      {super.key,
      required this.color,
      required this.cardName,
      required this.icon,
      required this.childScore});

  final Color color;
  final String cardName;
  final IconData icon;
  final Widget childScore;

  @override
  State<MetricCard> createState() => _MetricCardState();
}

class _MetricCardState extends State<MetricCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      width: size.width * 0.4,
      height: 185,
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(25)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Icon(
              widget.icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              widget.cardName,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 120,
          width: double.infinity,
          child: widget.childScore,
        ),
      ]),
    );
  }
}
