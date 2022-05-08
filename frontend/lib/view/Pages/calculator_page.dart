import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuel_prices/view_model/calculator/calculator_bloc.dart';
import 'package:fuel_prices/view_model/converter/string_to_int.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> list = ["Petrol", "Diesel", "Kerosene"];
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
          "Fuel Calculator",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: const Color.fromARGB(255, 47, 46, 65),
      ),
      body: BlocProvider(
        create: (context) => CalculatorBloc(stringConverter: StringConverter),
        child: Column(
          children: [
            company(size, context),
            fuelDropDown(size, context, list),
            textField(size, context)
          ],
        ),
      ),
    );
  }
}

//Nepal Oil Corporation Widget
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

//Fuel choices
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
                  style: Theme.of(context).textTheme.titleLarge,
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

//Conversion
Widget textField(Size size, BuildContext context) {
  return BlocBuilder<CalculatorBloc, CalculatorState>(
    builder: (context, state) {
      if (state is CalculatorInitial) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            enterRupees(size, context, true, "0"),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.01, left: size.width * 0.2),
              child: Transform(
                transform: Matrix4.identity()..rotateZ(math.pi / 2),
                child: Icon(
                  Icons.compare_arrows_outlined,
                  size: size.height * 0.04,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
            quantityLitres(size, context, true, "0")
          ],
        );
      } else if (state is CalculatorStateChange) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            enterRupees(size, context, true),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.01, left: size.width * 0.2),
              child: Transform(
                transform: Matrix4.identity()..rotateZ(math.pi / 2),
                child: Icon(
                  Icons.compare_arrows_sharp,
                  size: size.height * 0.04,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
            quantityLitres(size, context, false, state.value)
          ],
        );
      } else if (state is QuantityState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            enterRupees(size, context, false, state.value),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.01, left: size.width * 0.2),
              child: Transform(
                transform: Matrix4.identity()..rotateZ(math.pi / 2),
                child: Icon(
                  Icons.compare_arrows_sharp,
                  size: size.height * 0.04,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
            quantityLitres(size, context, true)
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            enterRupees(size, context, true, "0"),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.01, left: size.width * 0.2),
              child: Transform(
                transform: Matrix4.identity()..rotateZ(math.pi / 2),
                child: Icon(
                  Icons.compare_arrows_sharp,
                  size: size.height * 0.04,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
            quantityLitres(size, context, false, "0")
          ],
        );
      }
    },
  );
}

Widget enterRupees(Size size, BuildContext context, bool isFoucesd,
    [String? value]) {
  var txt = TextEditingController(text: value);
  final updatedText = value;
  txt.value = txt.value.copyWith(text: updatedText);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(top: size.height * 0.02),
        child: Text(
          "(NPR)",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: const Color.fromARGB(255, 0, 197, 10),
              fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: size.height * 0.01),
        width: size.width * 0.9,
        height: size.height * 0.06,
        child: isFoucesd
            ? TextFormField(
                style: Theme.of(context).textTheme.bodyLarge,
                inputFormatters: [
                  //regular expression to allow only one decimal point
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                ],
                keyboardType: TextInputType.number,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(PriceChange(value: value));
                },
                decoration: InputDecoration(
                  counterText: "",
                  contentPadding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  hintText: "0.0",
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 197, 10), width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColorLight, width: 2.0),
                  ),
                ),
              )
            : TextFormField(
                controller: txt,
                style: Theme.of(context).textTheme.bodyLarge,
                keyboardType: TextInputType.number,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(PriceChange(value: value));
                },
                decoration: InputDecoration(
                  counterText: "",
                  contentPadding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  hintText: "0.0",
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).cardColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColorLight, width: 2.0),
                  ),
                ),
              ),
      )
    ],
  );
}

Widget quantityLitres(Size size, BuildContext context, bool isFouced,
    [String? value]) {
  var txt = TextEditingController(text: value);
  final updatedText = value;
  txt.value = txt.value.copyWith(text: updatedText);

  return isFouced
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.02),
              child: Text(
                "Quantity(litres)",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color.fromARGB(255, 0, 197, 10),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.01),
              width: size.width * 0.9,
              height: size.height * 0.06,
              child: TextFormField(
                style: Theme.of(context).textTheme.bodyLarge,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                ],
                onChanged: (val) {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(QuantityChange(value: val));
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  contentPadding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  hintText: "0.0",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 197, 10), width: 2.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                          width: 2.0)),
                ),
              ),
            )
          ],
        )
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.02),
              child: Text(
                "Quantity(litres)",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color.fromARGB(255, 0, 197, 10),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.01),
              width: size.width * 0.9,
              height: size.height * 0.06,
              child: TextFormField(
                style: Theme.of(context).textTheme.bodyLarge,
                controller: txt,
                onChanged: (val) {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(QuantityChange(value: val));
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  hintText: "0.0",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                          width: 2.0)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 197, 10), width: 2.0),
                  ),
                ),
              ),
            )
          ],
        );
}
