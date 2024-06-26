import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_management_app/controllers/user/user_db_controller.dart';
import 'package:payment_management_app/views/bottom_nav_bar/bottom_nav_bar.dart';

void main()async {

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNavBar(),
       initialBinding: BindingsBuilder(() {
        Get.put<UserDatabaseController>(UserDatabaseController());
      }),
    );
  }
}
