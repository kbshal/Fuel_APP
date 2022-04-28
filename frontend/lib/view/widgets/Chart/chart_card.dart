import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fuel_prices/model/Chart/chart.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropDownValue = "Petrol";
    Size size = MediaQuery.of(context).size;
    final List<ChartData> chartData = [
      ChartData(1, 150),
      ChartData(2, 160),
      ChartData(3, 155),
      ChartData(4, 180),
      ChartData(5, 185),
      ChartData(6, 100),
      ChartData(7, 200),
      ChartData(8, 160),
    ];

    final List<String> dropDownItems = ["Petrol", "Diesel", "Kerosene", "LPG"];
    return Padding(
      padding: EdgeInsets.all(size.height * 0.02),
      child: Container(
        height: size.height * 0.5,
        width: size.width,
        decoration: BoxDecoration(
            color: const Color(0xff403b58),
            borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dropDownItem(dropDownValue, dropDownItems),
            linechart(context, chartData)
          ],
        ),
      ),
    );
  }
}

Widget linechart(BuildContext context, List<ChartData> chartData) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.only(
        right: size.width * 0.04,
        top: size.height * 0.02,
        left: size.width * 0.04),
    child: SizedBox(
      height: size.height * 0.4,
      width: size.width * 0.85,
      child: LineChart(
        LineChartData(
          minY: 90,
          maxY: 250,
          titlesData: LineTitles.getTitleData(),
          borderData: FlBorderData(
              show: true, border: Border.all(color: Colors.teal, width: 3)),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(color: Colors.teal, strokeWidth: 1);
            },
            getDrawingVerticalLine: (value) {
              return FlLine(color: Colors.teal, strokeWidth: 1);
            },
          ),
          lineBarsData: [
            LineChartBarData(
              spots: chartData
                  .map((value) =>
                      FlSpot(value.day.toDouble(), value.price.toDouble()))
                  .toList(),
              isCurved: true,
              color: Colors.white,
              barWidth: 3,
              dotData: FlDotData(
                show: true,
              ),
            )
          ],
        ),
        swapAnimationDuration: const Duration(milliseconds: 500),
        swapAnimationCurve: Curves.linear,
      ),
    ),
  );
}

Widget dropDownItem(String dropDownValue, List<String> dropDownItems) {
  return Padding(
    padding: const EdgeInsets.only(left: 12.0),
    child: DropdownButton(
        iconEnabledColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        dropdownColor: const Color.fromARGB(255, 47, 46, 65),
        borderRadius: BorderRadius.circular(12.0),
        elevation: 10,
        value: dropDownValue,
        items: dropDownItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            child: Text(value),
            value: value,
          );
        }).toList(),
        onChanged: (value) => {}),
  );
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30.0,
            getTitlesWidget: (value, meta) {
              return Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Text(
                  value.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50.0,
            getTitlesWidget: (value, meta) {
              return Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Text(
                  value.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ),
        topTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: false,
        )),
        rightTitles: AxisTitles(
            axisNameSize: 12.0,
            sideTitles: SideTitles(
              showTitles: false,
            )),
      );
}
