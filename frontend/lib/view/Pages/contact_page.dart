import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

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
          "Contact",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: const Color.fromARGB(255, 47, 46, 65),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    );
  }
}
