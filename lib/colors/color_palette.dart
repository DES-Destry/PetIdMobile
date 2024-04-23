import 'dart:ui';

import 'package:flutter/material.dart';

abstract class ColorPalette {
  abstract final Color primary;
  abstract final Color background;
  abstract final Color accent;

  abstract final LinearGradient transparentGlass;
}