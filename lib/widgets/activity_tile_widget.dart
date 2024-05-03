import 'package:flutter/material.dart';
import 'package:payment_management_app/utils/constants.dart';

class ActivityTileWidget extends StatelessWidget {
  final String product;
     final String company;
    final String returnMessage;
    final double price;
     final String address;

  const ActivityTileWidget({
    super.key, required this.product, required this.company, required this.returnMessage, required this.price, required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              product,
              style: textstyle5,
            ),
            const Spacer(),
            Text(
              '\$ ${price.toString()}',
              style: textstyle6,
            ),
            kwidth10
          ],
        ),
        Text(
          company,
          style: textstyle6,
        ),
        kheight5,
        Text(
          returnMessage,
          style: textstyle8,
        ),
        kheight5,
        Text(
          address,
          style: textstyle9,
        ),
        kheight10,
        const Divider()
      ],
    );
  }
}
