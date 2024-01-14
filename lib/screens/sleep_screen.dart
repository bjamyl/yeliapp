import 'package:flutter/material.dart';
import '../widgets/date_card.dart';
import '../services/utils/month_string_util.dart';
import '../widgets/sleep_quality_card.dart';
import 'package:intl/intl.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  static const routeName = '/sleep';

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

DateTime now = DateTime.now();
int monthNumber = now.month;

class _SleepScreenState extends State<SleepScreen> {
  String monthWord = monthNumberToWord(monthNumber);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: RichText(
          text: TextSpan(
              text: 'Sleep quality \n',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              children: [
                TextSpan(
                    text:
                        '${DateFormat('EEEE').format(now)}, $monthWord ${DateTime.now().day.toString()}',
                    style: const TextStyle(fontSize: 16))
              ]),
        ),
      ),
      backgroundColor: const Color.fromRGBO(23, 20, 37, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: SleepQualityCard(),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sleep history',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('See all')
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DateCard(
                          num: 80, month: "NOV", date: '30', timeSlept: '5hr'),
                      DateCard(
                          num: 50, month: "NOV", date: '29', timeSlept: '3hr'),
                      DateCard(
                          num: 100, month: "NOV", date: '28', timeSlept: '8hr'),
                      DateCard(
                          num: 20, month: "NOV", date: '27', timeSlept: '2hr'),
                      DateCard(
                          num: 180,
                          month: "NOV",
                          date: '26',
                          timeSlept: '10hr'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
