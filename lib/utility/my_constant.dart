import 'package:flutter/material.dart';

class MyConstant {
  //field
  static Color dart = Colors.black;
  static Color active = const Color.fromARGB(255, 186, 9, 68);
  static Color bgColor = const Color.fromARGB(255, 173, 228, 62);

  //method

  BoxDecoration basicBox() {
    return BoxDecoration(color: bgColor.withOpacity(0.5));
  }

  TextStyle h1Style() {
    return TextStyle(
      color: dart,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return TextStyle(
      color: dart,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style() {
    return TextStyle(
      color: dart,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle h3ActiveStyle() {
    return TextStyle(
      color: active,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle h3WhiteStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle h3GreyStyle() {
    return const TextStyle(
      color: Colors.grey,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }
}
