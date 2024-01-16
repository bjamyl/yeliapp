import 'package:flutter/material.dart';
import '../screens/sleep_input_screen.dart';
import '../contants.dart';

class RecordSleepDataButton extends StatelessWidget {
  const RecordSleepDataButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(SleepInputScreen.routeName);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
            color: kDefaultPurple, borderRadius: BorderRadius.circular(15)),
        child: const Text(
          'Record sleep data',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
