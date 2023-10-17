import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// List<SalesData>? _chartData;
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    ///  _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1924, 400),
      ChartData(1925, 410),
      ChartData(1926, 405),
      ChartData(1927, 410),
      ChartData(1928, 350),
      ChartData(1929, 370),
      ChartData(1930, 500),
      ChartData(1931, 390),
      ChartData(1932, 450),
      ChartData(1933, 440),
      ChartData(1934, 350),
      ChartData(1935, 370),
      ChartData(1936, 480),
      ChartData(1937, 410),
      ChartData(1938, 530),
      ChartData(1939, 520),
      ChartData(1940, 390),
      ChartData(1941, 360),
      ChartData(1942, 405),
      ChartData(1943, 400),
    ];
    final List<Color> color = <Color>[];
    color.add(Colors.blue[50]!);
    color.add(Colors.blue[200]!);
    color.add(Colors.blue);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);
    return SafeArea(
        child: Scaffold(
            body: ListView(
      children: [
        // Container(
        //   height: 300,
        //   child: SfCartesianChart(
        //     title: ChartTitle(text: 'Yearly sales analysis'),
        //     legend: Legend(isVisible: true),
        //     tooltipBehavior: _tooltipBehavior,
        //     series: <ChartSeries>[
        //       AreaSeries<SalesData, double>(
        //           name: 'Sales',
        //           dataSource: _chartData!,
        //           xValueMapper: (SalesData sales, _) => sales.year,
        //           yValueMapper: (SalesData sales, _) => sales.sales,
        //           dataLabelSettings: DataLabelSettings(isVisible: true),
        //           enableTooltip: true)
        //     ],
        //     primaryXAxis: NumericAxis(
        //       edgeLabelPlacement: EdgeLabelPlacement.shift,
        //     ),
        //     primaryYAxis: NumericAxis(
        //         labelFormat: '{value}M',
        //         numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
        //   ),
        // ),
        // Container(
        //     height: 300,
        //     child: SfCartesianChart(
        //         primaryYAxis: NumericAxis(labelFormat: '{value}mm'),
        //         series: <ChartSeries>[
        //         // Renders area chart
        //         AreaSeries<ChartData, int>(
        //     dataSource: chartData,
        //     xValueMapper: (ChartData data, _) => data.x,
        //     yValueMapper: (ChartData data, _) => data.y,
        //     gradient: gradientColors
        //     )
        //         ]
        //     )
        // ),
        Container(
            height: 300,
            child: SfCartesianChart(series: <ChartSeries>[
              SplineAreaSeries<ChartData, int>(
                  dataSource: chartData,
                  splineType: SplineType.cardinal,
                  cardinalSplineTension: 0.9,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  gradient: gradientColors)
            ]))
      ],
    )));
  }

// List<SalesData> getChartData() {
//   final List<SalesData> chartData = [
//     SalesData(2017, 25),
//     SalesData(2018, 12),
//     SalesData(2019, 24),
//     SalesData(2020, 18),
//     SalesData(2021, 30)
//   ];
//   return chartData;
// }
}

class ChartData {
  ChartData(this.x, this.y);

  final int x;
  final double y;
}
// class SalesData {
//   SalesData(this.year, this.sales);
//   final double year;
//   final double sales;
// }
///
///
///
// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'package:fl_chart/fl_chart.dart';
//
//
//
//
// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key}) : super(key: key);
//
//   // Generate some dummy data for the cahrt
//   // This will be used to draw the red line
//
//   // This will be used to draw the orange line
//
//   // This will be used to draw the blue line
//   final List<FlSpot> dummyData3 = List.generate(8, (index) {
//     return FlSpot(index.toDouble(), index * Random().nextDouble());
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           width: double.infinity,
//           height: 300,
//           child: LineChart(
//             LineChartData(borderData: FlBorderData(show: false), lineBarsData: [
//               LineChartBarData(spots: [
//                 const FlSpot(0, 1),
//                 const FlSpot(1, 3),
//                 const FlSpot(2, 10),
//                 const FlSpot(3, 7),
//                 const FlSpot(4, 12),
//                 const FlSpot(5, 13),
//                 const FlSpot(6, 17),
//                 const FlSpot(7, 15),
//                 const FlSpot(8, 20)
//               ])
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
