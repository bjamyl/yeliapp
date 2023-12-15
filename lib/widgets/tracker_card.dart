import 'package:flutter/material.dart';
import '../contants.dart';

class TrackerCard extends StatelessWidget {
  const TrackerCard(
      {super.key,
      required this.routeName,
      required this.statsWidget,
      required this.trackTitle,
      required this.trackDesc});

  final Widget statsWidget;
  final String trackTitle;
  final String trackDesc;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          width: double.infinity,
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    style: const TextStyle(
                        color: Color.fromARGB(255, 122, 119, 119)),
                    text: trackTitle,
                    children: [
                      TextSpan(
                          text: '\n$trackDesc',
                          style: const TextStyle(
                              color: kBlack,
                              fontFamily: 'Barlow',
                              fontSize: 30,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
              SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FittedBox(child: statsWidget),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
