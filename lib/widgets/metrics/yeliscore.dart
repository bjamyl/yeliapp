import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Yeliscore extends StatelessWidget {
  const Yeliscore(
      {super.key,
      required this.gaugeNumberColor,
      required this.rangePointerColor,
      required this.axisLineColor,
      required this.score, required this.isBig});

  final Color gaugeNumberColor;
  final Color rangePointerColor;
  final Color axisLineColor;
  final int score;
  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          pointers: <GaugePointer>[
            RangePointer(
              color: rangePointerColor,
              value: score.ceilToDouble(),
              cornerStyle: CornerStyle.bothCurve,
              width: 0.2,
              sizeUnit: GaugeSizeUnit.factor,
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              positionFactor: 0.1,
              angle: 90,
              widget: Text(
                score.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isBig? 26 : 18,
                  color: gaugeNumberColor,
                ),
              ),
            )
          ],
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          axisLineStyle: AxisLineStyle(
              thickness: 0.2,
              cornerStyle: CornerStyle.bothCurve,
              color: axisLineColor,
              thicknessUnit: GaugeSizeUnit.factor),
        )
      ],
    );
  }
}
