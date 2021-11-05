import 'package:dribbble_ui_design/app/combines/pie_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

List<PieChartSectionData> getSection() => PieData.data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      final value = PieChartSectionData(
        color: data.color,
        value: data.price,
      );
      return MapEntry(index, value);
    })
    .values
    .toList();
