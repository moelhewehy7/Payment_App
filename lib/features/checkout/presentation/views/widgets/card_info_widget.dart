import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:payment_app/core/utils/app_styels.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Brand(Brands.mastercard_logo),
        const SizedBox(
          width: 23,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Credit Card",
              style: AppStyles.styleRegular18,
            ),
            Text(
              "Mastercard **78",
              style: AppStyles.styleRegular18,
            )
          ],
        )
      ],
    );
  }
}
