import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/components/basic_button.dart';
import 'package:pet_id_mobile/components/pet_id_title.dart';
import 'package:pet_id_mobile/shared/paths.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Paths.getImage('login-select-cat.png'),
                fit: BoxFit.cover),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 128.0),
                child: Column(
                  children: [
                    const PetIdTitle(),
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
