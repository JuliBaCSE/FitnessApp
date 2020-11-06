import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/Bottom_button.dart';

class Chart extends StatefulWidget {
  Chart({this.dataList});
  List <FlSpot> dataList;
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;
  final Color colour = kContainerColor;
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      colour: kContainerColor,
      cardChild: Column(

        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color:  Color(0xFFEB1555),
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'Avg',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: showAvg ? Colors.white.withOpacity(0.5) : Colors
                      .white),
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
    LineChartData mainData() {
      return LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
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
            getTextStyles: (value) =>
            const TextStyle(color: Color(0xff68737d),
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
            getTextStyles: (value) =>
            const TextStyle(
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
        borderData:
        FlBorderData(show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1)),
        minX: 0,
        maxX: 8,
        minY: 0,
        maxY: 4000,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(1, 3000),
              FlSpot(2, 2000),
              FlSpot(3, 3000),
              FlSpot(4, 2500),
              FlSpot(5, 3000),
              FlSpot(6, 2600),
            ],
            isCurved: true,
            colors: gradientColors,
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              colors: gradientColors.map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ],
      );
    }

    LineChartData avgData() {
      return LineChartData(
        lineTouchData: LineTouchData(enabled: false),
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          getDrawingHorizontalLine: (value) {
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
            getTextStyles: (value) =>
            const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
            getTitles: (value) {
              switch (value.toInt()) {
                case 2:
                  return 'MAR';
                case 5:
                  return 'JUN';
                case 8:
                  return 'SEP';
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
                case 1:
                  return '10k';
                case 3:
                  return '30k';
                case 5:
                  return '50k';
              }
              return '';
            },
            reservedSize: 28,
            margin: 12,
          ),
        ),
        borderData:
        FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3.44),
              FlSpot(2.6, 3.44),
              FlSpot(4.9, 3.44),
              FlSpot(6.8, 3.44),
              FlSpot(8, 3.44),
              FlSpot(9.5, 3.44),
              FlSpot(11, 3.44),
            ],
            isCurved: true,
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
              ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
            ],
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(show: true, colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
              ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
            ]),
          ),
        ],
      );
  }
}

