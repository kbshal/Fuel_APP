import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> list = ["Petrol", "Diesel", "Kerosene", "LPG"];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Fuel Calculator",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 47, 46, 65),
      ),
      body: Column(
        children: [
          company(size, context),
          fuelDropDown(size, context, list),
          textField(size, context)
        ],
      ),
    );
  }
}

Widget company(Size size, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin:
            EdgeInsets.only(top: size.height * 0.02, left: size.width * 0.06),
        child: Text(
          "Company",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: const Color.fromARGB(255, 0, 197, 10),
              fontWeight: FontWeight.bold),
        ),
      ),
      Container(
          margin: EdgeInsets.only(
              top: size.height * 0.015, left: size.width * 0.06),
          child: Text(
            "Nepal Oil Corporation(NOC)",
            style: Theme.of(context).textTheme.titleLarge,
          )),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        child: const Divider(
          height: 1,
          thickness: 2,
          color: Color.fromARGB(255, 0, 197, 10),
        ),
      )
    ],
  );
}

Widget fuelDropDown(Size size, BuildContext context, List<String> list) {
  String defaultValue = list[0];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin:
            EdgeInsets.only(top: size.height * 0.02, left: size.width * 0.06),
        child: Text(
          "Oil",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: const Color.fromARGB(255, 0, 197, 10),
              fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.015, left: size.width * 0.06),
              child: Text(
                defaultValue,
                style: Theme.of(context).textTheme.titleLarge,
              )),
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.1),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  items: list.map((data) {
                    return DropdownMenuItem(value: data, child: Text(data));
                  }).toList(),
                  onChanged: (value) {}),
            ),
          )
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        child: const Divider(
          height: 1,
          thickness: 2,
          color: Color.fromARGB(255, 0, 197, 10),
        ),
      )
    ],
  );
}

Widget textField(Size size, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [enterRupees(size, context),
   Padding(
     padding: EdgeInsets.only(top: size.height*0.05),
     child: Icon(Icons.compare_arrows_sharp,
     size: size.height*0.04,),
   )
    , quantityLitres(size, context)],
  );
}

Widget enterRupees(Size size, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin:
            EdgeInsets.only(top: size.height * 0.02, left: size.width * 0.06),
        child: Text(
          "(NPR)",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: const Color.fromARGB(255, 0, 197, 10),
              fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        margin:
            EdgeInsets.only(left: size.width * 0.06, top: size.height * 0.01),
        width: size.width * 0.25,
        height: size.height * 0.06,
        child: TextFormField(
          keyboardType: TextInputType.number,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
              hintText: "0.0",
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 197, 10), width: 2.0)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0))),
        ),
      )
    ],
  );
}

Widget quantityLitres(Size size, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin:
            EdgeInsets.only(top: size.height * 0.02, right: size.width * 0.06),
        child: Text(
          "Quantity(litres)",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: const Color.fromARGB(255, 0, 197, 10),
              fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        margin:
            EdgeInsets.only(right: size.width * 0.06, top: size.height * 0.01),
        width: size.width * 0.25,
        height: size.height * 0.06,
        child: TextFormField(
          keyboardType: TextInputType.number,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
              hintText: "0.0",
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 197, 10), width: 2.0)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0))),
        ),
      )
    ],
  );
}
