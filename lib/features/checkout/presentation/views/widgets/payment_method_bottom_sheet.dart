import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/views/payment_details_view.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/buttons.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_methods.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PaymentMethods(),
          const SizedBox(
            height: 20,
          ),
          CustomFilledButton(
            text: "Continue",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymetDetails()));
            },
          )
        ],
      ),
    );
  }
}
