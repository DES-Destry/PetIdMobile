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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: widget.isSelected ? 0 : 10, sigmaY: widget.isSelected ? 0 : 10),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Center(
                    child: Text(widget.head,
                        style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ))),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(widget.caption ?? '',
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.05,
                        fontWeight: FontWeight.normal,
                        color: AppPalette.currentPalette.accent,
                      )))
            ]),
          ))),
    );
  }
}
