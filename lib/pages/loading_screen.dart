import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/api/exceptions/api.exception.dart';
import 'package:pet_id_mobile/api/owner_controller.dart';
import 'package:pet_id_mobile/api/server_controller.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';
import 'package:pet_id_mobile/pages/auth_page.dart';
import 'package:pet_id_mobile/pages/login_page.dart';
import 'package:pet_id_mobile/pages/ooopsie/confused_cat_page.dart';
import 'package:pet_id_mobile/pages/ooopsie/depressed_cat_page.dart';
import 'package:pet_id_mobile/pages/ooopsie/maintenance_cat_page.dart';
import 'package:pet_id_mobile/storage/storage.dart';
import 'package:pet_id_mobile/storage/storage_item.dart';

import '../api/watcher_controller.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final ServerController _serverController = ServerController();
  final WatcherController _watcherController = WatcherController();
  final OwnerController _ownerController = OwnerController();

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
      _openConfusedCat();
      return;
    }

    setState(() {
      _status = 'maintenanceCheck'.tr();
    });

    bool serverIsBlocked = true;
    try {
      final status = await _watcherController.getMaintenanceStatus();
      serverIsBlocked = status.appShouldBeBlocked;
    } catch (e) {
      _openDepressedCat();
      return;
    }

    if (serverIsBlocked) {
      _openMaintenanceCat();
      return;
    }

    setState(() {
      _status = 'serverCheck'.tr();
    });

    bool serverIsHealthy = true;
    try {
      serverIsHealthy = await _serverController.health();
    } catch (e) {
      _openDepressedCat();
      return;
    }

    if (!serverIsHealthy) {
      _openDepressedCat();
      return;
    }

    setState(() {
      _status = 'authLoading'.tr();
    });

    final accessToken = Storage.prefs.getString(StorageItem.accessToken);
    if (accessToken == null) {
      _openAuth();
      return;
    }

    _ownerController.setToken(accessToken);

    try {
      final ownerData = await _ownerController.auth();
    } catch (e) {
      if (e is ApiException && e.errorResponse.status == 401) {
        _openWelcomeBack();
        return;
      }

      _openDepressedCat();
      return;
    }

    // TODO Open home page
    setState(() {
      _status = 'HOME_SHOULD_APPEAR';
    });
  }

  bool _isInternetAvailable(List<ConnectivityResult> connections) {
    return connections.contains(ConnectivityResult.ethernet) ||
        connections.contains(ConnectivityResult.mobile) ||
        connections.contains(ConnectivityResult.wifi);
  }

  void _openAuth() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AuthPage()));
  }

  void _openWelcomeBack() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void _openDepressedCat() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DepressedCatPage()));
  }

  void _openConfusedCat() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ConfusedCatPage()));
  }

  void _openMaintenanceCat() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MaintenanceCatPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.currentPalette.primary,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppPalette.currentPalette.white),
          const SizedBox(height: 20),
          Text(_status,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppPalette.currentPalette.white, fontSize: 18)),
        ],
      )),
    );
  }
}
