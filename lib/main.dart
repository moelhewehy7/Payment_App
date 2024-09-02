import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/views/my_cart_view.dart';

void main() {
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        home: const MyCartView());
  }
}
