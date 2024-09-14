import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF020107);
  static const Color blue1 = Color(0xFF00B0FC);
  static const Color blue2 = Color(0xFF0083FC);

  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Colors.white, blue1, blue2],
  );
}
