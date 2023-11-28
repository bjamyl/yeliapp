import 'package:flutter/material.dart';

class TrackerCard extends StatefulWidget {
  const TrackerCard(
      {super.key,
      required this.cardName,
      required this.icon,
      required this.iconColor,
      required this.iconContainerColor,
      required this.description});
  final String cardName;
  final IconData icon;
  final Color iconColor;
  final Color iconContainerColor;
  final String description;

  @override
  State<TrackerCard> createState() => _TrackerCardState();
}

class _TrackerCardState extends State<TrackerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: widget.iconContainerColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                widget.icon,
                color: widget.iconColor,
              )),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.cardName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                widget.description,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(141, 135, 131, 1)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
