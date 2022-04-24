import 'package:flutter/material.dart';
import 'widgets/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Fuel Prices",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 47, 46, 65),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.sort,
                size: 35,
              ),
            );
          },
        ),
      ),
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
