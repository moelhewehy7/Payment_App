import 'dart:developer';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_app/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var response = await apiService.post(
        url: "https://api.stripe.com/v1/payment_intents",
        body: paymentIntentInputModel.toJson(),
        token: ApiKeys.secretKey);
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: "Mohamed",
          paymentIntentClientSecret:
              initPaymentSheetInputModel.paymentIntentClientSecret,
          customerEphemeralKeySecret:
              initPaymentSheetInputModel.customerEphemeralKeySecret,
          customerId: initPaymentSheetInputModel.customerId
          // style: ThemeMode.dark,
          ),
    );
  }

  Future presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);
    var ephemeralKeyModel =
        await createEpemeralKey(customerId: paymentIntentInputModel.customerId);
    InitPaymentSheetInputModel initPaymentSheetInputModel =
        InitPaymentSheetInputModel(
            customerId: paymentIntentInputModel.customerId,
            paymentIntentClientSecret: paymentIntentModel.clientSecret!,
            customerEphemeralKeySecret: ephemeralKeyModel.secret!);

    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEpemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          "Stripe-Version": "2024-06-20"
        },
        url: "https://api.stripe.com/v1/ephemeral_keys",
        body: {"customer": customerId},
        token: ApiKeys.secretKey);
    EphemeralKeyModel ephemeralKeyModel =
        EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}
//client secret changes every time a new payment is created.meaning each transaction gets a new client secret.