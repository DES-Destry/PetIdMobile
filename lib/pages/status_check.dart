import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String _status = '';

  @override
  void initState() {
    super.initState();

    setState(() {
      _status = 'internetCheck'.tr();
    });

    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    List<ConnectivityResult> result;
    try {
      result = await Connectivity().checkConnectivity();
    } catch (e) {
      result = [ConnectivityResult.none];
    }

    if (!_isInternetAvailable(result)) {
      // Open confused cat page
      setState(() {
        _status = 'CONFUSED_CAT_SHOULD_APPEAR';
      });
      return;
    }

    setState(() {
      _status = 'serverCheck'.tr();
    });

    // TODO add endpoint

    setState(() {
      _status = 'maintenanceCheck'.tr();
    });

    // TODO add endpoint
  }

  bool _isInternetAvailable(List<ConnectivityResult> connections) {
    return connections.contains(ConnectivityResult.ethernet) || connections.contains(ConnectivityResult.mobile) || connections.contains(ConnectivityResult.wifi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.currentPalette.primary,
      body: Center(
        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  Text(_status),
                ],
              )
      ),
    );
  }
}