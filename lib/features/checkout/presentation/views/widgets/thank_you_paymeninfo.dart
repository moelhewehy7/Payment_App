import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:payment_app/core/utils/app_styels.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/total_price.dart';

class ThankYouPaymentInfo extends StatelessWidget {
  const ThankYouPaymentInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 66, horizontal: 22),
      child: Column(
        children: [
          Text("Thank you!", style: AppStyles.styleMedium25),
          Text("Your transaction was successful",
              style: AppStyles.styleRegular20),
          SizedBox(
            height: 42,
          ),
          PaymentInfoItem(
            title: "Date",
            value: "01/24/2023",
          ),
          SizedBox(
            height: 20,
          ),
          PaymentInfoItem(
            title: "Time",
            value: "10:15 AM",
          ),
          SizedBox(
            height: 20,
          ),
          PaymentInfoItem(
            title: "To",
            value: "Sam Louis",
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 60,
            thickness: 1,
            color: Color(0xFFc7c7c7),
          ),
          TotalPrice(
            title: 'Total',
            value: r'$50.97',
          ),
          Container(
              child: Row(
                children: [
                  Brand(Brands.mastercard),
                ],
              ),
              width: double.infinity,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))))
        ],
      ),
    );
  }
}

class PaymentInfoItem extends StatelessWidget {
  const PaymentInfoItem({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.styleRegular18),
        Text(value, style: AppStyles.styleSemiBold18)
      ],
    );
  }
}
