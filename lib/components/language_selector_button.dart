import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';

class LanguageSelectorButton extends StatefulWidget {
  final String head;
  final String? caption;

  final VoidCallback onPressed;
  late bool isSelected;

  LanguageSelectorButton(
      {super.key, required this.head, required this.onPressed, this.caption, this.isSelected = false});

  @override
  State<LanguageSelectorButton> createState() => _LanguageSelectorButtonState();
}

class _LanguageSelectorButtonState extends State<LanguageSelectorButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 160,
          height: 180,
          decoration: BoxDecoration(
            color: widget.isSelected ? AppPalette.currentPalette.primary : null,
            gradient: !widget.isSelected ? AppPalette.currentPalette.transparentGlass : null,
            border: Border.all(width: 2, color: AppPalette.currentPalette.primary),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Center(
                    child: Text(widget.head,
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w800,
                          color: widget.isSelected ? Colors.white : AppPalette.currentPalette.primary,
                        )))),
            Align(
                alignment: Alignment.bottomCenter,
                child: Text(widget.caption ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.05,
                      fontWeight: FontWeight.normal,
                      color: widget.isSelected ? Colors.white : AppPalette.currentPalette.accent,
                    )))
          ]),
        ));
  }
}
