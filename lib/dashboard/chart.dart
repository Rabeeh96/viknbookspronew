import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';




class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  // Generate some dummy data for the cahrt
  // This will be used to draw the red line

  // This will be used to draw the orange line

  // This will be used to draw the blue line
  final List<FlSpot> dummyData3 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: 300,
          child: LineChart(
            LineChartData(borderData: FlBorderData(show: false), lineBarsData: [
              LineChartBarData(spots: [
                const FlSpot(0, 1),
                const FlSpot(1, 3),
                const FlSpot(2, 10),
                const FlSpot(3, 7),
                const FlSpot(4, 12),
                const FlSpot(5, 13),
                const FlSpot(6, 17),
                const FlSpot(7, 15),
                const FlSpot(8, 20)
              ])
            ]),
          ),
        ),
      ),
    );
  }
}