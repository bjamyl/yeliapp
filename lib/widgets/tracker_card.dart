import 'package:flutter/material.dart';

class TrackerCard extends StatelessWidget {
  const TrackerCard(
      {super.key,
      required this.cardName,
      required this.isText,
      required this.icon,
      required this.iconColor,
      required this.measurable,
      required this.trackItem,
      required this.iconBG});
  final String cardName;
  final IconData icon;
  final Color iconColor;
  final Color iconBG;
  final Widget trackItem;
  final bool isText;
  final String measurable;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16),
      width: size.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(
                width: 2,
              ),
              Wrap(children: [
                Text(
                  cardName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ]),
            ],
          ),
          FittedBox(
            child: Text(
              measurable,
              style: const TextStyle(fontSize: 28, fontFamily: "Barlow"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerRight,
                width: isText? 100 : 50,
                height: 50,
                child: trackItem,
              ),
            ],
          )
        ],
      ),
    );
  }
}
