import 'package:flutter/material.dart';
import 'package:fuel_prices/model/Chart/chart.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropDownValue = "Petrol";
    Size size = MediaQuery.of(context).size;
    final List<ChartData> charData = [
      ChartData(1, 150),
      ChartData(2, 160),
      ChartData(3, 155),
      ChartData(4, 180),
      ChartData(5, 185),
      ChartData(6, 100)
    ];

    final List<String> dropDownItems = ["Petrol", "Diesel", "Kerosene", "LPG"];
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.02),
      child: Container(
        height: size.height * 0.5,
        width: size.width * 0.95,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [dropDownItem(dropDownValue, dropDownItems)],
        ),
      ),
    );
  }
}

Widget dropDownItem(String dropDownValue, List<String> dropDownItems) {
  return DropdownButton(
      value: dropDownValue,
      items: dropDownItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          child: Text(value),
          value: value,
        );
      }).toList(),
      onChanged: (value) => {});
}
