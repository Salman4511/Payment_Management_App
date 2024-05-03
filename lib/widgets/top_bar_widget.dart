import 'package:flutter/material.dart';
import 'package:payment_management_app/utils/constants.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth10,
        const CircleAvatar(
          radius: 37,
          backgroundColor: kwhite,
          child: CircleAvatar(
            radius: 33,
          ),
        ),
        kwidth10,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Vessssss',
              style: textstyle3,
            ),
            Text(
              'Here\'s your spending dashboard',
              style: textstyle4,
            )
          ],
        ),
        kwidth30,
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 28,
                color: Colors.grey,
              ),
            ),
            Positioned(
              right: 8,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
