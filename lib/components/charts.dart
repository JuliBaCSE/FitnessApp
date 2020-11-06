import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/Bottom_button.dart';

class Chart extends StatefulWidget {
  Chart({this.dataList});
  final List<FlSpot> dataList;

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
          SizedBox(
            height: 20,
          ),
          Text(
            "Weekly",
            style: kTitleTextStyle2,
          ),
          AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                weekly(),
                // showAvg ? weekly() : monthly(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Color(0xFFEB1555),
                onPressed: () {
                  setState(() {
                    showAvg = !showAvg;
                  });
                },
                child: Text(
                  'Monthly',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: showAvg
                          ? Colors.white.withOpacity(0.5)
                          : Colors.white),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Color(0xFFEB1555),
                onPressed: () {
                  setState(() {

                  });
                },
                child: Text(
                  'Calc Avg',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: showAvg
                          ? Colors.white.withOpacity(0.5)
                          : Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  LineChartData weekly() {
    return LineChartData(
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
          spots: widget.dataList,
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  //ToDo: make monthly data
  // LineChartData monthly() {
  //   return LineChartData(
  //     gridData: FlGridData(
  //       show: true,
  //       drawVerticalLine: true,
  //       horizontalInterval: 500.0,
  //       getDrawingHorizontalLine: (value) {
  //         return FlLine(
  //           color: const Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //       getDrawingVerticalLine: (value) {
  //         return FlLine(
  //           color: const Color(0xff37434d),
  //           strokeWidth: 1,
  //         );
  //       },
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: SideTitles(
  //         showTitles: true,
  //         reservedSize: 22,
  //         getTextStyles: (value) => const TextStyle(
  //             color: Color(0xff68737d),
  //             fontWeight: FontWeight.bold,
  //             fontSize: 16),
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 1:
  //               return 'MON';
  //             case 2:
  //               return 'TUE';
  //             case 3:
  //               return 'WED';
  //             case 4:
  //               return 'THU';
  //             case 5:
  //               return 'FRI';
  //             case 6:
  //               return 'SAT';
  //             case 7:
  //               return 'SUN';
  //           }
  //           return '';
  //         },
  //         margin: 8,
  //       ),
  //       leftTitles: SideTitles(
  //         showTitles: true,
  //         getTextStyles: (value) => const TextStyle(
  //           color: Color(0xff67727d),
  //           fontWeight: FontWeight.bold,
  //           fontSize: 15,
  //         ),
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 1000:
  //               return '1k';
  //             case 2000:
  //               return '2k';
  //             case 3000:
  //               return '3k';
  //           }
  //           return '';
  //         },
  //         reservedSize: 28,
  //         margin: 12,
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //         show: true,
  //         border: Border.all(color: const Color(0xff37434d), width: 1)),
  //     minX: 1,
  //     maxX: 7,
  //     minY: 1000,
  //     maxY: 3500,
  //     lineBarsData: [
  //       LineChartBarData(
  //         spots: widget.dataList,
  //         isCurved: true,
  //         colors: gradientColors,
  //         barWidth: 2,
  //         isStrokeCapRound: true,
  //         dotData: FlDotData(
  //           show: true,
  //         ),
  //         belowBarData: BarAreaData(
  //           show: true,
  //           colors:
  //           gradientColors.map((color) => color.withOpacity(0.3)).toList(),
  //         ),
  //       ),
  //     ],
  //   );
  // }


}
