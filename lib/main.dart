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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadPrefs();

  String? localeString = Storage.prefs.getString(StorageItem.language);
  var currentLocale = Locale(localeString ?? 'en');

  // Open Language page if user isn't set it
  if (localeString == null) runApp(AppLoader(initialPage: const LangSelect(), initialLocale: currentLocale));

  // Open theme page if user isn't set it

  // Open onboarding if it isn't complete yet

  // Check internet connectivity, service availability and maintain
  // Open login page accessToken is expired or not exists at all
  // Open main page if authentication was successful

  runApp(AppLoader(initialPage: const LangSelect(), initialLocale: currentLocale));
}

class AppLoader extends StatefulWidget {
  final Locale initialLocale;
  final Widget initialPage;

  const AppLoader({super.key, required this.initialPage, required this.initialLocale});

  @override
  State<AppLoader> createState() => _AppLoaderState();

  // ignore: library_private_types_in_public_api
  static _AppLoaderState of(BuildContext context) => context.findAncestorStateOfType<_AppLoaderState>()!;
}

class _AppLoaderState extends State<AppLoader> {
  late Locale _locale;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    _locale = widget.initialLocale;

    return MaterialApp(
      title: 'PetID',
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: const [Locale('en'), Locale('ru'), Locale('kk')],
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
