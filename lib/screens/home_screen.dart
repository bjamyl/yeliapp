import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeliapp/widgets/metrics/moodscore.dart';
import 'package:yeliapp/widgets/metrics/yeliscore.dart';
import '../contants.dart';
// Widget imports
// import '../providers/auth.dart';
import '../widgets/daily_widgets_container.dart';
import '../services/utils/month_string_util.dart';
import '../services/utils/time_of_day.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

DateTime now = DateTime.now();
int monthNumber = now.month;

class _HomeScreenState extends State<HomeScreen> {
  String monthWord = monthNumberToWord(monthNumber);

//Showing the date picker
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(200),
      lastDate: DateTime(2025),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final userFirstName =
    //     Provider.of<Auth>(context, listen: false).userFirstName;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        actions: <Widget>[
          GestureDetector(
            onTap: _showDatePicker,
            child: Row(
              children: [
                Text(
                  monthWord,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  width: 8,
                ),
                SvgPicture.asset(
                  'assets/icons/calendar.svg',
                  width: 25,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
                onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.bell)),
          ),
        ],
        backgroundColor: Colors.transparent,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              const SizedBox(
                width: 8,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Good ${greeting()}! \n',
                      style: const TextStyle(color: Colors.black),
                      children: const [
                    TextSpan(text: 'Jamil', style: TextStyle(fontSize: 23))
                  ]))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Health Metrics',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 8, left: 8, right: 16),
                      height: size.height * 0.45,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        color: kGreenColor.withOpacity(0.15),
                        border: Border.all(width: 2, color: kGreenColor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: kGreenColor,
                            ),
                            Text(
                              'Yeli Score',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Yeliscore(
                            gaugeNumberColor: kGreenColor,
                            rangePointerColor: kGreenColor,
                            axisLineColor: kGreenColor.withOpacity(0.3),
                            score: 75,
                            isBig: true),
                        Image.asset("assets/images/man_meditate.png")
                      ]),
                    ),
                    Column(
                      children: [
                        HealthMetricsCard(
                            size: size,
                            metricWidget: Yeliscore(
                                gaugeNumberColor: kDefaultOrange,
                                rangePointerColor: kDefaultOrange,
                                axisLineColor: kDefaultOrange.withOpacity(0.3),
                                score: 85,
                                isBig: true),
                            iconName: Icons.bed,
                            metricTitle: 'Sleep',
                            iconColor: kDefaultOrange,
                            metricCardColor: kDefaultOrange),
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        HealthMetricsCard(
                          size: size,
                          iconColor: kPurple,
                          iconName: Icons.emoji_emotions,
                          metricCardColor: kPurple,
                          metricTitle: 'Mood',
                          metricWidget: const MoodScore(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Text(
                'Daily Tracker',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const DailyTrackerContainer()
            ],
          ),
        ),
      ),
    );
  }
}

class HealthMetricsCard extends StatelessWidget {
  const HealthMetricsCard(
      {super.key,
      required this.size,
      required this.metricWidget,
      required this.iconName,
      required this.metricTitle,
      required this.iconColor,
      required this.metricCardColor});

  final Size size;
  final Widget metricWidget;
  final IconData iconName;
  final String metricTitle;
  final Color iconColor;
  final Color metricCardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 16),
      width: size.width * 0.4,
      height: size.height * 0.25,
      decoration: BoxDecoration(
          color: metricCardColor.withOpacity(0.15),
          border: Border.all(color: metricCardColor, width: 2),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                iconName,
                color: iconColor,
              ),
              Text(
                metricTitle,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          metricWidget,
        ],
      ),
    );
  }
}
