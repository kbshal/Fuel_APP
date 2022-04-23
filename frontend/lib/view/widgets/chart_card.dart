import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.only(top: size.height*0.02),
      child: Container(
        height:size.height*0.4 ,
        width: size.width*0.95,
        color: Colors.pink,
        
      ),
    );
  }
}