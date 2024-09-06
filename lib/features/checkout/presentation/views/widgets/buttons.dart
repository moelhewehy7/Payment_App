import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styels.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: const Text(
          "Complete Payment",
          style: AppStyles.styleMedium18,
        ),
      ),
    );
  }
}
