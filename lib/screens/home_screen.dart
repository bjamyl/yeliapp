import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Widget imports
import '../providers/auth.dart';
import '../widgets/daily_widgets_container.dart';
import '../widgets/health_metrics_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userFirstName =
        Provider.of<Auth>(context, listen: false).userFirstName;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 244, 242, 1),
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    size: 32,
                  )))
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
                    text: TextSpan(
                        text: 'Good Afternoon, \n',
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 32,
                          color: Colors.black,
                          height: 1.2,
                        ),
                        children: [
                      TextSpan(
                          text: "Jamil!",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ))
                    ])),
              ),
              const Text(
                'Health Metrics',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 32),
                child: HealthMetricsContainer(),
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
