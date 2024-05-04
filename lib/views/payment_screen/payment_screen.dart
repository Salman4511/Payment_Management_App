import 'package:flutter/material.dart';
import 'package:payment_management_app/utils/constants.dart';
import 'package:payment_management_app/widgets/avatar_stack_widget.dart';

class PaymentScreen extends StatelessWidget {
  final String img;
  final String firstName;
  final String lastName;
  const PaymentScreen({super.key, required this.img, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblue,
      body: Align(
        child: Column(
          children: [
            kheight60,
             AvatarStackWidget(img: img,),
            kheight100,
            Text(
              'Paying',
              style: textstyle10,
            ),
            kheight5,
            Text(
              '$firstName $lastName',
              style: textstyle11,
            ),
            kheight20,
            SizedBox(
              height: 50,
              width: 180,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: kwhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  'Cancel Payment',
                  style: textstyle12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
