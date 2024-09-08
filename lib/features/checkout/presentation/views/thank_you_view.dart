import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/circle_header.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/dashed_divider.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/thank_you_paymeninfo.dart';

import 'widgets/custom_circle_avatar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Transform.translate(
        offset: const Offset(0, -16),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: const Color(0xffededed),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const ThankYouPaymentInfo(),
                ),
                const Positioned(
                    top: -50, right: 0, left: 0, child: CircleHeader()),
                Positioned(
                  right: -26,
                  left: -26,
                  bottom: MediaQuery.of(context).size.height * 0.2 + 20,
                  child: const DashedDivider(),
                ),
                Positioned(
                    left: -20,
                    bottom: MediaQuery.of(context).size.height * 0.2,
                    child: const CustomCircleAvatar()),
                Positioned(
                    right: -20,
                    bottom: MediaQuery.of(context).size.height * 0.2,
                    child: const CustomCircleAvatar()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
