import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment_app/core/utils/app_styels.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.styleSemiBold24),
        Text(value, style: AppStyles.styleSemiBold24)
      ],
    );
  }
}
