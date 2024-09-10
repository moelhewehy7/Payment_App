import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment_app/core/utils/errors/failure.dart';
import 'package:payment_app/core/utils/stripe_service.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          return left(ServerFailure.fromResponse(
              e.response!.statusCode, e.response!.data));
        } else {
          return left(ServerFailure.fromDioException(e));
        }
      } else {
        return left(ServerFailure(errMessage: "Please try again later"));
      }
    }
  }
}
