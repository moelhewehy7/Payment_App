import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styels.dart';
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
        clipBehavior: Clip.none,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Transform.translate(
          offset: Offset(0, -10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Color(0xffededed),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: ThankYouPaymentInfo(),
              ),
              Positioned(top: -40, right: 0, left: 0, child: CircleHeader()),
              Positioned(
                right: -26,
                left: -26,
                bottom: MediaQuery.of(context).size.height * 0.22 + 20,
                child: DashedDivider(),
              ),
              Positioned(
                  left: -20,
                  bottom: MediaQuery.of(context).size.height * 0.22,
                  child: CustomCircleAvatar()),
              Positioned(
                  right: -20,
                  bottom: MediaQuery.of(context).size.height * 0.22,
                  child: CustomCircleAvatar()),
            ],
          ),
        ),
      ),
    );
  }
}
