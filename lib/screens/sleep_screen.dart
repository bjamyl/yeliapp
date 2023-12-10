import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/date_card.dart';
import '../widgets/sleep_quality_card.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  static const routeName = '/sleep';

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: const Text('Add Sleep record')),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Sleep Quality',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: const Color.fromRGBO(247, 244, 242, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                const SleepQualityCard(),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/sad.svg', width: 40),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'You are getting Inadequate Sleep',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Your Sleep History',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      child: const Text('See All'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const SingleChildScrollView(
                    child: Column(
                  children: [
                    DateCard(),
                    DateCard(),
                    DateCard(),
                    DateCard(),
                    DateCard(),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
