import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_app/features/checkout/presentation/manager/cubits/cubit/payment_cubit.dart';
import 'package:payment_app/features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/buttons.dart';
import '../../../data/models/payment_intent_input_model.dart';

class CustomConsumerButton extends StatelessWidget {
  const CustomConsumerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(listener: (context, state) {
      if (state is PaymentSuccess) {
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ThankYouView()));
      }
      if (state is PaymentFailure) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errMessage),
          ),
        );
      }
    }, builder: (context, state) {
      return CustomFilledButton(
        isLoading: state is PaymentLoading ? true : false,
        text: "Continue",
        onPressed: () {
          // PaymentIntentInputModel paymentIntentInputModel =
          //     PaymentIntentInputModel(
          //   customerId: "cus_QpE0cG2tcIV9Wk",
          //   amount: 3,
          //   currency: "usd",
          // );
          // BlocProvider.of<PaymentCubit>(context)
          //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: "YOUR CLIENT ID",
              secretKey: "YOUR SECRET KEY",
              transactions: const [
                {
                  "amount": {
                    "total": "100",
                    "currency": "USD",
                    "details": {
                      "subtotal": "100",
                      "shipping": "0",
                      "shipping_discount": 0
                    }
                  },
                  "description": "The payment transaction description.",
                  // "payment_options": {
                  //   "allowed_payment_method":
                  //       "INSTANT_FUNDING_SOURCE"
                  // },
                  "item_list": {
                    "items": [
                      {
                        "name": "Apple",
                        "quantity": 4,
                        "price": "10",
                        "currency": "USD"
                      },
                      {
                        "name": "Pineapple",
                        "quantity": 5,
                        "price": "12",
                        "currency": "USD"
                      }
                    ]

                    // Optional
                    //   "shipping_address": {
                    //     "recipient_name": "Tharwat samy",
                    //     "line1": "tharwat",
                    //     "line2": "",
                    //     "city": "tharwat",
                    //     "country_code": "EG",
                    //     "postal_code": "25025",
                    //     "phone": "+00000000",
                    //     "state": "ALex"
                    //  },
                  }
                }
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log("onSuccess: $params");
                Navigator.pop(context);
              },
              onError: (error) {
                log("onError: $error");
                Navigator.pop(context);
              },
              onCancel: () {
                print('cancelled:');
                Navigator.pop(context);
              },
            ),
          ));
        },
      );
    });
  }
}
