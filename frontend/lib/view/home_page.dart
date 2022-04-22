import 'package:flutter/material.dart';
import 'UI/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const Text("Fuel Prices"),
          backgroundColor: const Color.fromARGB(255, 12, 146, 0),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.sort,
                size: 35,
              ),
            );
          })),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const HomeCard(
            cityName: "Kathmandu",
            petrolPrice: 160,
            kerosenePrice: 140,
            dieselPrice: 143,
            lpgPrice: 1600),
      ),
      drawer: const Drawer(),
    );
  }
}
