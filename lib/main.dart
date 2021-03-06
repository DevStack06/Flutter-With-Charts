import 'package:chartapp/src/Bar_Chart/bar_chart.dart';
import 'package:chartapp/src/Bar_Chart/bar_chart_with_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BarChartAPI(),
    );
  }
}
