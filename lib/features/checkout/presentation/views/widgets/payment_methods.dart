import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_item.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  List<String> items = [
    "assets/images/visaa.jpg",
    "assets/images/paypal.png",
    "assets/images/apple-pay.webp"
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
