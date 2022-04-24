import 'package:flutter/material.dart';
import 'package:fuel_prices/view/widgets/calculator.dart';
import 'package:fuel_prices/view/widgets/Chart/chart_card.dart';
import 'package:fuel_prices/view/widgets/price_card.dart';

class HomeCard extends StatelessWidget {
  final String cityName;
  final double petrolPrice;
  final double kerosenePrice;
  final double dieselPrice;
  final double lpgPrice;
  const HomeCard(
      {Key? key,
      required this.cityName,
      required this.petrolPrice,
      required this.kerosenePrice,
      required this.dieselPrice,
      required this.lpgPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      
        children: [
          const ChartCard(),
          PriceCard(
            cityName: cityName,
            petrolPrice: petrolPrice,
            dieselPrice: dieselPrice,
            lpgPrice: lpgPrice,
            kerosenePrice: kerosenePrice,
          ),
         const MyCalculator()
    
        ],
      ),
    );
  }
}
