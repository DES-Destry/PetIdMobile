import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';
import 'package:pet_id_mobile/components/theme_selector_button.dart';

class ThemeSelectPage extends StatefulWidget {
  const ThemeSelectPage({super.key});

  @override
  State<ThemeSelectPage> createState() => _ThemeSelectPageState();
}

class _ThemeSelectPageState extends State<ThemeSelectPage> {
  String theme = 'system';

  @override
  Widget build(BuildContext context) {
    var systemTheme = SchedulerBinding.instance.platformDispatcher.platformBrightness.name;
    var systemThemeCaption = '${'buttons.themeDefault'.tr()}\n${systemTheme.tr()}';

    return Scaffold(
      backgroundColor: AppPalette.currentPalette.background,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 128),
            Center(
              child: Text('selectTheme'.tr(),
                  style: TextStyle(
                    fontSize: 42,
                    letterSpacing: -0.01,
                    fontWeight: FontWeight.w800,
                    color: AppPalette.currentPalette.primary,
                  )),
            ),
            Center(
              child: Text('selectThemeCaption'.tr(),
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
              dragStartBehavior: DragStartBehavior.down,
              padding: const EdgeInsets.all(26.0),
              shrinkWrap: true,
              children: [
                ThemeSelectorButton(
                  head: 'buttons.light'.tr(),
                  theme: 'light',
                  onPressed: () => {
                    setState(() {
                      theme = 'light';
                      AppPalette.light();
                    }),
                  },
                  isSelected: theme == 'light',
                ),
                ThemeSelectorButton(
                  head: 'buttons.dark'.tr(),
                  theme: 'dark',
                  onPressed: () => {
                    setState(() {
                      theme = 'dark';
                      AppPalette.dark();
                    }),
                  },
                  isSelected: theme == 'dark',
                ),
              ],
            )),
            ThemeSelectorButton(
                  head: 'buttons.system'.tr(),
                  theme: systemTheme,
                  caption: systemThemeCaption,
                  onPressed: () => {
                    setState(() {
                      theme = 'system';

                      if (systemTheme == 'light') AppPalette.light();
                      if (systemTheme == 'dark') AppPalette.dark();
                    }),
                  },
                  isSelected: theme == 'system',
                ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 26),
              child: SizedBox(
                width: double.infinity,
                height: 46,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppPalette.currentPalette.primary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),
                  child: Text('buttons.letsgo'.tr(),
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
