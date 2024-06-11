import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/api/dto/requests/attach_pet_request.dto.dart';
import 'package:pet_id_mobile/api/dto/requests/create_pet_request.dto.dart';
import 'package:pet_id_mobile/api/owner_controller.dart';
import 'package:pet_id_mobile/api/pet_controller.dart';
import 'package:pet_id_mobile/components/basic_dropdown.dart';

import '../colors/app_palette.dart';
import '../components/basic_button.dart';
import '../components/basic_input.dart';
import 'home_page.dart';
import 'ooopsie/depressed_cat_page.dart';

class CreatePetPage extends StatefulWidget {
  final int tagId;
  final String tagCode;

  const CreatePetPage({super.key, required this.tagId, required this.tagCode});

  @override
  State<CreatePetPage> createState() => _CreatePetPageState();
}

class _CreatePetPageState extends State<CreatePetPage> {
  final PetController petController = PetController();
  final OwnerController ownerController = OwnerController();

  String name = '';
  String type = '';
  String description = '';
  String sex = 'Male';
  String isCastrated = 'No';
  String canGoOutside = 'No';

  _fillTag() async {
    try {
      final pet = await petController.createPet(CreatePetRequestDto(
          type: type,
          name: name,
          sex: sex == 'Male',
          isCastrated: isCastrated == 'Yes',
          description: description));
      await petController.attachPet(
          AttachPetRequestDto(petId: pet.petId, tagCode: widget.tagCode));
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
        title: Text('newPet'.tr(),
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
              // crossAxisAlignment: CrossAxisAlignment.stretch,
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
              hint: 'type'.tr(),
              content: type,
              onChanged: (text) {
                setState(() {
                  type = text;
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
            const SizedBox(height: 16.0),
            BasicDropdown(
                onChanged: (text) {
                  setState(() {
                    sex = text;
                  });
                },
                variants: const ['Male', 'Female'],
                label: 'sex'.tr()),
            const SizedBox(height: 16.0),
            BasicDropdown(
                onChanged: (text) {
                  setState(() {
                    isCastrated = text;
                  });
                },
                variants: const ['Yes', 'No'],
                label: 'isCastrated'.tr()),
            const SizedBox(height: 16.0),
            BasicDropdown(
                onChanged: (text) {
                  setState(() {
                    canGoOutside = text;
                  });
                },
                variants: const ['Yes', 'No'],
                label: 'walkOutside'.tr()),
            const SizedBox(height: 64.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 84.0),
                  child: BasicButton(
                    content: 'buttons.fillTag'.tr(),
                    onPressed: _fillTag,
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
