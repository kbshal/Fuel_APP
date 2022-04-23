import 'package:flutter/material.dart';

class MyCalculator extends StatelessWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height*0.04,bottom: size.height*0.04),
      child: InkWell(
         borderRadius: BorderRadius.circular(12.0),
        onTap: (){

        },

        child: Ink(
          height:size.height*0.1 ,
          width: size.width*0.9,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12.0)

          ),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/calculator.png",
              height: size.height*0.1,
              width: size.width*0.2,),
              Text("Calculate  Rates",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ))
            ],
          ),
        ),
      ),
    );
  }
}
