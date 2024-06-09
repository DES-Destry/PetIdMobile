import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/api/exceptions/api.exception.dart';
import 'package:pet_id_mobile/api/owner_controller.dart';
import 'package:pet_id_mobile/api/server_controller.dart';
import 'package:pet_id_mobile/colors/app_palette.dart';
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
      // TODO Open confused cat page
      setState(() {
        _status = 'CONFUSED_CAT_SHOULD_APPEAR';
      });
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
      // TODO Open depressed cat page
      setState(() {
        _status = 'DEPRESSED_CAT_SHOULD_APPEAR';
      });
      return;
    }

    if (!serverIsBlocked) {
      // TODO Open maintenance cat page
      setState(() {
        _status = 'MAINTENANCE_CAT_SHOULD_APPEAR';
      });
      return;
    }

    setState(() {
      _status = 'serverCheck'.tr();
    });

    bool serverIsHealthy = true;
    try {
      serverIsHealthy = await _serverController.health();
    } catch (e) {
      // TODO Open depressed cat page
      setState(() {
        _status = 'DEPRESSED_CAT_SHOULD_APPEAR';
      });
      return;
    }

    if (!serverIsHealthy) {
      // TODO Open depressed cat page
      setState(() {
        _status = 'DEPRESSED_CAT_SHOULD_APPEAR';
      });
      return;
    }

    // TODO check user auth
    final accessToken = Storage.prefs.getString(StorageItem.accessToken);
    if (accessToken == null) {
      // TODO open registration
      setState(() {
        _status = 'REGISTRATION_SHOULD_APPEAR';
      });
      return;
    }

    _ownerController.setToken(accessToken);

    try {
      final ownerData = await _ownerController.auth();
    } catch (e) {
      if (e is ApiException && e.errorResponse.status == 401) {
        // TODO open registration
        setState(() {
          _status = 'REGISTRATION_SHOULD_APPEAR';
        });
        return;
      }

      // TODO Open depressed cat page
      setState(() {
        _status = 'DEPRESSED_CAT_SHOULD_APPEAR';
      });
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
      )),
    );
  }
}
