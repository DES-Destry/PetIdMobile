import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';
import 'package:pet_id_mobile/pages/lang_select.dart';
import 'package:pet_id_mobile/storage/storage.dart';
import 'package:pet_id_mobile/storage/storage_item.dart';

Future loadPrefs() async {
  await Storage.init();

  var systemBrightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  Brightness theme = Storage.prefs.get(StorageItem.theme) as Brightness? ?? systemBrightness;

  if (theme == Brightness.light) AppPalette.light();
  if (theme == Brightness.dark) AppPalette.dark();
}

Widget easyLocalization(Widget startupWidget) {
  return EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ru'), Locale('kk')],
    path: 'lib/assets/translations',
    saveLocale: true,
    child: startupWidget,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await loadPrefs();

  String? localeString = Storage.prefs.getString(StorageItem.language);
  Locale startLocale;

  if (localeString == 'sys') {
    startLocale = Locale(Platform.localeName.substring(0, 2));
  } else {
    startLocale = Locale(localeString ?? 'en');
  }

  // Open Language page if user isn't set it
  if (localeString == null) {
    runApp(easyLocalization(AppLoader(initialPage: const LangSelect(), localeOnStart: startLocale)));
    return;
  }

  // Open theme page if user isn't set it

  // Open onboarding if it isn't complete yet

  // Check internet connectivity, service availability and maintain
  // Open login page accessToken is expired or not exists at all
  // Open main page if authentication was successful

  runApp(const AppLoader(initialPage: LangSelect()));
}

class AppLoader extends StatefulWidget {
  final Widget initialPage;
  final Locale? localeOnStart;

  const AppLoader({super.key, required this.initialPage, this.localeOnStart});

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetID',
      debugShowCheckedModeBanner: false,
      locale: widget.localeOnStart ?? context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: ThemeData(
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(seedColor: AppPalette.currentPalette.primary),
        scaffoldBackgroundColor: AppPalette.currentPalette.background,
        useMaterial3: true,
      ),
      home: widget.initialPage,
    );
  }
}
