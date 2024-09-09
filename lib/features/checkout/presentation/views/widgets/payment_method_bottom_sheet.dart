import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_methods.dart';

import 'custom_consumer_button.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PaymentMethods(),
            SizedBox(
              height: 20,
            ),
            CustomConsumerButton(),
          ],
        ));
  }
}
