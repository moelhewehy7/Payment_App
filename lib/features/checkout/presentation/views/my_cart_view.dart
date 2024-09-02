import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:payment_app/core/utils/app_styels.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/total_price.dart';

import 'widgets/oreder_info.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          title: const Text(
            'My Cart',
            style: AppStyles.styleMedium25,
          ),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(children: [
          Expanded(
            child: Image.asset(
              'assets/images/basket.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          const OrederInfo(
            title: 'Order Subtotal',
            value: r'$42.97',
          ),
          const OrederInfo(
            title: 'Discount',
            value: r'$0',
          ),
          const OrederInfo(
            title: 'Shipping',
            value: r'$8',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Divider(
              thickness: 2,
              height: 34,
              color: Color(0xFFbC7C7C7),
            ),
          ),
          const TotalPrice(
            title: 'Total',
            value: r'$50.97',
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton(
              onPressed: () {},
              child: const Text(
                "Complete Payment",
                style: AppStyles.styleMedium18,
              ),
              style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          )
        ]),
      ),
    );
  }
}
