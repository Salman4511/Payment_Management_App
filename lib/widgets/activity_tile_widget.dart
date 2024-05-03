import 'package:flutter/material.dart';
import 'package:payment_management_app/utils/constants.dart';

class ActivityTileWidget extends StatelessWidget {
  const ActivityTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Apple Macbook Pro 16 - Silver',
              style: textstyle5,
            ),
            const Spacer(),
            Text(
              '\$999',
              style: textstyle6,
            ),
            kwidth10
          ],
        ),
        Text(
          'Apple Store',
          style: textstyle6,
        ),
        kheight5,
        Text(
          'Return Time Remaining 2 Weeks',
          style: textstyle8,
        ),
        kheight5,
        Text(
          '1321, Colorado Street, Suit 32 - 90876',
          style: textstyle9,
        ),
        kheight10,
        const Divider()
      ],
    );
  }
}
