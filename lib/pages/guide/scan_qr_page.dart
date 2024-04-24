import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';
import 'package:pet_id_mobile/pages/guide/attach_pet_page.dart';

class ScanQrPage extends StatelessWidget {
  const ScanQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.currentPalette.primary,
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 128),
                Center(
                  child: Text('scanQr'.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 42,
                        letterSpacing: -0.01,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(height: 12),
                Image.asset('lib/assets/images/qr.png', height: 220, width: 220, fit: BoxFit.contain),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Center(
                    child: Text('scanQrCaption'.tr(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          letterSpacing: -0.02,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 64),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 24.0,
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
                  Text('3 ${'of'.tr()} 4',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AttachPetPage()));
                      }, iconSize: 24.0, icon: const Icon(Icons.arrow_forward_ios, color: Colors.white)),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
