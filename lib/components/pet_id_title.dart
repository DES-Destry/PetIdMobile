import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';

import '../shared/paths.dart';

class PetIdTitle extends StatelessWidget {
  const PetIdTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
