import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/components/basic_button.dart';

import '../colors/app_palette.dart';

class PetCreateConfirmationPage extends StatelessWidget {
  final int tagId;

  String _formatId(int id) {
    final converted = id.toString();
    if (converted.length < 4) {
      return 'ID${'0' * (4 - converted.length)}$converted';
    }

    return 'ID$converted';
  }

  const PetCreateConfirmationPage({super.key, required this.tagId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.currentPalette.background,
      appBar: AppBar(
        backgroundColor: AppPalette.currentPalette.primary,
        foregroundColor: AppPalette.currentPalette.white,
        title: Text('newPet'.tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.03)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 140.0),
          Text(
            _formatId(tagId),
            style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.03,
                color: AppPalette.currentPalette.primary),
          ),
          const SizedBox(height: 12.0),
          Text(
            'isItYours'.tr(),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                letterSpacing: 0.03,
                color: AppPalette.currentPalette.text),
          ),
          Text(
            'returnIt'.tr(),
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                letterSpacing: 0.03,
                color: AppPalette.currentPalette.grayText),
          ),
          const SizedBox(height: 64.0),
          BasicButton(content: 'buttons.confirm'.tr(), onPressed: () {})
        ],
      ),
    );
  }
}
