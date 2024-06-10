import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';
import 'package:pet_id_mobile/components/basic_button.dart';
import 'package:pet_id_mobile/components/basic_input.dart';
import 'package:pet_id_mobile/components/pet_id_title.dart';
import 'package:pet_id_mobile/pages/complete_profile_page.dart';

import '../shared/paths.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = '';
  String password = '';
  String repeatPassword = '';

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
                            Navigator.pop(context);
                          },
                          iconSize: 24.0,
                          icon: Icon(Icons.arrow_back_ios,
                              color: AppPalette.currentPalette.accent)),
                      const SizedBox(height: 24.0),
                      Text('getStarted'.tr(),
                          style: TextStyle(
                              color: AppPalette.currentPalette.primary,
                              fontSize: 44,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.01)),
                      const SizedBox(height: 28.0),
                      BasicInput(
                        hint: 'email'.tr(),
                        content: email,
                        type: TextInputType.emailAddress,
                        onChanged: (text) {
                          setState(() {
                            email = text;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      BasicInput(
                        hint: 'password'.tr(),
                        content: password,
                        type: TextInputType.visiblePassword,
                        onChanged: (text) {
                          setState(() {
                            password = text;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      BasicInput(
                        hint: 'repeatPassword'.tr(),
                        content: repeatPassword,
                        type: TextInputType.visiblePassword,
                        onChanged: (text) {
                          setState(() {
                            repeatPassword = text;
                          });
                        },
                      ),
                      const SizedBox(height: 64.0),
                      BasicButton(
                          content: 'createAccount'.tr(),
                          onPressed: () => {
                                if (password == repeatPassword)
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CompleteProfilePage(
                                                    email: email,
                                                    password: password)))
                                  }
                              }),
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
