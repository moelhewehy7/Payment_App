import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/app_styels.dart';
import 'package:payment_app/features/checkout/presentation/manager/cubits/cubit/payment_cubit.dart';
import 'package:payment_app/features/checkout/presentation/views/payment_details_view.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/buttons.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_methods.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/total_price.dart';

import 'widgets/oreder_info.dart';
import 'widgets/payment_method_bottom_sheet.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          title: const Text(
            'My Cart',
            style: AppStyles.styleMedium25,
          ),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: Column(children: [
          Expanded(
            child: Image.asset(
              'assets/images/basket.png',
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
              color: Color.fromARGB(250, 199, 199, 199),
            ),
          ),
          const TotalPrice(
            title: 'Total',
            value: r'$50.97',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFilledButton(
            text: "Complete Payment",
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(),
                      child: const PaymentMethodBottomSheet(),
                    );
                  });
            },
          )
        ]),
      ),
    );
  }
}
