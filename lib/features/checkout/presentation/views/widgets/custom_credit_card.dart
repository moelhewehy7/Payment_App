import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({
    super.key,
  });

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          isHolderNameVisible: true,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView:
              showBackView, //true when you want to show cvv(back) view
          onCreditCardWidgetChange: (CreditCardBrand brand) {},
        ),
        CreditCardForm(
          formKey: formKey, // Required
          cardNumber: cardNumber, // Required
          expiryDate: expiryDate, // Required
          cardHolderName: cardHolderName, // Required
          cvvCode: cvvCode, // Required

          onCreditCardModelChange: (CreditCardModel creditCardModel) {
            setState(() {
              cardNumber = creditCardModel.cardNumber;
              expiryDate = creditCardModel.expiryDate;
              cardHolderName = creditCardModel.cardHolderName;
              cvvCode = creditCardModel.cvvCode;
              showBackView = creditCardModel.isCvvFocused;
            });
          },
        ) // Required
      ],
    );
  }
}
