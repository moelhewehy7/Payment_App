import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styels.dart';

class OrederInfo extends StatelessWidget {
  const OrederInfo({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.styleRegular18),
        Text(value, style: AppStyles.styleRegular18)
      ],
    );
  }
}
