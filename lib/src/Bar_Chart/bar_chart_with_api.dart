import 'package:chartapp/network/network_helper.dart';
import 'package:chartapp/src/Bar_Chart/bar_model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'gender_model.dart';

class BarChartAPI extends StatefulWidget {
  const BarChartAPI({Key? key}) : super(key: key);

  @override
  State<BarChartAPI> createState() => _BarChartAPIState();
}

class _BarChartAPIState extends State<BarChartAPI> {
  List<GenderModel> genders = [];
  bool loading = true;
  NetworkHelper _networkHelper = NetworkHelper();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var response = await _networkHelper.get(
        "https://api.genderize.io/?name[]=balram&name[]=deepa&name[]=saket&name[]=bhanu&name[]=aquib");
    List<GenderModel> tempdata = genderModelFromJson(response.body);
    setState(() {
      genders = tempdata;
      loading = false;
    });
  }

  List<charts.Series<GenderModel, String>> _createSampleData() {
    return [
      charts.Series<GenderModel, String>(
        data: genders,
        id: 'sales',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (GenderModel genderModel, _) => genderModel.name,
        measureFn: (GenderModel genderModel, _) => genderModel.count,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bar Chart With API"),
      ),
      body: Center(
        child: loading
            ? CircularProgressIndicator()
            : Container(
                height: 300,
                child: charts.BarChart(
                  _createSampleData(),
                  animate: true,
                ),
              ),
      ),
    );
  }
}
