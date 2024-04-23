import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';
import 'package:pet_id_mobile/components/language_selector_button.dart';

class LangSelect extends StatefulWidget {
  const LangSelect({super.key});

  @override
  State<LangSelect> createState() => _LangSelectState();
}

class _LangSelectState extends State<LangSelect> {
  String language = 'sys';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 128),
            Center(
              child: Text('Select Language',
                  style: TextStyle(
                    fontSize: 42,
                    letterSpacing: -0.01,
                    fontWeight: FontWeight.w800,
                    color: AppPalette.currentPalette.primary,
                  )),
            ),
            Center(
              child: Text(
                  'Configure your PetID, by selecting app language.\n*If you understand this, you are on the right way*',
                  style: TextStyle(
                      fontSize: 12,
                      letterSpacing: -0.02,
                      fontWeight: FontWeight.normal,
                      color: AppPalette.currentPalette.accent)),
            ),
            const SizedBox(height: 64),
            Flexible(
                child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.8, // change this value for different results
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              padding: const EdgeInsets.all(10.0),
              children: [
                LanguageSelectorButton(
                  head: 'SYS',
                  caption: 'System default:\n',
                  onPressed: () => {language = 'sys'},
                  isSelected: language == 'sys',
                ),
                LanguageSelectorButton(
                  head: 'EN',
                  caption: 'Hello!',
                  onPressed: () => {language = 'en'},
                  isSelected: language == 'en',
                ),
                LanguageSelectorButton(
                  head: 'KK',
                  caption: 'Салем!',
                  onPressed: () => {language = 'kk'},
                  isSelected: language == 'kk',
                ),
                LanguageSelectorButton(
                  head: 'RU',
                  caption: 'Привет!',
                  onPressed: () => {language = 'ru'},
                  isSelected: language == 'ru',
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
