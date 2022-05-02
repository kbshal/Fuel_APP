import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuel_prices/view_model/calculator/calculator_bloc.dart';
import 'package:fuel_prices/view_model/converter/string_to_int.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            enterRupees(size, context, false, "0"),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.05),
              child: Icon(
                Icons.compare_arrows_sharp,
                size: size.height * 0.04,
              ),
            ),
            quantityLitres(size, context, "0")
          ],
        );
      } else if (state is CalculatorStateChange) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            enterRupees(size, context, true),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.05),
              child: Icon(
                Icons.compare_arrows_sharp,
                size: size.height * 0.04,
              ),
            ),
            quantityLitres(size, context, state.value)
          ],
        );
      } else if (state is QuantityState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            enterRupees(size, context, false, state.value),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.05),
              child: Icon(
                Icons.compare_arrows_sharp,
                size: size.height * 0.04,
              ),
            ),
            quantityLitres(size, context)
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            enterRupees(size, context, false, "0"),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.05),
              child: Icon(
                Icons.compare_arrows_sharp,
                size: size.height * 0.04,
              ),
            ),
            quantityLitres(size, context, "0")
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
        child: isFoucesd
            ? TextFormField(
                maxLength: 7,
                keyboardType: TextInputType.number,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(PriceChange(value: value));
                },
                decoration: const InputDecoration(
                  counterText: "",
                  contentPadding:
                      EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  hintText: "0.0",
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 197, 10), width: 2.0)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                ),
              )
            : TextFormField(
                controller: txt,
                maxLength: 7,
                keyboardType: TextInputType.number,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) {
                  BlocProvider.of<CalculatorBloc>(context)
                      .add(PriceChange(value: value));
                },
                decoration: const InputDecoration(
                  counterText: "",
                  contentPadding:
                      EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  hintText: "0.0",
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 197, 10), width: 2.0)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                ),
              ),
      )
    ],
  );
}

Widget quantityLitres(Size size, BuildContext context, [String? value]) {
  var txt = TextEditingController(text: value);
  final updatedText = value;
  txt.value = txt.value.copyWith(text: updatedText);
  print(txt.value.text);

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
          // controller: txt,
          onChanged: (val) {
            BlocProvider.of<CalculatorBloc>(context)
                .add(QuantityChange(value: val));
          },
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            hintText: "0.0",
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 5.0),
            ),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 197, 10), width: 2.0)),
          ),
        ),
      )
    ],
  );
}
