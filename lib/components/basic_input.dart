import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';

class BasicInput extends StatefulWidget {
  String hint;
  TextInputType type;
  String content = '';
  double padding;

  BasicInput(
      {super.key,
      this.hint = '',
      this.type = TextInputType.text,
      this.content = '',
      this.padding = 0.0});

  @override
  State<BasicInput> createState() => _BasicInputState();
}

class _BasicInputState extends State<BasicInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: widget.padding),
      child: SizedBox(
        width: double.infinity,
        height: 46,
        child: TextField(
          textCapitalization: widget.type == TextInputType.emailAddress
              ? TextCapitalization.none
              : TextCapitalization.sentences,
          obscureText: widget.type == TextInputType.visiblePassword,
          autocorrect: widget.type != TextInputType.visiblePassword,
          style: TextStyle(
              color: AppPalette.currentPalette.accent,
              fontSize: 20,
              letterSpacing: 0.03),
          keyboardType: widget.type,
          keyboardAppearance: AppPalette.currentPalette.name == 'light'
              ? Brightness.light
              : Brightness.dark,
          decoration: InputDecoration(
            labelText: widget.hint,
            labelStyle: TextStyle(
                color: widget.content == ''
                    ? AppPalette.currentPalette.grayText
                    : AppPalette.currentPalette.accent,
                fontSize: 20,
                letterSpacing: 0.03),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppPalette.currentPalette.accent, width: 2.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppPalette.currentPalette.accent, width: 2.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppPalette.currentPalette.primary, width: 2.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: AppPalette.currentPalette.inputBackground,
          ),
          onChanged: (text) => {
            setState(() {
              widget.content = text;
            })
          },
        ),
      ),
    );
  }
}
