import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:payment_app/core/utils/app_styels.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_item.dart';

import 'widgets/buttons.dart';
import 'widgets/custom_credit_card.dart';

class PaymetDetails extends StatefulWidget {
  const PaymetDetails({
    super.key,
  });

  @override
  State<PaymetDetails> createState() => _PaymetDetailsState();
}

class _PaymetDetailsState extends State<PaymetDetails> {
  List<String> items = [
    "assets/images/visaa.jpg",
    "assets/images/paypal.png",
    "assets/images/apple-pay.webp"
  ];
  int selectedIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Payment Details',
            style: AppStyles.styleMedium25,
          )),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: Column(
                children: [
                  paymentMethods(),
                  CreditCard(
                    formKey: formKey,
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  SizedBox(
                    height: 200,
                  ),
                ],
              )),
            ],
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: CustomFilledButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
            } else {
              debugPrint('error');
            }
          },
        ),
      ),
    );
  }

  Row paymentMethods() {
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
