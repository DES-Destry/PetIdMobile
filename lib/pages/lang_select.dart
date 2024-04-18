import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';

class LangSelect extends StatefulWidget {
  const LangSelect({super.key});

  @override
  State<LangSelect> createState() => _LangSelectState();
}

class _LangSelectState extends State<LangSelect> {
  String language = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 128),
            Center(
              child: Text('Select Language', style: TextStyle(
                fontSize: 42,
                wordSpacing: -0.01,
                fontWeight: FontWeight.w800,
                color: AppPalette.currentPalette.primary,
              )),
            ),
            Center(
              child: Text('Configure your PetID, by selecting app language.\n*If you understand this, you are on the right way*', style: TextStyle(
                fontSize: 12,
                wordSpacing: -0.02,
                fontWeight: FontWeight.normal,
                color: AppPalette.currentPalette.accent
              )),
            )
          ],
        ),
      ),
    );
  }
}