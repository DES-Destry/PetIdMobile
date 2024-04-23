import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/color_palette.dart';

class LightPalette extends ColorPalette {
  @override
  final Color primary = const Color(0xFF1DE24A);
  
  @override
  final Color background = const Color(0xFFFFFFFF);

  @override
  final Color accent = const Color(0xFF828282);

  @override
  final LinearGradient transparentGlass = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white.withOpacity(0.5),
      Colors.white.withOpacity(0.25),
    ],
  );
}