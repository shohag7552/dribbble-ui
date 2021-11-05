import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: PieChart(
            dataMap: dataMap,
            animationDuration: Duration(milliseconds: 800),
            // chartLegendSpacing: 75,
            chartRadius: MediaQuery.of(context).size.width / 2.2,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 50,

            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: false,
              showChartValuesInPercentage: true,
              showChartValuesOutside: true,
              decimalPlaces: 1,
            ),
            // legendOptions: LegendOptions(
            //   showLegendsInRow: false,
            //   legendPosition: LegendPosition.left,
            //   showLegends: true,
            //   // legendShape: _BoxShape.circle,
            //   legendTextStyle: TextStyle(
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
