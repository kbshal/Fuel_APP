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
        decoration: BoxDecoration(color: Theme.of(context).canvasColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: size.height * 0.15,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Theme.of(context).cardColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SystemTheme",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Colors.red,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width*0.4,
                            child: RadioListTile(
                              activeColor:Colors.green ,
                              title:const Text("Light",
                              style: TextStyle(
                                color: Colors.white
                              ),),
                                value: 0,
                                groupValue: groupValue,
                                onChanged: (value) {
                                  setState(() {
                                    groupValue = value as int;
                                  });
                                }),
                          ),
                            SizedBox(
                              width: size.width*0.4,
                              child: RadioListTile(
                                activeColor: Colors.green,
                              title:const Text("Dark",
                               style: TextStyle(
                                color: Colors.white
                              )),
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
                ))
          ],
        ),
      ),
    );
  }
}
