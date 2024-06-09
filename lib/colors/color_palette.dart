import 'package:flutter/material.dart';

abstract class ColorPalette {
  abstract final String name;

  abstract final Color primary;
  abstract final Color background;
  abstract final Color inputBackground;
  abstract final Color accent;
  abstract final Color grayText;

  final Color niceHint = const Color(0xFF696969);

  final Color black = const Color(0xFF000000);
  final Color white = const Color(0xFFFFFFFF);

  final Color sun = const Color(0xFFFFF500);
  final Color night = const Color(0xFF090842);

  final LinearGradient transparentGlass = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white.withOpacity(0.5),
      Colors.white.withOpacity(0.25),
    ],
  );

  final LinearGradient shinySun = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFF500),
      Color(0xFFE1DA2B),
    ],
  );

  final LinearGradient darkNight = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF090842),
      Color(0xFF0D0C59),
    ],
  );
}
