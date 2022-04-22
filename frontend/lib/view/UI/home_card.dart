import 'package:flutter/material.dart';

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
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          left: size.width * 0.05,
          top: size.height * 0.2,
          child: Container(
            height: size.height * 0.3,
            width: size.width * 0.9,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              color: Colors.red,
            ),
          ),
        ),
        Positioned(
          left: size.width * 0.05,
          top: size.height * 0.2,
          child: Container(
            height: size.height * 0.05,
            width: size.width * 0.9,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              color: Colors.green,
            ),
            child: Center(child: Text(cityName)),
          ),
        )
      ],
    );
  }
}
