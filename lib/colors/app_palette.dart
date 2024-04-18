import 'package:pet_id_mobile/colors/color_palette.dart';
import 'package:pet_id_mobile/colors/dark_palette.dart';
import 'package:pet_id_mobile/colors/light_palette.dart';

class AppPalette {
  static ColorPalette currentPalette = LightPalette();

  static light() {
    currentPalette = LightPalette();
  }
  static dark() {
    currentPalette = DarkPalette();
  }
}