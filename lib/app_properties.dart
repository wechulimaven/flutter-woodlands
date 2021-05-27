import 'package:flutter/material.dart';

const Color yellow = Color(
  // 0xffFDC054
  0xFFFF5D86
  );
const Color mediumYellow = Color(
  0xFFFFC3D2
  // 0xffFDB846
  );
const Color darkYellow = Color(
  // 0xffE99E22
  0xFFC11A55
  );
const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);
const Color darkGrey = Color(0xff202020);

const LinearGradient mainButton = LinearGradient(colors: [
  Color(0xFF6A0DAD),
  Color(0xFFC167FF),
  Color(0xFFFFC0CB),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}