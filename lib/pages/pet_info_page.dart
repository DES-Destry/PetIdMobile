import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/api/pet_controller.dart';
import 'package:pet_id_mobile/components/pet_card.dart';

import '../colors/app_palette.dart';
import 'ooopsie/depressed_cat_page.dart';

class PetInfoPage extends StatefulWidget {
  final int tagId;

  const PetInfoPage({super.key, required this.tagId});

  @override
  State<PetInfoPage> createState() => _PetInfoPageState();
}

class _PetInfoPageState extends State<PetInfoPage> {
  PetController petController = PetController();

  String name = '';
  String sex = '';
  String isCastrated = '';
  String description = '';

  @override
  void initState() {
    super.initState();
    _getPet();
  }

  _getPet() async {
    try {
      final pet = await petController.getPetByTagId(widget.tagId);

      setState(() {
        name = pet.name;
        description = pet.description;
        sex = pet.sex ? 'Male' : 'Female';
        isCastrated = pet.isCastrated ? 'Yes' : 'No';
      });
    } catch (e) {
      print(e.toString());
      _openDepressedCat();
      return;
    }
  }

  void _openDepressedCat() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DepressedCatPage()));
  }

  String _formatId(int id) {
    final converted = id.toString();
    if (converted.length < 4) {
      return 'ID${'0' * (4 - converted.length)}$converted';
    }

    return 'ID$converted';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.currentPalette.background,
      appBar: AppBar(
        backgroundColor: AppPalette.currentPalette.primary,
        foregroundColor: AppPalette.currentPalette.white,
        title: Text('info'.tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.03)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 32.0),
          PetCard(
              id: _formatId(widget.tagId),
              name: name,
              sex: sex,
              isCastrated: isCastrated),
          const SizedBox(height: 32.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              description,
              style: TextStyle(
                  fontSize: 14.0, color: AppPalette.currentPalette.grayText),
            ),
          )
        ],
      ),
    );
  }
}
