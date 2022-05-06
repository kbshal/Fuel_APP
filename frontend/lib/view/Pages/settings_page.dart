import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.03),
              child: Container(
                  height: size.height * 0.15,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SystemTheme",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(size.width * 0.03),
                            child: const Icon(
                              CupertinoIcons.moon_fill,
                              color: Colors.deepOrange,
                            ),
                          )
                        ],
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 55, 49, 49),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                             
                              height: size.height*0.15*0.5,
                              width: size.width *0.9* 0.4,
                              child: RadioListTile(
                                  activeColor:
                                      const Color.fromARGB(255, 103, 62, 0),
                                  title: const Text(
                                    "Light",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  value: 0,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value as int;
                                    });
                                  }),
                            ),
                            SizedBox(
                              
                              height: size.height*0.15*0.5,
                              width: size.width * 0.4,
                              child: RadioListTile(
                                  activeColor:
                                      const Color.fromARGB(255, 103, 62, 0),
                                  title: const Text("Dark",
                                      style: TextStyle(color: Colors.white)),
                                  value: 1,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value as int;
                                    });
                                  }),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            contactUS(size, context),
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
