import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';
import 'package:pet_id_mobile/components/basic_button.dart';
import 'package:pet_id_mobile/shared/paths.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Paths.getImage('login-select-cat.png'),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 128.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            Paths.getImage('main-card.png'),
                            width: 49,
                            height: 31,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'PetID',
                            style: TextStyle(
                              fontSize: 24,
                              color: AppPalette.currentPalette.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    BasicButton(content: 'register'.tr(), onPressed: () => {}),
                    const SizedBox(height: 16),
                    BasicButton(
                        content: 'login'.tr(),
                        isSecondary: true,
                        onPressed: () => {}),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
