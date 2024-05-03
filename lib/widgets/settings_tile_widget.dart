import 'package:flutter/material.dart';
import 'package:payment_management_app/utils/constants.dart';

class SettingsTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const SettingsTileWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: kgrey,
      ),
      title: Text(title),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: kblue,
        size: 15,
      ),
    );
  }
}
