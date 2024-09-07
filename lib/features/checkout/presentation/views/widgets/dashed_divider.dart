import 'package:flutter/material.dart';

class DashedDivider extends StatelessWidget {
  const DashedDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          40,
          (_) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Container(
                      height: 2, width: 5, color: const Color(0xFFb8b8b8)),
                ),
              )),
    );
  }
}
