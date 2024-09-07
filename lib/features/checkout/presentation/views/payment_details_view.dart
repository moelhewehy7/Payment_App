import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styels.dart';
import 'package:payment_app/features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_methods.dart';
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
                  // PaymentMethods(),
                  CreditCard(
                    formKey: formKey,
                  ),
                ],
              )),
            ],
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: CustomFilledButton(
          text: "Pay",
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return const ThankYouView();
              }));
              debugPrint('error');
            }
          },
        ),
      ),
    );
  }
}
