import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/components/basic_button.dart';
import 'package:pet_id_mobile/pages/loading_screen.dart';

import '../../colors/app_palette.dart';
import '../../shared/paths.dart';

class DepressedCatPage extends StatelessWidget {
  const DepressedCatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(Paths.getImage('depressed-cat.png'),
              fit: BoxFit.cover),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 106.0, left: 32.0, right: 32.0),
              child: Container(
                height: 245,
                decoration: BoxDecoration(
                    color: AppPalette.currentPalette.background,
                    border:
                        Border.all(color: AppPalette.currentPalette.background),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 16.0),
                        Text(
                          'ooopsie.serviceUnavailable'.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.01,
                              color: AppPalette.currentPalette.primary),
                        ),
                        const SizedBox(height: 12.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Text(
                            'ooopsie.serviceUnavailableDescription'.tr(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 0.03,
                                color: AppPalette.currentPalette.grayText),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16.0, left: 32.0, right: 32.0),
                      child: BasicButton(
                          content: 'tryAgain'.tr(),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LoadingScreen()));
                          }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
