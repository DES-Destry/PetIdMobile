import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';

class BasicDropdown extends StatefulWidget {
  String content;
  String label;
  List<String> variants;
  double padding;
  final ValueChanged<String> onChanged;

  BasicDropdown(
      {super.key,
      this.content = '',
      this.label = '',
      this.variants = const [],
      required this.onChanged,
      this.padding = 0.0});

  @override
  State<BasicDropdown> createState() => _BasicInputState();
}

class _BasicInputState extends State<BasicDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: widget.padding),
      child: SizedBox(
        width: double.infinity,
        height: 46,
        child: DropdownMenu(
          label: Text(
            widget.label,
            style: TextStyle(
                color: AppPalette.currentPalette.accent,
                fontSize: 20,
                letterSpacing: 0.03),
          ),
          initialSelection: widget.variants.firstOrNull,
          textStyle: TextStyle(
              color: AppPalette.currentPalette.text,
              fontSize: 20,
              letterSpacing: 0.03),
          onSelected: (value) {
            widget.onChanged(value ?? '');
          },
          dropdownMenuEntries:
              widget.variants.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
      ),
    );
  }
}
