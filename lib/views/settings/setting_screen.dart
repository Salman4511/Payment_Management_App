import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_management_app/controllers/settings/settings_controller.dart';
import 'package:payment_management_app/controllers/user/user_db_controller.dart';
import 'package:payment_management_app/utils/constants.dart';
import 'package:payment_management_app/widgets/settings_tile_widget.dart';

class SettingsScreen extends GetView<SettingsController> {
  final UserDatabaseController userController =
      Get.put(UserDatabaseController());
  final SettingsController settingsController = Get.put(SettingsController());

  SettingsScreen({super.key});

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
            Obx(() {
              if (userController.user.isNotEmpty) {
                final user = userController.user[0];
                return Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: kwhite,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(user.profilePicture),
                        ),
                      ),
                      kheight5,
                      Text(user.name, style: textstyle14),
                      Text(user.mailId),
                      kheight45
                    ],
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
            Container(
              height: 490,
              color: kwhite,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      height: 45,
                      child: CupertinoSearchTextField(
                        itemColor: kblue,
                        itemSize: 25,
                        placeholder: 'Search Settings',
                        onChanged: (query) {
                          settingsController.searchSettings(query);
                        },
                      ),
                    ),
                  ),
                  kheight20,
                  SizedBox(
                    height: 370,
                    child: Obx(() {
                      return ListView.separated(
                          padding: const EdgeInsets.only(left: 18, right: 18),
                          physics: const BouncingScrollPhysics(),
                          itemCount: settingsController.filteredSettings.length,
                          separatorBuilder: (context, index) => const Divider(
                                color: Colors.grey,
                                height: 1,
                              ),
                          itemBuilder: (context, index) {
                            final setting =
                                settingsController.filteredSettings[index];
                            return SettingsTileWidget(
                              title: setting['title'],
                              icon: setting['icon'],
                            );
                          });
                    }),
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
