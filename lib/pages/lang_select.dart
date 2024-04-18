import 'package:flutter/material.dart';
import 'package:pet_id_mobile/core/pet_id_dark_colors.dart';

class LangSelect extends StatefulWidget {
  const LangSelect({super.key});

  @override
  State<LangSelect> createState() => _LangSelectState();
}

class _LangSelectState extends State<LangSelect> {
  String language = 'en';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 128),
            Center(
              child: Text('Select Language', style: TextStyle(
                fontSize: 42,
                wordSpacing: -0.01,
                fontWeight: FontWeight.w800,
                color: PetIdDarkColors.primary
              )),
            ),
            Center(
              child: Text('Configure your PetID, by selecting app language.\n*If you understand this, you are on the right way*', style: TextStyle(
                fontSize: 12,
                wordSpacing: -0.02,
                fontWeight: FontWeight.normal,
                color: PetIdDarkColors.accent
              )),
            )
          ],
        ),
      ),
    );
  }
}