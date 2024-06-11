import 'package:flutter/cupertino.dart';

import '../colors/app_palette.dart';

class PetCard extends StatelessWidget {
  final String id;
  final String name;
  final String sex;
  final String isCastrated;

  const PetCard({super.key,
    required this.id,
    required this.name,
    required this.sex,
    required this.isCastrated});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 232,
      width: 337,
      decoration: BoxDecoration(
          color: AppPalette.currentPalette.grayText.withAlpha(20),
          border:
          Border.all(color: AppPalette.currentPalette.primary, width: 6),
          borderRadius: const BorderRadius.all(Radius.circular(30.0))),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                  width: 88,
                  height: 120,
                  child: Container(color: AppPalette.currentPalette.primary)),
              const SizedBox(height: 4),
              Text(id, style: TextStyle(fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppPalette.currentPalette.primary)),
            ],
          ),
          const SizedBox(width: 12.0),
          Flexible(
            child: Column(
              children: [
                Text(name, style: TextStyle(fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: AppPalette.currentPalette.primary)),
                const SizedBox(height: 4),
                Text('Sex: $sex', style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: AppPalette.currentPalette.primary)),
                Text('Castrated: $isCastrated', style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: AppPalette.currentPalette.primary)),
                Text('Walk outside', style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: AppPalette.currentPalette.primary)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
