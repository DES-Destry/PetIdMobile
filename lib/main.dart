import 'package:flutter/material.dart';
import 'package:pet_id_mobile/core/pet_id_dark_colors.dart';
import 'package:pet_id_mobile/core/pet_id_light_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const AppLoader());
}

class AppLoader extends StatefulWidget {
  const AppLoader({super.key});

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetID',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(seedColor: PetIdLightColors.primary),
        scaffoldBackgroundColor: PetIdLightColors.background,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(seedColor: PetIdDarkColors.primary),
        scaffoldBackgroundColor: PetIdDarkColors.background,
        useMaterial3: true,
      ),
    );
  }

  void loadAppFromLastState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }
}
