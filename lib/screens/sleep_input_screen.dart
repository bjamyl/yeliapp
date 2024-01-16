import 'package:flutter/material.dart';
import 'package:yeliapp/contants.dart';
import 'package:yeliapp/screens/sleep_screen.dart';
import '../widgets/sleep_screen/pick_time_widget.dart';

class SleepInputScreen extends StatefulWidget {
  const SleepInputScreen({super.key});

  static const routeName = '/inputScreen';

  @override
  State<SleepInputScreen> createState() => _SleepInputScreenState();
}

class _SleepInputScreenState extends State<SleepInputScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Container(
        color: kBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Cancel'),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            )
          ],
        ),
      ),
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Today',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: size.height * 0.5,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PickTimeWidget(
                  time: "11:00PM",
                  iconDir: 'assets/icons/night.svg',
                  title: 'Sleep time'),
              SizedBox(
                width: 32,
              ),
              PickTimeWidget(
                time: "5:00AM",
                iconDir: 'assets/icons/sun.svg',
                title: "Wake time",
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
