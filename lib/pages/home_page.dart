import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_id_mobile/shared/paths.dart';

import '../colors/app_palette.dart';
import 'home_tabs/pet_list_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentTab = PetListTab();
  int currentTabIndex = 0;
  String currentTabTitle = 'tab.yourPets';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.currentPalette.background,
      appBar: AppBar(
        backgroundColor: AppPalette.currentPalette.primary,
        foregroundColor: AppPalette.currentPalette.white,
        automaticallyImplyLeading: false,
        title: Text(currentTabTitle.tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.03)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 32.0),
          Expanded(child: currentTab),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.1),
                border: Border(
                    top: BorderSide(
                        color: AppPalette.currentPalette.grayBorder,
                        width: 1.0)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 71,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              currentTab = PetListTab();
                              currentTabIndex = 0;
                              currentTabTitle = 'tab.yourPets';
                            });
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                  Paths.getImage(currentTabIndex == 0
                                      ? 'pets-tab-active.png'
                                      : 'pets-tab.png'),
                                  width: 28,
                                  height: 28),
                              const SizedBox(height: 4),
                              Text(
                                'tab.yourPets'.tr(),
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: currentTabIndex == 0
                                        ? AppPalette.currentPalette.primary
                                        : AppPalette.currentPalette.grayBorder),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Open scanner
                          },
                          child: Column(
                            children: [
                              Image.asset(Paths.getImage('scan-qr-tab.png'),
                                  width: 28, height: 28),
                              const SizedBox(height: 4),
                              Text(
                                'tab.scanQr'.tr(),
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        AppPalette.currentPalette.grayBorder),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              // currentTab = PetListTab();
                              currentTabIndex = 2;
                              currentTabTitle = 'tab.notifications';
                            });
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                  Paths.getImage(currentTabIndex == 2
                                      ? 'notifications-tab-active.png'
                                      : 'notifications-tab.png'),
                                  width: 28,
                                  height: 28),
                              const SizedBox(height: 4),
                              Text(
                                'tab.notifications'.tr(),
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: currentTabIndex == 2
                                        ? AppPalette.currentPalette.primary
                                        : AppPalette.currentPalette.grayBorder),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              // currentTab = PetListTab();
                              currentTabIndex = 3;
                              currentTabTitle = 'tab.profile';
                            });
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                  Paths.getImage(currentTabIndex == 3
                                      ? 'profile-tab-active.png'
                                      : 'profile-tab.png'),
                                  width: 28,
                                  height: 28),
                              const SizedBox(height: 4),
                              Text(
                                'tab.profile'.tr(),
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: currentTabIndex == 3
                                        ? AppPalette.currentPalette.primary
                                        : AppPalette.currentPalette.grayBorder),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
