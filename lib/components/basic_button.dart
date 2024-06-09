import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';

class BasicButton extends StatelessWidget {
  final String content;

  final VoidCallback onPressed;
  bool isSecondary;
  double padding;

  BasicButton(
      {super.key,
      required this.content,
      required this.onPressed,
      this.isSecondary = false,
      this.padding = 0.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: padding),
      child: SizedBox(
        width: double.infinity,
        height: 46,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(isSecondary
                  ? AppPalette.currentPalette.white
                  : AppPalette.currentPalette.primary),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                side: BorderSide(
                  color: AppPalette.currentPalette.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ))),
          child: Text(content,
              style: TextStyle(
                  color: isSecondary
                      ? AppPalette.currentPalette.primary
                      : AppPalette.currentPalette.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
