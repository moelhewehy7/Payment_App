import 'package:flutter/material.dart';

import 'package:payment_app/core/utils/app_styels.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_item.dart';

class PaymetDetails extends StatefulWidget {
  const PaymetDetails({
    super.key,
  });

  @override
  State<PaymetDetails> createState() => _PaymetDetailsState();
}

class _PaymetDetailsState extends State<PaymetDetails> {
  List<String> items = [
    "assets/images/card.jpeg",
    "assets/images/paypal.png",
    "assets/images/apple_pay.png"
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Payment Details',
            style: AppStyles.styleMedium25,
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Row(
              children: items
                  .map((e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = items.indexOf(e);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: PaymentItem(
                            isActive: selectedIndex == items.indexOf(e),
                            image: e,
                          ),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
