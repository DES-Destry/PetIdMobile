import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/api/dto/requests/create_owner_request.dto.dart';
import 'package:pet_id_mobile/api/owner_controller.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';
import 'package:pet_id_mobile/components/basic_button.dart';
import 'package:pet_id_mobile/components/basic_input.dart';
import 'package:pet_id_mobile/pages/home_page.dart';
import 'package:pet_id_mobile/storage/storage.dart';
import 'package:pet_id_mobile/storage/storage_item.dart';

import 'ooopsie/depressed_cat_page.dart';

class CompleteProfilePage extends StatefulWidget {
  final String email;
  final String password;

  const CompleteProfilePage(
      {super.key, required this.email, required this.password});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final OwnerController ownerController = OwnerController();

  String name = '';
  String address = '';
  String description = '';

  _register() async {
    if (widget.email == '') {
      print('Empty state');
      return;
    }

    try {
      final tokens = await ownerController.createOwner(CreateOwnerRequestDto(
          email: widget.email,
          password: widget.password,
          name: name,
          address: address,
          description: description));

      Storage.prefs.setString(StorageItem.accessToken, tokens.accessToken);
    } catch (e) {
      print(e.toString());
      _openDepressedCat();
      return;
    }

    _openHome();
  }

  void _openHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void _openDepressedCat() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DepressedCatPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.currentPalette.background,
      appBar: AppBar(
        backgroundColor: AppPalette.currentPalette.primary,
        foregroundColor: AppPalette.currentPalette.white,
        title: Text('createProfile'.tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.03)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            const SizedBox(height: 32.0),
            Row(
              children: [
                SizedBox(
                    width: 88,
                    height: 120,
                    child: Container(color: AppPalette.currentPalette.primary)),
                const SizedBox(width: 12.0),
                Flexible(
                  child: Column(
                    children: [
                      BasicInput(
                        content: name,
                        type: TextInputType.name,
                        hint: 'name'.tr(),
                        onChanged: (text) {
                          print('Name: $text');
                          setState(() {
                            name = text;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      BasicButton(
                          content: 'buttons.newProfilePic'.tr(),
                          onPressed: () {})
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16.0),
            BasicInput(
              hint: 'address'.tr(),
              content: address,
              type: TextInputType.streetAddress,
              onChanged: (text) {
                setState(() {
                  address = text;
                });
              },
            ),
            const SizedBox(height: 16.0),
            BasicInput(
              hint: 'description'.tr(),
              content: description,
              type: TextInputType.multiline,
              onChanged: (text) {
                setState(() {
                  description = text;
                });
              },
            ),
            const SizedBox(height: 64.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 84.0),
                  child: BasicButton(
                    content: 'buttons.createAccount'.tr(),
                    onPressed: _register,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
