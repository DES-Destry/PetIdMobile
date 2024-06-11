import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';
import 'package:pet_id_mobile/pages/pet_create_confirmation_page.dart';
import 'package:pet_id_mobile/pages/pet_info_page.dart';

import '../api/dto/responses/check_tag.dto.dart';
import '../api/exceptions/api.exception.dart';
import '../api/exceptions/connection.exception.dart';
import '../api/exceptions/error_like.dart';
import '../api/tag_controller.dart';
import '../components/qr_scanner_overlay.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final TagController _tagController = TagController();

  late int dialogsOpened = 0;

  Future<void> _onScan(
      BuildContext context,
      BarcodeCapture result,
      VoidCallback onQrFormatError,
      Function(CheckTagDto?, ErrorLike?) onControlCheckResult) async {
    final String link = result.raw[0]['rawValue'];

    final parts = link.split('/');
    final code = parts.last;

    try {
      final CheckTagDto checkResult = await _tagController.checkTag(code);
      onControlCheckResult.call(checkResult, null);
    } on ApiException catch (e) {
      onControlCheckResult.call(null, ErrorLike.fromApiError(e));
    } on ConnectionException catch (e) {
      onControlCheckResult.call(null, ErrorLike.fromConnectionError(e));
    } catch (e) {
      onControlCheckResult.call(null, ErrorLike.fromApplicationError(e));
    }
  }

  Future<void> _showInfoDialog(
      BuildContext context, String title, String message,
      [String? details]) {
    dialogsOpened++;
    List<Widget> buttons = [];

    if (details != null) {
      buttons.add(CupertinoDialogAction(
          child: const Text("Details"),
          onPressed: () => {_showInfoDialog(context, "Details", details)}));
    }

    buttons.add(CupertinoDialogAction(
        child: const Text("Ok"),
        onPressed: () {
          dialogsOpened--;
          Navigator.pop(context);
        }));

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: buttons,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.currentPalette.primary,
      appBar: AppBar(
        foregroundColor: AppPalette.currentPalette.white,
        backgroundColor: AppPalette.currentPalette.primary,
        title: Text('tag.scanQr',
            style: TextStyle(
                color: AppPalette.currentPalette.text,
                fontWeight: FontWeight.bold)),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                child: Stack(children: [
              MobileScanner(
                controller: MobileScannerController(
                  detectionTimeoutMs: 1000,
                ),
                onDetect: (result) async {
                  if (dialogsOpened != 0) {
                    return;
                  }

                  await _onScan(context, result, () {
                    _showInfoDialog(context, 'Invalid QR code',
                        'This QR has an unknown format');
                  }, (CheckTagDto? tag, ErrorLike? err) {
                    if (err != null) {
                      _showInfoDialog(context, 'Error',
                          'Caught error with code: ${err.code}', err.message);
                      return;
                    }

                    if (tag!.isFree) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetCreateConfirmationPage(
                                    tagId: tag.id,
                                  )));
                      return;
                    }

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PetInfoPage(tagId: tag.id)));
                  });
                },
              ),
              const QRScannerOverlay(overlayColour: Colors.black38)
            ])),
          ],
        ),
      ),
    );
  }
}
