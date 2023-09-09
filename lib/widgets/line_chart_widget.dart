import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../controller/colors.dart';

class ProjectGraph extends StatelessWidget {
  ProjectGraph({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    greenColor,
    Colors.white60,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: LineChart(
        LineChartData(
            gridData:
                FlGridData(drawHorizontalLine: true, drawVerticalLine: false),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: leftTitleWidgets,
                  reservedSize: 42,
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(
              show: false,
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            maxX: 5,
            maxY: 4,
            minY: 0,
            minX: 0,
            lineBarsData: [
              LineChartBarData(
                  dotData: FlDotData(show: false),
                  isStrokeCapRound: false,
                  curveSmoothness: .6,
                  preventCurveOverShooting: true,
                  belowBarData: BarAreaData(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: gradientColors
                            .map((e) => e.withOpacity(0.8))
                            .toList()),
                    show: true,
                  ),
                  barWidth: 3,
                  color: greenColor,
                  isCurved: true,
                  spots: [
                    const FlSpot(0, 2),
                    const FlSpot(1, 2.1),
                    const FlSpot(2, 2.7),
                    const FlSpot(3, 3.5),
                    const FlSpot(4, 3),
                    const FlSpot(5, 4),
                  ]),
            ]),
      ),
    );
  }
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = '';
      break;
    case 1:
      text = '0';
      break;
    case 2:
      text = '2';
      break;
    case 3:
      text = '5';
      break;
    case 4:
      text = '10';
      break;
    default:
      return Container();
  }
  return Text(text, style: style, textAlign: TextAlign.left);
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Sun', style: style);
      break;
    case 1:
      text = const Text('Mon', style: style);
      break;
    case 2:
      text = const Text('Tue', style: style);
      break;

    case 3:
      text = const Text('Wed', style: style);
      break;

    case 4:
      text = const Text('Thu', style: style);
      break;
    case 5:
      text = const Text('Fri', style: style);
      break;
    case 5:
      text = const Text('sat', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
