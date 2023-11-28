import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Widget imports
import '../widgets/metric_card.dart';
import '../widgets/tracker_card.dart';
import '../widgets/metrics/yeliscore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 244, 242, 1),
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              child: SvgPicture.asset(
                'assets/icons/bell.svg',
                height: 35,
              ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: CircleAvatar(
            radius: 5,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 40),
                child: RichText(
                    text: const TextSpan(
                        text: 'Good Afternoon, \n',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 25,
                          color: Colors.black,
                          height: 1.2,
                        ),
                        children: [
                      TextSpan(
                          text: 'Shuri!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26))
                    ])),
              ),
              const Text(
                'Health Metrics',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:  [
                    MetricCard(
                        icon: Icons.favorite,
                        color: Color.fromRGBO(155, 177, 103, 1),
                        cardName: 'Yeli Score',
                        childScore: Yeliscore()),
                    MetricCard(
                        color: Color.fromRGBO(237, 126, 28, 1),
                        cardName: 'Mood',
                        icon: Icons.emoji_emotions,
                        childScore: Yeliscore()),
                    MetricCard(
                        color: Color.fromRGBO(166, 148, 245, 1),
                        cardName: 'Sleep',
                        icon: Icons.bed,
                        childScore: Yeliscore())
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Mindful Tracker',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TrackerCard(
                cardName: "Sleep Quality",
                description: 'Insomniac (~2h Avg)',
                icon: Icons.bed,
                iconColor: const Color.fromRGBO(166, 148, 245, 1),
                iconContainerColor:
                    const Color.fromRGBO(166, 148, 245, 1).withOpacity(0.2),
              ),
              TrackerCard(
                cardName: "Mood Tracker",
                description: 'Sad',
                icon: Icons.emoji_emotions,
                iconColor: const Color.fromRGBO(146, 98, 71, 1),
                iconContainerColor:
                    const Color.fromRGBO(146, 98, 71, 1).withOpacity(0.2),
              ),
              TrackerCard(
                cardName: "My Journal",
                description: '20 Day Streak',
                icon: Icons.note_add_rounded,
                iconColor: const Color.fromRGBO(237, 126, 28, 1),
                iconContainerColor:
                    const Color.fromRGBO(237, 136, 28, 1).withOpacity(0.2),
              ),
              TrackerCard(
                cardName: "Mood Tracker",
                description: 'Sad',
                icon: Icons.emoji_emotions,
                iconColor: const Color.fromRGBO(146, 98, 71, 1),
                iconContainerColor:
                    const Color.fromRGBO(146, 98, 71, 1).withOpacity(0.2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
