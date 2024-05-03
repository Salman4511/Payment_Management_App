import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_management_app/utils/constants.dart';
import 'package:payment_management_app/widgets/settings_tile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgrey.shade100,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            kheight10,
            Row(
              children: [
                const Spacer(),
                Text(
                  'Log Out',
                  style: textstyle13,
                ),
                kwidth10
              ],
            ),
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: kwhite,
                    child: CircleAvatar(
                      radius: 50,
                    ),
                  ),
                  kheight5,
                  Text('Mae Jamison', style: textstyle14),
                  const Text('maej@gmail.com'),
                  kheight45
                ],
              ),
            ),
            Container(
              height: 490,
              color: kwhite,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: SizedBox(
                      height: 45,
                      child: CupertinoSearchTextField(
                        itemColor: kblue,
                        itemSize: 25,
                        placeholder: 'Search Settings',
                      ),
                    ),
                  ),
                  kheight20,
                  SizedBox(
                    height: 370,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      itemCount: settingsItems.length,
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                      itemBuilder: (context, index) => SettingsTileWidget(
                        title: settingsItems[index]['title'],
                        icon: settingsItems[index]['icon'],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

List<Map<String, dynamic>> settingsItems = [
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
