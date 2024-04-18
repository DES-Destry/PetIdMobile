import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';
import 'package:pet_id_mobile/pages/lang_select.dart';
import 'package:pet_id_mobile/storage/storage.dart';
import 'package:pet_id_mobile/storage/storage_item.dart';

void main() {
  runApp(const AppLoader());
}

class AppLoader extends StatefulWidget {
  const AppLoader({super.key});

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  bool prefsLoaded = false;

  Future loadPrefs() async {
    await Storage.init();

    var systemBrightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    Brightness theme = Storage.prefs.get(StorageItem.theme) as Brightness? ?? systemBrightness;

    if (theme == Brightness.light) AppPalette.light();
    if (theme == Brightness.dark) AppPalette.dark();

    prefsLoaded = true;
  }

  @override
  void initState() {
    super.initState();
    loadPrefs();
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetID',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(seedColor: AppPalette.currentPalette.primary),
        scaffoldBackgroundColor: AppPalette.currentPalette.background,
        useMaterial3: true,
      ),
      home: const LangSelect(),
    );
  }
}
