import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:woodHw/components/default_button.dart';
import 'package:woodHw/screens/main/main_page.dart';

import '../../../sizeConfig.dart';
import '../../tracking_page.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var random = new Random();
    final orderNo = random.nextInt(10000);
    //   for (var i = 0; i < 10; i++) {

    //   print(random.nextInt(10000));
    // }
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Center(
          child: RichText(
            text: TextSpan(
                text: 'Your Order was Succesfull',
                style: TextStyle(color: Colors.black, fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: ' \nOrder Number ',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    // recognizer: TapGestureRecognizer()
                    // ..onTap = () {
                    //   // navigate to desired screen
                    // }
                  ),
                  TextSpan(
                      text: '$orderNo',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TrackingPage()));
                        }),
                ]),
          ),
        ),
        // Text(
        //   "Your Order was Succesfull \nOrder Number $orderNo",
        //   style: TextStyle(
        //     fontSize: getProportionateScreenWidth(30),
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black,
        //   ),
        // ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
              text: "Contiune Shopping",
              press: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MainPage()))),
        ),
        Spacer(),
      ],
    );
  }
}
