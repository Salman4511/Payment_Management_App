import 'package:flutter/material.dart';
import 'package:payment_management_app/utils/constants.dart';

class AvatarStackWidget extends StatelessWidget {
  const AvatarStackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 200,
      backgroundColor: kblue.shade300,
      child: CircleAvatar(
        radius: 120,
        backgroundColor: kblue.shade200,
        child: const CircleAvatar(
          radius: 52,
          child: CircleAvatar(
            radius: 45,
            backgroundColor: kgrey,
            backgroundImage: NetworkImage(
                'https://img.freepik.com/free-photo/freedom-concept-with-hiker-mountain_23-2148107064.jpg'),
          ),
        ),
      ),
    );
  }
}
