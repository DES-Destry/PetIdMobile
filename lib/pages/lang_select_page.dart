import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';
import 'package:pet_id_mobile/components/language_selector_button.dart';
import 'package:pet_id_mobile/pages/theme_select_page.dart';
import 'package:pet_id_mobile/storage/storage.dart';
import 'package:pet_id_mobile/storage/storage_item.dart';

class LangSelectPage extends StatefulWidget {
  const LangSelectPage({super.key});

  @override
  State<LangSelectPage> createState() => _LangSelectPageState();
}

class _LangSelectPageState extends State<LangSelectPage> {
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
                  textAlign: TextAlign.center,
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
              childAspectRatio: 160 / 180, // change this value for different results
              crossAxisSpacing: 18,
              mainAxisSpacing: 12,
              padding: const EdgeInsets.all(26.0),
              shrinkWrap: true,
              children: [
                LanguageSelectorButton(
                  head: 'SYS',
                  caption: "${'buttons.languageDefault'.tr()}\n${Platform.localeName.substring(0, 2).tr()}",
                  onPressed: () => {
                    setState(() {
                      language = 'sys';
                    }),
                    context.setLocale(Locale(Platform.localeName.substring(0, 2)))
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
            )),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 26),
              child: SizedBox(
                width: double.infinity,
                height: 46,
                child: TextButton(
                  onPressed: () {
                    Storage.prefs.setString(StorageItem.language, language);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ThemeSelectPage()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppPalette.currentPalette.primary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),
                  child: Text('buttons.next'.tr(),
                      style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
