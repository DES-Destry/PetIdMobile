import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/color_palette.dart';

class DarkPalette extends ColorPalette {
  @override
  final String name = 'dark';

  @override
  final Color primary = const Color(0xFF1DE24A);

  @override
  final Color background = const Color(0xFF333333);
  @override
  final Color inputBackground = const Color(0xFF444444);

  @override
  final Color accent = const Color(0xFFFFFFFF);

  @override
  final Color text = const Color(0xFFFFFFFF);
  @override
  final Color grayText = const Color(0xFFADADAD);
}
