import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final List<Map<String, dynamic>> allSettings = [
    {
      'title': 'Personal Info',
      'icon': Icons.person,
    },
    {
      'title': 'My QR Code',
      'icon': Icons.qr_code_scanner,
    },
    {
      'title': 'Banks and Cards',
      'icon': Icons.food_bank,
    },
    {
      'title': 'Payment Preferences',
      'icon': Icons.payments,
    },
    {
      'title': 'Automatic Payments',
      'icon': Icons.restart_alt,
    },
    {
      'title': 'Login and Security',
      'icon': Icons.login,
    },
    {
      'title': 'Notifications',
      'icon': Icons.notifications,
    },
  ];

  RxList<Map<String, dynamic>> filteredSettings = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize filteredSettings with allSettings on initial load
    filteredSettings.assignAll(allSettings);
  }

  void searchSettings(String query) {
    if (query.isEmpty) {
      // Reset to show all settings if search query is empty
      filteredSettings.assignAll(allSettings);
    } else {
      // Filter settings based on the search query
      filteredSettings.value = allSettings
          .where((setting) => setting['title']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
  }
}
