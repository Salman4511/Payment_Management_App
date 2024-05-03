import 'package:flutter/material.dart';
import 'package:payment_management_app/utils/constants.dart';

class RecentPaymentUserWidget extends StatelessWidget {
  const RecentPaymentUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight10,
        const CircleAvatar(
          radius: 35,
        ),
        const SizedBox(
          width: 80,
        ),
        kheight5,
        const SizedBox(
            height: 40,
            width: 60,
            child: Text(textAlign: TextAlign.center, 'data sdsdf'))
      ],
    );
  }
}
