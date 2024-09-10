import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:payment_app/core/utils/app_styels.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isLoading = false});
  final void Function()? onPressed;
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: isLoading
          ? const SpinKitFadingCircle(
              size: 30,
              color: Color(0xFF327534),
            )
          : FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Text(
                text,
                style: AppStyles.styleMedium18,
              ),
            ),
    );
  }
}
