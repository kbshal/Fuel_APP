import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/home_card.dart';

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
      drawer: const DrawerPage(),
    );
  }
}

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      semanticLabel: "1.1",
      backgroundColor: const Color.fromARGB(255, 47, 46, 65),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              // margin: EdgeInsets.only(top: size.height*0.2),
              width: size.width,
              color: const Color.fromARGB(255, 0, 219, 117),
              height: size.height * 0.18,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.01, bottom: size.width * 0.04),
                    child: Image.asset(
                      "assets/station.png",
                      height: size.height * 0.06,
                      width: size.width * 0.2,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.01, bottom: size.width * 0.04),
                    child: Text(
                      "Nepal Fuel App",
                      style: TextStyle(
                          fontSize: size.height * 0.03,
                          color: Colors.white,
                          fontFamily: GoogleFonts.aBeeZee().fontFamily),
                    ),
                  ),
                ],
              ),
            ),
            drawerItem(size, context, Icons.home, "Home"),
            drawerItem(size, context, Icons.calculate, "Calculator"),
            drawerItem(size, context, Icons.code, "Contributor"),
            drawerItem(size, context, Icons.settings, "Settings"),
            versionApp(context, size)
          ],
        ),
      ),
    );
  }
}

Widget drawerItem(
    Size size, BuildContext context, IconData iconData, String text) {
  return Padding(
    padding: EdgeInsets.only(top: size.height * 0.03),
    child: InkWell(
      onTap: () {},
      child: ListTile(
        leading: Icon(
          iconData,
          size: size.height * 0.04,
          color: Colors.white,
        ),
        title: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
              fontFamily: GoogleFonts.aBeeZee().fontFamily),
        ),
      ),
    ),
  );
}

Widget versionApp(BuildContext context, Size size) {
  return Padding(
    padding: EdgeInsets.only(top: size.height * 0.3),
    child: SizedBox(
      child: Center(
        child: Text(
          "v.1.0.0",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
              fontFamily: GoogleFonts.aBeeZee().fontFamily),
        ),
      ),
    ),
  );
}
