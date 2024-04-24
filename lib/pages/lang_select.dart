import 'package:easy_localization/easy_localization.dart';
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

  String getLocaleFriendlyName(String locale) {
    if (locale.startsWith('en')) return 'English';
    if (locale.startsWith('ru')) return 'Russian';
    if (locale.startsWith('kk')) return 'Kazakh';

    return 'Unknown\nEnglish will be used';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 128),
            Center(
              child: Text('selectLanguage'.tr(),
                  style: TextStyle(
                    fontSize: 42,
                    letterSpacing: -0.01,
                    fontWeight: FontWeight.w800,
                    color: AppPalette.currentPalette.primary,
                  )),
            ),
            Center(
              child: Text('selectLanguageCaption'.tr(),
                  style: TextStyle(
                      fontSize: 12,
                      letterSpacing: -0.02,
                      fontWeight: FontWeight.normal,
                      color: AppPalette.currentPalette.accent)),
            ),
            const SizedBox(height: 64),
            Flexible(
                child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.9, // change this value for different results
              crossAxisSpacing: 18,
              mainAxisSpacing: 12,
              padding: const EdgeInsets.all(10.0),
              children: [
                LanguageSelectorButton(
                  head: 'SYS',
                  caption: 'System default:\n${getLocaleFriendlyName(Localizations.localeOf(context).toString())}',
                  onPressed: () => {
                    setState(() {
                      language = 'sys';
                    }),
                    context.setLocale(Localizations.localeOf(context))
                  },
                  isSelected: language == 'sys',
                ),
                LanguageSelectorButton(
                  head: 'EN',
                  caption: 'Hello!',
                  onPressed: () => {
                    setState(() {
                      language = 'en';
                    }),
                    context.setLocale(const Locale('en')),
                  },
                  isSelected: language == 'en',
                ),
                LanguageSelectorButton(
                  head: 'KK',
                  caption: 'Салем!',
                  onPressed: () => {
                    setState(() {
                      language = 'kk';
                    }),
                    context.setLocale(const Locale('kk'))
                  },
                  isSelected: language == 'kk',
                ),
                LanguageSelectorButton(
                  head: 'RU',
                  caption: 'Привет!',
                  onPressed: () => {
                    setState(() {
                      language = 'ru';
                    }),
                    context.setLocale(const Locale('ru'))
                  },
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
