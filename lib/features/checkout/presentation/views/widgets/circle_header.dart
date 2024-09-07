import 'package:flutter/material.dart';

class CircleHeader extends StatelessWidget {
  const CircleHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Color(0xffededed),
      child: CircleAvatar(
        backgroundColor: Color(0xff34a853),
        radius: 30,
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
