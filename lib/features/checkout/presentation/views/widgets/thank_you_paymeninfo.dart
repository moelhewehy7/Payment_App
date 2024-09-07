import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:payment_app/core/utils/app_styels.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_info_item.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/total_price.dart';

class ThankYouPaymentInfo extends StatelessWidget {
  const ThankYouPaymentInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, top: 55),
      child: Column(
        children: [
          const Text("Thank you!", style: AppStyles.styleMedium25),
          const Text("Your transaction was successful",
              style: AppStyles.styleRegular20),
          const SizedBox(
            height: 42,
          ),
          const PaymentInfoItem(
            title: "Date",
            value: "01/24/2023",
          ),
          const SizedBox(
            height: 20,
          ),
          const PaymentInfoItem(
            title: "Time",
            value: "10:15 AM",
          ),
          const SizedBox(
            height: 20,
          ),
          const PaymentInfoItem(
            title: "To",
            value: "Sam Louis",
          ),
          const Divider(
            height: 60,
            thickness: 1,
            color: Color(0xFFc7c7c7),
          ),
          const TotalPrice(
            title: 'Total',
            value: r'$50.97',
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
              width: double.infinity,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const CardInfoWidget()),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                FontAwesome.barcode_solid,
                size: 64,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1.50, color: Color(0xff34a853)),
                        borderRadius: BorderRadius.circular(15))),
                child: Center(
                  child: Text(
                    "Paid",
                    style: AppStyles.styleSemiBold24
                        .copyWith(color: const Color(0xff34a853)),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: ((MediaQuery.of(context).size.height * 0.2 + 20) / 2) - 29,
          )
        ],
      ),
    );
  }
}

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Brand(Brands.mastercard_logo),
        const SizedBox(
          width: 23,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Credit Card",
              style: AppStyles.styleRegular18,
            ),
            Text(
              "Mastercard **78",
              style: AppStyles.styleRegular18,
            )
          ],
        )
      ],
    );
  }
}
