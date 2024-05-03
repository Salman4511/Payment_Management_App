import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_management_app/controllers/user/user_db_controller.dart';
import 'package:payment_management_app/utils/constants.dart';

class BalanceCardWidget extends GetView<UserDatabaseController> {
  const BalanceCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      (){ 
         if (controller.user.isNotEmpty) {
        final user = controller.user[0];
        return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
              color: kwhite, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  kheight20,
                   Text(
                    '\$ ${user.balance.toString()}',
                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Your Balance',
                    style: TextStyle(color: kgrey),
                  )
                ],
              ),
              kwidth30,
              Container(
                color: kblack,
                height: 90,
                width: 1,
              ),
              kwidth30,
              Column(
                children: [
                  kheight20,
                  const Text(
                    '30',
                    style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold, color: kblue),
                  ),
                  const Text('Last Days', style: TextStyle(color: kgrey))
                ],
              ),
              const Icon(
                Icons.arrow_drop_down,
                size: 35,
                color: kblue,
              )
            ],
          ),
        ),
      );
       }  else {
        return const CircularProgressIndicator(); 
      }
   } );
  }
}
