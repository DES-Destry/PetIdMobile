import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';

class ThemeSelectorButton extends StatefulWidget {
  final String head;
  final String theme;
  final String? caption;

  final VoidCallback onPressed;
  late bool isSelected;

  ThemeSelectorButton(
      {super.key,
      required this.head,
      required this.theme,
      required this.onPressed,
      this.caption,
      this.isSelected = false});

  @override
  State<ThemeSelectorButton> createState() => _ThemeSelectorButtonState();
}

class _ThemeSelectorButtonState extends State<ThemeSelectorButton> {
  @override
  Widget build(BuildContext context) {
    Color selectedBorderColor =
        widget.theme == 'light' ? AppPalette.currentPalette.sun : AppPalette.currentPalette.night;

    LinearGradient selectedBg =
        widget.theme == 'light' ? AppPalette.currentPalette.shinySun : AppPalette.currentPalette.darkNight;

    return GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 160,
          height: 180,
          decoration: BoxDecoration(
            gradient: widget.isSelected ? selectedBg : AppPalette.currentPalette.transparentGlass,
            border: Border.all(
                width: 2, color: widget.isSelected ? selectedBorderColor : AppPalette.currentPalette.primary),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 64),
                child: Center(
                    child: Text(widget.head,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: widget.isSelected ? Colors.white : AppPalette.currentPalette.primary,
                        )))),
            Visibility(
                visible: widget.isSelected,
                child: Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Center(child: Image.asset('lib/assets/images/${widget.theme}.png', width: 48, height: 48)))),
            Align(
                alignment: Alignment.bottomCenter,
                child: Text(widget.caption ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.05,
                      fontWeight: FontWeight.normal,
                      color: widget.isSelected ? Colors.white : AppPalette.currentPalette.accent,
                    )))
          ]),
        ));
  }
}
