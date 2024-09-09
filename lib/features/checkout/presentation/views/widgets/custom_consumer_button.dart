import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          PaymentIntentInputModel paymentIntentInputModel =
              PaymentIntentInputModel(
            amount: 100,
            currency: "usd",
          );
          BlocProvider.of<PaymentCubit>(context)
              .makePayment(paymentIntentInputModel: paymentIntentInputModel);
        },
      );
    });
  }
}
