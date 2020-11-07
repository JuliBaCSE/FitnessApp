import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

//ToDo: if data == null plot nothing
class Chart extends StatelessWidget {
  Chart({this.gradientColors, this.data});
  final List<Color> gradientColors;
  final data;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          horizontalInterval: 500.0,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTextStyles: (value) => const TextStyle(
                color: Color(0xff68737d),
                fontWeight: FontWeight.bold,
                fontSize: 16),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return 'MON';
                case 2:
                  return 'TUE';
                case 3:
                  return 'WED';
                case 4:
                  return 'THU';
                case 5:
                  return 'FRI';
                case 6:
                  return 'SAT';
                case 7:
                  return 'SUN';
              }
              return '';
            },
            margin: 8,
          ),
          leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xff67727d),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1000:
                  return '1k';
                case 2000:
                  return '2k';
                case 3000:
                  return '3k';
              }
              return '';
            },
            reservedSize: 28,
            margin: 12,
          ),
        ),
        borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1)),
        minX: 1,
        maxX: 7,
        minY: 1000,
        maxY: 3500,
        lineBarsData: [
          LineChartBarData(
            spots: data,
            isCurved: true,
            colors: gradientColors,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
            ),
            belowBarData: BarAreaData(
              show: true,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ],
      ),
      // showAvg ? weekly() : monthly(),
    );
  }
}