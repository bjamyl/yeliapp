import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../contants.dart';

class MoodScore extends StatelessWidget {
  const MoodScore({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.35,
      height: size.height * 0.18,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          isVisible: false,
        ),
        primaryYAxis: NumericAxis(
            isVisible: false,
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0)),
        series: [
          ColumnSeries(
              color: kDefaultPurple,
              isTrackVisible: false,
              borderRadius: BorderRadius.circular(15),
              dataSource: getColumnData(),
              xValueMapper: (SalesData sales, _) => sales.x,
              yValueMapper: (SalesData sales, _) => sales.y)
        ],
      ),
    );
  }
}

class SalesData {
  String x;
  double y;

  SalesData(this.x, this.y);
}

dynamic getColumnData() {
  List<SalesData> columnData = <SalesData>[
    SalesData("Mon", 2),
    SalesData("Tue", 3),
    SalesData("Wed", 4),
    SalesData("Thur", 1),
    SalesData("Fri", 5),
    SalesData("Sat", 3),
    SalesData("Sun", 4),
  ];

  return columnData;
}
