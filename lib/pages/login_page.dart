import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/api/dto/requests/login_request.dto.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';
import 'package:pet_id_mobile/components/basic_button.dart';
import 'package:pet_id_mobile/components/basic_input.dart';
import 'package:pet_id_mobile/components/pet_id_title.dart';
import 'package:pet_id_mobile/pages/auth_page.dart';

import '../api/owner_controller.dart';
import '../shared/paths.dart';
import '../storage/storage.dart';
import '../storage/storage_item.dart';
import 'ooopsie/depressed_cat_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final OwnerController ownerController = OwnerController();

  String email = '';
  String password = '';

  _login() async {
    try {
      final tokens = await ownerController
          .login(LoginRequestDto(email: email, password: password));

      Storage.prefs.setString(StorageItem.accessToken, tokens.accessToken);
    } catch (e) {
      print(e.toString());
      _openDepressedCat();
      return;
    }

    _openHome();
  }

  void _openHome() {}

  void _openDepressedCat() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DepressedCatPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child:
                Image.asset(Paths.getImage('login-cat.png'), fit: BoxFit.cover),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.0),
                child: PetIdTitle(),
              ),
              const SizedBox(height: 12.0),
              Container(
                decoration: BoxDecoration(
                    color: AppPalette.currentPalette.background,
                    border:
                        Border.all(color: AppPalette.currentPalette.background),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 84.0, left: 26.0, right: 26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16.0),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AuthPage()));
                          },
                          iconSize: 24.0,
                          icon: Icon(Icons.arrow_back_ios,
                              color: AppPalette.currentPalette.accent)),
                      const SizedBox(height: 24.0),
                      Text('welcomeBack'.tr(),
                          style: TextStyle(
                              color: AppPalette.currentPalette.primary,
                              fontSize: 44,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.01)),
                      const SizedBox(height: 28.0),
                      BasicInput(
                          hint: 'email'.tr(),
                          content: email,
                          type: TextInputType.emailAddress),
                      const SizedBox(height: 16.0),
                      BasicInput(
                          hint: 'password'.tr(),
                          content: password,
                          type: TextInputType.visiblePassword),
                      const SizedBox(height: 64.0),
                      BasicButton(
                          content: 'buttons.login'.tr(), onPressed: _login)
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
