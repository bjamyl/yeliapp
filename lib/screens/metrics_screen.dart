import 'package:flutter/material.dart';

class MetricsScreen extends StatefulWidget {
  const MetricsScreen({super.key});

  @override
  State<MetricsScreen> createState() => _MetricsScreenState();
}

class _MetricsScreenState extends State<MetricsScreen> {
  List<double> weeklySummary = [1, 2, 1, 4, 1, 1, 4];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('This is the metrics screen'),
    ));
  }
}
