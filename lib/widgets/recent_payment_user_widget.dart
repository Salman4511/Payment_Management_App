import 'package:flutter/material.dart';
import 'package:payment_management_app/utils/constants.dart';

class RecentPaymentUserWidget extends StatelessWidget {
  final String name;
  final String secondName;
  final String profile;
  const RecentPaymentUserWidget({
    super.key,
    required this.name,
    required this.secondName,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight10,
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(profile),
        ),
        const SizedBox(
          width: 80,
        ),
        kheight5,
        SizedBox(
            height: 40,
            width: 60,
            child: Text(textAlign: TextAlign.center, '$name $secondName'))
      ],
    );
  }
}
