import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../contants.dart';
import '../widgets/date_card.dart';
import '../widgets/weekly_sleep.dart';
import '../widgets/record_sleep_button.dart';
import '../services/utils/month_string_util.dart';
import '../widgets/sleep_quality_card.dart';

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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const RecordSleepDataButton(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: RichText(
          text: TextSpan(
              text: 'Sleep Quality \n',
              style: const TextStyle(fontSize: 20, color: Colors.black),
              children: [
                TextSpan(
                    text:
                        '${DateFormat('EEEE').format(now)}, $monthWord ${DateTime.now().day.toString()}',
                    style: const TextStyle(fontSize: 16, color: Colors.black))
              ]),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 8, left: 16),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Yesterday',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: SleepQualityCard(),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 8, left: 16),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Weekly sleep insights',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                  alignment: Alignment.centerRight,
                  child: WeeklySleep()),
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
