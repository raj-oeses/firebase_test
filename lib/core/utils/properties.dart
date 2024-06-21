import 'package:flutter/material.dart';

///-----------------------------------------------------------------------------vertical
const sizeBox5 = SizedBox(height: 5);
const sizeBox10 = SizedBox(height: 10);
const sizeBox15 = SizedBox(height: 15);
const sizeBox20 = SizedBox(height: 20);
const sizeBox30 = SizedBox(height: 30);
const sizeBox40 = SizedBox(height: 40);

///------------------------------------------------------------------------------horizontal
const widthBox5 = SizedBox(width: 5);
const widthBox10 = SizedBox(width: 10);
const widthBox15 = SizedBox(width: 15);
const widthBox20 = SizedBox(width: 20);
const widthBox30 = SizedBox(width: 30);
const widthBox40 = SizedBox(width: 40);

String pngImage(String? imageName) => 'assets/images/$imageName.png';

List<BoxShadow>? regularBoxShadow = [
  BoxShadow(
      color:  Colors.grey.withOpacity(.2),
      blurRadius: 3,
      offset: const Offset(0, 7))
];
