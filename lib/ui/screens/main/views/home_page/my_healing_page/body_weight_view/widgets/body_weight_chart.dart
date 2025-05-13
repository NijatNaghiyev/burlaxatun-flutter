import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BodyWeightChart extends StatelessWidget {
  const BodyWeightChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        maximumLabels: 5,
        minimum: 0,
        maximum: 5,
        labelPlacement: LabelPlacement.onTicks,
        axisLabelFormatter: (AxisLabelRenderDetails details) {
          if (details.text == 'True 03' ||
              details.text == '03 AM' ||
              details.text == '06 AM' ||
              details.text == '09 AM' ||
              details.text == '12 AM') {
            return ChartAxisLabel(details.text, TextStyle());
          }
          return ChartAxisLabel('', TextStyle());
        },
      ),
      primaryYAxis: NumericAxis(),
      series: [
        LineSeries(
          dataSource: [
            WeightData('True 03', 0.3),
            WeightData('03 AM', 0.28),
            WeightData('06 AM', 0.4),
            WeightData('09 AM', 0.42),
            WeightData('12 AM', 0.7),
          ],
          xValueMapper: (data, _) => data.x,
          yValueMapper: (data, _) => data.y,
          markerSettings: MarkerSettings(
            height: 12,
            width: 12,
            isVisible: true,
            color: Color(0xff1A5499),
            shape: DataMarkerType.circle,
          ),
          color: Color(0xffAFF2F2),
          width: 2,
          animationDuration: 150,
        ),
      ],
    );
  }
}

class WeightData {
  final String x;
  final double y;

  WeightData(this.x, this.y);
}
