import 'package:flutter/material.dart';

import 'package:fuel_prices/model/data.dart';

class PriceCard extends StatelessWidget {
  final String cityName;
  final double petrolPrice;
  final double kerosenePrice;
  final double dieselPrice;
  final double lpgPrice;
  const PriceCard(
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

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.02),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: ListDummy.list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.4,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 10.0),
          itemBuilder: (context, index) {
            DummyData data = ListDummy.list[index];
            return Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
              child: FuelPricesCard(
                fuelName: data.name,
                fuelPrice: data.price,
                icon: data.icon,
              ),
            );
          }),
    );
  }
}

class FuelPricesCard extends StatelessWidget {
  final String fuelName;
  final double fuelPrice;
  final String icon;
  const FuelPricesCard(
      {Key? key,
      required this.fuelName,
      required this.fuelPrice,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return fuelName == "LPG Gas"
        ? Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  width: size.width * 0.4,
                  height: size.height * 0.1,
                ),
                Text(
                  fuelName,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                Text(
                  "Nrs. ${fuelPrice.toString()}/Cyl",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  width: size.width * 0.4,
                  height: size.height * 0.1,
                ),
                Text(
                  fuelName,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                Text(
                  "Nrs. ${fuelPrice.toString()}/ltr",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
  }
}
