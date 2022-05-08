import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_prices/view/Pages/contact_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String txt = "pra";
  int? groupValue = -1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            borderRadius: BorderRadius.circular(50.0),
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(CupertinoIcons.back)),
        title: Text(
          "Settings",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactPage()));
                },
                child: contactUS(size, context)),
            aboutUS(size, context),
            moreApps(size, context)
          ],
        ),
      ),
    );
  }
}

//Contact US Widget
Widget contactUS(Size size, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: size.height * 0.03),
    height: size.height * 0.08,
    width: size.width * 0.9,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Theme.of(context).cardColor,
      // boxShadow: [
      //   BoxShadow(
      //       color: Theme.of(context).shadowColor,
      //       offset: const Offset(4.5, 6.0),
      //       blurRadius: 4.0,
      //       spreadRadius: 0.0)
      // ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Contact Us",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontSize: size.height * 0.03,
              ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.06),
          child: Icon(
            CupertinoIcons.forward,
            color: Colors.white,
            size: size.height * 0.03,
          ),
        )
      ],
    ),
  );
}

//About Us Widget
Widget aboutUS(Size size, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: size.height * 0.03),
    height: size.height * 0.08,
    width: size.width * 0.9,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Theme.of(context).cardColor,
      // boxShadow: [
      //   BoxShadow(
      //       color: Theme.of(context).shadowColor,
      //       offset: const Offset(4.5, 6.0),
      //       blurRadius: 4.0,
      //       spreadRadius: 0.0)
      // ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "About",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontSize: size.height * 0.03,
              ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.06),
          child: Icon(
            CupertinoIcons.forward,
            color: Colors.white,
            size: size.height * 0.03,
          ),
        )
      ],
    ),
  );
}

//Terms and Agreements Widget
Widget moreApps(Size size, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: size.height * 0.03),
    height: size.height * 0.08,
    width: size.width * 0.9,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Theme.of(context).cardColor,
      // boxShadow: [
      //   BoxShadow(
      //       color: Theme.of(context).shadowColor,
      //       offset: const Offset(4.5, 6.0),
      //       blurRadius: 4.0,
      //       spreadRadius: 0.0)
      // ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Terms & Agreements",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontSize: size.height * 0.03,
              ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.06),
          child: Icon(
            CupertinoIcons.forward,
            color: Colors.white,
            size: size.height * 0.03,
          ),
        )
      ],
    ),
  );
}
