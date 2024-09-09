import 'package:dartz/dartz.dart';
import 'package:payment_app/core/utils/errors/failure.dart';
import '../models/payment_intent_input_model.dart';
import '../models/payment_intent_model/payment_intent_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      PaymentIntentInputModel paymentIntentInputModel);
}
