import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    required this.isActive,
    required this.image,
  });

  final bool isActive;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.50,
                  color: isActive ? Color(0xff34a853) : Color(0xff7f7f7f)),
              borderRadius: BorderRadius.circular(15)),
          shadows: [
            BoxShadow(
                spreadRadius: 0,
                color: isActive ? Color(0xff34a853) : Color(0xFFFFFFFF),
                blurRadius: 4,
                offset: Offset(0, 0))
          ]),
      child: Container(
        width: 103,
        height: 62,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          image,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
